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
  select(-na,-type,-extension) %>%             # Might want to include type in the future

  rename(species = `Nectar Plant Species`) %>%

  gather(distance, count,
         -species, -year, -month, -day, -recorder, -site, -transect, -round,
         na.rm=TRUE)

#   # The above gather should really explicitly gather the distances, but the code below doesn't work
#   # because the gather does not recognize the column names.
#   #
#   # Convert from wide to long format for distances
#   gather_(key_col     = "distance",
#           value_col   = "count",
#           gather_cols = c("0-19m", "20-39m", "40-50m", "60-79m", "80-100m"),
#           na.rm       = TRUE) %>%

devtools::use_data(nectar,
                   overwrite = TRUE)
