library(dplyr)
library(tidyr)
library(readr)

my_read_csv = function(f, into) {
  cat("Reading",f,"\n")
  readr::read_csv(f, col_types = cols(.default = "c")) %>%
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

environment = read_dir(path = "environment",
                  pattern = "csv$",
                  into = c("environment",
                           "year","month","day","recorder",
                           "site","transect","round",
                           "extension")) %>%
  select(-environment, -extension) 
	
devtools::use_data(environment,
                   overwrite = TRUE)
