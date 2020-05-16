source("common.R")

read_robel_csv = function(f, into) {
  # cat("Reading",f,"\n")
  readr::read_csv(f, 
                  col_types = cols(.default = "c")) %>%
    mutate(file=f) %>%
    separate(file, into)
}

###########################################################

robel_files = list.files(path = "daubenmire",
                              pattern = "csv2",
                              recursive = TRUE,
                              full.names = TRUE)

directory_and_file_structure = c("robel",
                                 "year","month","day","observer",
                                 "siteID","transectID","round",
                                 "extension")

robel_surveys = robel_files %>%
  plyr::ldply(read_first_line, skip = 0,
              into = directory_and_file_structure) %>%
  
  # tidyr::pivot_longer(
  #   cols = starts_with("X"),
  #   names_to = "nothing",
  #   values_to = "section"
  # ) %>%
  # dplyr::filter(substr(section,1,1) %in% 0:10) %>%
  
  dplyr::mutate(date = as.Date(paste(year, month, day, sep="-"))) %>%
  dplyr::select(date, round, transectID, observer) %>%
  dplyr::arrange(date, transectID)


robel_raw = robel_files %>%
  plyr::ldply(read_robel_csv, 
              into = directory_and_file_structure) %>%
  
  dplyr::mutate(filename = paste(siteID, transectID, round, sep="_"),
                filename = paste0(filename,".",extension),
                filepath = paste(robel, year, month, day, observer, filename, sep="/"),
                
                date = as.Date(paste(year, month, day, sep="-"))) %>%
  
  dplyr::select(-robel, -year, -month, -day, -extension, -filename) %>%
  dplyr::select(filepath, date, round, observer, siteID, transectID, everything()) %>%
  dplyr::arrange(date, observer, transectID)


robel = robel_raw %>%
  select(-filepath, -observer, -siteID) %>%
         # , -observer) %>%             

  gather(section, n_bands,
         -Direction, -date, -round, -transectID, 
         na.rm = TRUE) %>%
  
  dplyr::mutate(
    # above 16, recorded as ">16" are right censored
    censored = ifelse(grepl(">", n_bands), "right", "not"),
    n_bands    = as.numeric(gsub(">","",n_bands)),
    
    # 10 cm per band
    height = n_bands * 10) %>% 
  
  dplyr::select(date, round, transectID, section, Direction, height, censored)
	

usethis::use_data(robel_surveys, overwrite = TRUE)
usethis::use_data(robel_raw,     overwrite = TRUE)
usethis::use_data(robel,         overwrite = TRUE)
