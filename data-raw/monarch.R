library("dplyr")
library("tidyr")

my_read_csv = function(f, into) {
  cat("Reading",f,"\n")
  readr::read_csv(f, col_names = c("key","value")) %>%
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
                        "year","month","day","recorder",
                        "site","transect","round",
                        "extension")) %>%
  select(-monarch, -extension) %>%      

  spread(key, value) %>%   
  
  gather(distance, count,
         -year, -month, -day, -recorder, -site, -transect, -round,
         -end_time, -sky, -start_time, -temp, -wind, 
         na.rm=TRUE) %>% 
	
	mutate(count = as.numeric(count))            # some columns are character
	

devtools::use_data(monarch,
                   overwrite = TRUE)
