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

daubenmire = read_dir(path = "daubenmire",
                  pattern = "csv$",
                  into = c("daubenmire",
                           "year","month","day","observer",
                           "siteID","transectID","round",
                           "extension")) %>%
  select(-daubenmire, -extension) %>%
         # , -observer) %>%

  gather(land_cover, percentage,
         -section, 
         -year, -month, -day, 
         -siteID, -transectID, -round,
         -observer,
         na.rm = TRUE) %>%
  
  mutate(percentage = as.numeric(gsub("<","",percentage)),
         
         year = as.numeric(year),
         month = as.numeric(month),
         day = as.numeric(day),
         
         round = as.numeric(round)) %>%
  
  select(year, month, day, siteID, transectID, round, section,
         observer,
         land_cover, percentage)

# Need to create 3 data.frames: cover, milkweed, litter
# see issue #38
#
# all three data.frames have these variables: year, month, day, siteID, transectID, round, section
# cover has two new variables: class and percentage
# milkweed has two new variables: milkweed_species and ramets
# litter has one new column: depth


usethis::use_data(daubenmire,
                   overwrite = TRUE)
