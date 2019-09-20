library("dplyr")
library("tidyr")
library("readr")

my_read_csv = function(f, into) {
  cat("Reading",f,"\n")
  readr::read_csv(f, 
                  col_types = cols(.default = "c")) %>%
    mutate(file=f) %>%
    separate(file, into)
}

read_dir = function(path, pattern, into) {
  files = list.files(path = path,
                     pattern = pattern,
                     recursive = TRUE,
                     full.names = TRUE)
  plyr::ldply(files, my_read_csv, into = into)
}

# Above taken from https://gist.github.com/jarad/8f3b79b33489828ab8244e82a4a0c5b3

###########################################################

robel = read_dir(path = "daubenmire",
                  pattern = "csv2",
                  into = c("robel",
                           "year","month","day","observer",
                           "siteID","transectID","round",
                           "extension")) %>%
  select(-robel, -extension) %>%
         # , -observer) %>%             

  gather(distance, count,
         -Direction, 
         -year, -month, -day, 
         -siteID, -transectID, -round,
         -observer,
         na.rm = TRUE) %>%
  
  dplyr::mutate(
    # above 16, recorded as ">16" are right censored
    censored = ifelse(grepl(">", count), "right", "not"),
    count    = as.numeric(gsub(">","",count)),
    
    # convert to cm instead of # bands
    height = count*10,
    
    year  = as.numeric(year),
    month = as.numeric(month),
    day   = as.numeric(day)) %>% 
  
  dplyr::rename(section = distance) %>%
  
  dplyr::select(year, month, day, 
                siteID, transectID, round, section,
                observer, Direction, height, censored)
	
usethis::use_data(robel, overwrite = TRUE)
