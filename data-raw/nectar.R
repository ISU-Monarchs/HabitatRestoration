source("common.R")

read_nectar_csv = function(f, into) {
  # cat("Reading",f,"\n")
  readr::read_csv(f, 
                  col_types = readr::cols(
                    "Nectar Plant Species" = "c",
                    .default               = "i")) %>%
    dplyr::mutate(file=f) %>%
    tidyr::separate(file, into)
}



###########################################################

nectar_files = list.files(path = "nectar",
                       pattern = "*.csv",
                       recursive = TRUE,
                       full.names = TRUE)

directory_and_file_structure = c("nectar",
                                 "year","month","day","observer",
                                 "siteID","transectID","round",
                                 "extension")

nectar_surveys = nectar_files %>%
  plyr::ldply(read_first_line, 
              into = directory_and_file_structure)  %>%
  
  tidyr::pivot_longer(
    cols = starts_with("X"),
    names_to = "nothing",
    values_to = "section",
    values_drop_na = TRUE
  ) %>%
  
  dplyr::filter(section != "Nectar Plant Species") %>%
  
  dplyr::mutate(date = as.Date(paste(year, month, day, sep="-"))) %>%
  
  # dplyr::group_by(date, round, observer, transectID) %>%
  # dplyr::summarize(transect_length = max_length(sections)) %>% 
  # ungroup() %>%
  
  dplyr::select(date, round, observer, transectID, section) %>%
  dplyr::arrange(date, round, observer, transectID)


nectar_raw = nectar_files %>%
  plyr::ldply(read_nectar_csv, 
              into = directory_and_file_structure) %>%
  
  dplyr::mutate(filename = paste(siteID, transectID, round, sep="_"),
                filename = paste0(filename,".",extension),
                filepath = paste(nectar, year, month, day, observer, filename, sep="/"),
                
                date = as.Date(paste(year, month, day, sep="-"))) %>%
  
  dplyr::select(-nectar, -year, -month, -day, -extension, -filename) %>%
  dplyr::select(filepath, date, round, observer, siteID, transectID, everything()) %>%
  dplyr::arrange(date, observer, transectID)



# The following data.frame is used to `complete` the nectar data with 
# missing counts. We use this rather than `complete` because there are surveys 
# where nothing was observed and thus are completely missing from the 
# `nectar_raw` data.frame.
nectar_surveys_with_plant_species <- nectar_surveys %>%
  merge(tibble::tibble(`Nectar Plant Species` = unique(nectar_raw$`Nectar Plant Species`)), 
    by = NULL)


nectar_and_ramets = nectar_raw %>%

  dplyr::select(-filepath, -observer, -siteID) %>%
  
  tidyr::gather(section, count,
         -`Nectar Plant Species`, -date, -round, -transectID, 
         na.rm = TRUE) %>% 
  
  # Add missing zeros for surveys done, but missing in the data set.
  dplyr::right_join(nectar_surveys_with_plant_species,
                    by = c("date","round", "transectID","section",
                           "Nectar Plant Species")) %>%
  tidyr::replace_na(list(count = 0, section = "none")) %>%
  
  dplyr::mutate(count = as.integer(count)) %>%

  dplyr::select( date, round, transectID, section, `Nectar Plant Species`, count) %>%
  dplyr::arrange(date, round, transectID, section, `Nectar Plant Species`)


nectar = nectar_and_ramets %>% filter(!grepl("ramet", `Nectar Plant Species`))

ramet  = nectar_and_ramets %>% 
  dplyr::filter( grepl("ramet", `Nectar Plant Species`)) %>%
  dplyr::rename(milkweed = `Nectar Plant Species`) %>%
  dplyr::mutate(in_strip = ifelse(grepl("milkweed strip:",milkweed), "Yes", "No"),
                milkweed = gsub("milkweed strip:", "", milkweed)) 

# This eliminates sections and computes transect_length, but maybe we should 
# keep information about sections.
# nectar_surveys <- nectar_surveys %>%
#   dplyr::group_by(date, round, observer, transectID) %>%
#   dplyr::summarize(transect_length = max_length(section)) %>%
#   dplyr::ungroup() %>%
#   dplyr::arrange(date, round, transectID)

usethis::use_data(nectar_raw,     overwrite = TRUE)
usethis::use_data(nectar_surveys, overwrite = TRUE)
usethis::use_data(nectar,         overwrite = TRUE)
usethis::use_data(ramet,          overwrite = TRUE)
