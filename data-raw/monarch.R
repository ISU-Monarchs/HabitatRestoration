library("dplyr")
library("tidyr")

my_read_csv = function(f, into) {
  cat("Reading",f,"\n")
  readr::read_csv(f, 
                  col_names = c("key","value"), 
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

monarch = read_dir(path = "monarch",
               pattern = "*.csv",
               into = c("monarch",
                        "year","month","day","observer",
                        "siteID","transectID","round",
                        "extension")) %>%
  
  select(-monarch, -extension) %>%
         # , -observer) %>%

  spread(key, value) %>%  
  
  mutate(extra_monarchs = ifelse(is.na(extra_monarchs), extra_monarch, extra_monarchs)) %>% 
  select(-extra_monarch) %>%
  
  gather(distance, count,
         -year, -month, -day, -siteID, -transectID, -round,
         -end_time, -sky, -start_time, -wind, -temp,
         -observer,
         na.rm = TRUE) %>% 
	
	mutate(year  = as.numeric(year),
	       month = as.numeric(month),
	       day   = as.numeric(day),
	       
	       temp  = as.numeric(temp),
	       count = as.integer(count),
	       
	       )  %>%          # some columns are character
	select(year, month, day, siteID, transectID, round, observer, everything())

usethis::use_data(monarch, overwrite = TRUE)
