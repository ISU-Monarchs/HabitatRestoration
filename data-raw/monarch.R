library("dplyr")
library("tidyr")

my_read_csv = function(f, into) {
  cat("Reading",f,"\n")
  readr::read_csv(f, 
                  col_names = c("key","value"), 
                  col_types = readr::cols(.default = "c")) %>%
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
	
  mutate(
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
    type  = ifelse(distance == "extra_monarchs",
                   "extra", type),
    
    # Ramets, eggs, instars, and palmer amaranth
    type = ifelse(distance %in% c("stems","butterfly_ramets",
                                  "common_ramets","swamp_ramets"),
                  "ramets",type),
    type = ifelse(grepl("eggs",distance), "eggs", type),
    type = ifelse(grepl("instar", distance), "instar", type),
    type = ifelse(distance == "palmer_amaranth", "palmer amaranth", type)) %>%
  
	mutate(year  = as.numeric(year),
	       month = as.numeric(month),
	       day   = as.numeric(day),
	       
	       temp  = as.numeric(temp),
	       count = as.integer(count)
	       
	       )  %>%          # some columns are character
	select(year, month, day, siteID, transectID, round, observer, everything())

usethis::use_data(monarch, overwrite = TRUE)
