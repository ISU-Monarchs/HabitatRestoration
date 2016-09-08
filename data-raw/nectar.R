require(dplyr)
require(tidyr)

my_read_csv = function(f, into) {
  readr::read_csv(f) %>%
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

nectar = read_dir(path = ".",
             pattern = "*.csv",
             into = c("na","type",
               "year","month","day","recorder",
               "site","transect","round",
               "extension")) %>%
  select(-na,-extension)

devtools::use_data(nectar,
                   overwrite = TRUE)
