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
  dplyr::select(-daubenmire, -extension) %>%
  # , -observer) %>%
  
  tidyr::gather(land_cover, percentage,
                -section, 
                -year, -month, -day, 
                -siteID, -transectID, -round,
                -observer,
                na.rm = TRUE) %>%
  
  dplyr::mutate(percentage = gsub("<","",percentage),
                percentage = gsub(">","",percentage),
                percentage = as.numeric(percentage),
                
                year = as.numeric(year),
                month = as.numeric(month),
                day = as.numeric(day)) %>%
  
  dplyr::select(year, month, day, siteID, transectID, round, section,
                observer,
                land_cover, percentage)

# Create 3 data.frames: cover, milkweed, litter
# all three data.frames have these variables: year, month, day, siteID, transectID, round, section
# cover    has two new variables: class, percentage
# milkweed has two new variables: milkweed_species, ramets
# litter   has one new variable : depth

milkweed = daubenmire %>% 
  dplyr::filter(land_cover %in% c("common_ramet","swamp_ramet","butterfly_ramet")) %>%
  dplyr::rename(
    milkweed_species = land_cover,
    ramets = percentage) %>%
  dplyr::mutate(ramets = as.integer(ramets))

litter = daubenmire %>% 
  dplyr::filter(land_cover %in% c("litter_depth")) %>%
  dplyr::rename(depth = percentage) %>%
  dplyr::select(everything(), -land_cover)

cover = daubenmire %>% 
  dplyr::filter(!land_cover %in% c("common_ramet","swamp_ramet",
                                   "butterfly_ramet","litter_depth")) %>%
  dplyr::rename(class = land_cover)



usethis::use_data(milkweed,  overwrite = TRUE)
usethis::use_data(litter,    overwrite = TRUE)
usethis::use_data(cover,     overwrite = TRUE)
