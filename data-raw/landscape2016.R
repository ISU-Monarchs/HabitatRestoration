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

landscape2016 = read_dir(path = "landscape",
                     pattern = "csv$",
                     into = c("landscape",
                              "year","month","day","observer",
                              "siteID","transectID","round",
                              "extension")) %>%
  select(-landscape, -extension, -observer) 

devtools::use_data(landscape2016,
                   overwrite = TRUE)
