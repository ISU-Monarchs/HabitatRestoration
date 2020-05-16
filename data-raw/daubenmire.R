source("common.R")

read_daubenmire_csv = function(f, into) {
  # cat("Reading",f,"\n")
  readr::read_csv(f, 
                  col_types = cols(.default = "c")) %>%
    mutate(file=f) %>%
    separate(file, into)
}

###########################################################

daubenmire_files = list.files(path = "daubenmire",
                       pattern = "csv$",
                       recursive = TRUE,
                       full.names = TRUE)

directory_and_file_structure = c("daubenmire",
                                 "year","month","day","observer",
                                 "siteID","transectID","round",
                                 "extension")

daubenmire_surveys = daubenmire_files %>%
  plyr::ldply(read_daubenmire_csv,
              into = directory_and_file_structure) %>%
  dplyr::mutate(date = as.Date(paste(year, month, day, sep="-"))) %>%
  dplyr::select(date, round, observer, transectID, section) %>%
  dplyr::arrange(date, transectID, section)


daubenmire_raw = daubenmire_files %>%
  plyr::ldply(read_daubenmire_csv, 
              into = directory_and_file_structure) %>%
  
  dplyr::mutate(filename = paste(siteID, transectID, round, sep="_"),
                filename = paste0(filename,".",extension),
                filepath = paste(daubenmire, year, month, day, observer, filename, sep="/"),
                
                date = as.Date(paste(year, month, day, sep="-"))) %>%
                  
  dplyr::select(-daubenmire, -year, -month, -day, -extension, -filename) %>%
  dplyr::select(filepath, date, round, observer, siteID, transectID, everything()) %>%
  dplyr::arrange(date, observer, transectID, section)



# The following data.frame is used to `complete` the daubenmire data with 
# missing counts. We use this rather than `complete` because there are surveys 
# where nothing was observed and thus are completely missing from the 
# `daubenmire_raw` data.frame.
daubenmire_surveys_with_cover_types <- daubenmire_surveys %>%
  merge(tibble::tibble(land_cover = names(daubenmire_raw)[-c(1:7)]), by = NULL)


daubenmire <- daubenmire_raw %>%
  
  dplyr::select(-filepath, -siteID) %>%
  
  tidyr::pivot_longer(
    cols = c("csg","wsg","forbs","milkweed","woody_species","bare_ground",
             "leaf_litter","litter_depth","common_ramet","swamp_ramet","butterfly_ramet"),
    names_to = "land_cover",
    values_to = "percentage"
  ) %>%
  
  dplyr::mutate(percentage = gsub("<","",percentage),
                percentage = gsub(">","",percentage),
                percentage = as.numeric(percentage)) %>%
  
  # Add missing zeros for surveys done, but missing in the data set.
  dplyr::right_join(daubenmire_surveys_with_cover_types,
                    by = c("date","round", "observer", "transectID", "section",
                           "land_cover")) %>%
  tidyr::replace_na(list(percentage = 0)) %>%
  
  dplyr::select(date, round, transectID, section, land_cover, percentage) %>%
  dplyr::arrange(date, transectID, section)

# Create 3 data.frames: cover, milkweed, litter
# all three data.frames have these variables: date, transectID, round, section
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



usethis::use_data(daubenmire_raw,      overwrite = TRUE)
usethis::use_data(daubenmire_surveys,  overwrite = TRUE)
usethis::use_data(milkweed,            overwrite = TRUE)
usethis::use_data(litter,              overwrite = TRUE)
usethis::use_data(cover,               overwrite = TRUE)
