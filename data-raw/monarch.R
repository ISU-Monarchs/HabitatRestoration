source("common.R")

read_monarch_csv = function(f, into) {
  cat("Reading",f,"\n")
  readr::read_csv(f, 
                  col_names = c("key","value"), 
                  col_types = readr::cols(.default = "c")) %>%
    mutate(file=f) %>%
    separate(file, into)
}


###########################################################

monarch_files = list.files(path = "monarch",
                       pattern = "*.csv",
                       recursive = TRUE,
                       full.names = TRUE)

directory_and_file_structure = c("monarch",
                                 "year","month","day","observer",
                                 "siteID","transectID","round",
                                 "extension")

# Read filenames to get a complete list of all surveys completed
monarch_surveys = monarch_files %>%
  plyr::ldply(read_first_line, 
              into = directory_and_file_structure) %>%
  dplyr::mutate(date = as.Date(paste(year, month, day, sep="-"))) %>%
  dplyr::select(date, round, observer, transectID) %>%
  dplyr::arrange(date, observer, transectID)
  


monarch_raw = monarch_files %>%
  plyr::ldply(read_monarch_csv, 
              into = directory_and_file_structure) %>%
  
  dplyr::mutate(filename = paste(siteID, transectID, round, sep="_"),
                filename = paste0(filename,".",extension),
                filepath = paste(monarch, year, month, day, observer, filename, sep="/"),
                
                date = as.Date(paste(year, month, day, sep="-"))) %>%
  
  dplyr::select(-monarch, -year, -month, -day, -extension, -filename) %>%
  dplyr::select(filepath, date, round, observer, siteID, transectID, everything()) %>%
  dplyr::arrange(date, observer, transectID)



monarch = monarch_raw %>%
  
  dplyr::select(-filepath, -observer, -siteID) %>%
  dplyr::mutate(key = dplyr::recode(key, extra_monarch = "extra_monarchs")) %>%

  tidyr::spread(key, value) %>%  
  
  tidyr::gather(distance, count,
         -date, -round, -transectID, 
         -start_time, -end_time, -temp, -wind, -sky, 
         na.rm = TRUE) %>% 
	
  dplyr::mutate(
    type = NA,
    
    # Monarchs observed during survey time
    type = ifelse(distance %in% c("#_inside_plot","#_outside_plot",
                                  "bin0-5m","bin5-50m","bin>50m",
                                  "watch_monarch",
                                  "0-10m","10-20m","20-30m","30-40m","40-50m",
                                  "50-60m","60-70m","70-80m","80-90m","90-100m",
                                  "0-20m","20-40m","40-60m","60-80m","80-100m"),
                  "survey", type),
    
    # Monarchs observed outside of survey time
    type  = ifelse(distance == "extra_monarchs", "extra", type),
    
    # Ramets, eggs, instars, and palmer amaranth
    type = ifelse(distance %in% c("stems","butterfly_ramets",
                                  "common_ramets","swamp_ramets"),
                  "ramets", type),
    type = ifelse(grepl("eggs",distance), "eggs", type),
    type = ifelse(grepl("instar", distance), "instar", type),
    type = ifelse(distance == "palmer_amaranth", "palmer amaranth", type),
    
    # For ramets, eggs, and instars identify the type of milkweed 
    milkweed = NA,
    milkweed = ifelse(grepl("common",    distance), "common",    milkweed),
    milkweed = ifelse(grepl("butterfly", distance), "butterfly", milkweed),
    milkweed = ifelse(grepl("swamp",     distance), "swamp",     milkweed)) %>%
  
  
  dplyr::mutate(
    temp  = as.numeric(temp),
    count = as.integer(count),
    
    start_time = as.POSIXct(paste(date, start_time), tz = "America/Chicago", format = "%Y-%m-%d %I:%M%p"),
    end_time   = as.POSIXct(paste(date,   end_time), tz = "America/Chicago", format = "%Y-%m-%d %I:%M%p")
	       
	       )  %>%          # some columns are character
  
  # dplyr::select(-siteID) %>%
  dplyr::select(date, round, transectID, end_time, start_time, temp, wind, sky,
                type, distance, milkweed, count, everything()) %>%
  dplyr::arrange(start_time, transectID)



usethis::use_data(monarch_surveys, overwrite = TRUE)
usethis::use_data(monarch_raw,     overwrite = TRUE)
usethis::use_data(monarch,         overwrite = TRUE)
