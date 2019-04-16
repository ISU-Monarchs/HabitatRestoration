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

# Create 3 data.frames: cover, milkweed, litter
# all three data.frames have these variables: year, month, day, siteID, transectID, round, section
# cover has two new variables: class and percentage
# milkweed has two new variables: milkweed_species and ramets
# litter has one new column: depth

milkweed = daubenmire %>% 
  filter(land_cover %in% c("milkweed","common_ramet","swamp_ramet","butterfly_ramet")) %>%
  rename(milkweed_species = land_cover,
         ramets = percentage)

litter = daubenmire %>% 
  filter(land_cover %in% c("litter_depth")) %>%
  rename(depth = percentage) %>%
  select(everything(), -land_cover)

cover = daubenmire %>% 
  filter(!land_cover %in% c("milkweed","common_ramet","swamp_ramet","butterfly_ramet","litter_depth")) %>%
  rename(class = land_cover)



usethis::use_data(milkweed,
                   overwrite = TRUE)

usethis::use_data(litter,
                  overwrite = TRUE)

usethis::use_data(cover,
                  overwrite = TRUE)
