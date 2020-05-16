source("common.R")

read_bee_csv = function(f, into) {
  # cat("Reading",f,"\n")
  readr::read_csv(f, 
                  skip = 1,
                  col_types = readr::cols(.default = "c")) %>%
    mutate(file = f) %>%
    separate(file, into)
}

###########################################################

bee_files = list.files(path = "bee",
                       pattern = "*.csv",
                       recursive = TRUE,
                       full.names = TRUE)

directory_and_file_structure = c("bee",
                                 "year","month","day","observer",
                                 "siteID","transectID","round",
                                 "extension")


# Read filenames to get a complete list of all surveys completed
bee_surveys = bee_files %>%
  plyr::ldply(read_first_line, skip = 1,
              into = directory_and_file_structure) %>%
  
  tidyr::pivot_longer(
    cols = starts_with("X"),
    names_to = "nothing",
    values_to = "section"
  ) %>%
  dplyr::filter(substr(section,1,1) %in% 0:10) %>%
  
  dplyr::mutate(date = as.Date(paste(year, month, day, sep="-"))) %>%
  dplyr::select(date, round, observer, transectID, section) %>%
  dplyr::arrange(date, transectID, section)
  





# Read files to get all non-zero counts
bee_raw = bee_files %>%
  plyr::ldply(read_bee_csv, into = directory_and_file_structure) %>%
  
  dplyr::mutate(filename = paste(siteID, transectID, round, sep="_"),
                filename = paste0(filename,".",extension),
                filepath = paste(bee, year, month, day, observer, filename, sep="/"),
                
                date = as.Date(paste(year, month, day, sep="-")),
                
                # Some data files used Bee Species and others used Pollinator Species
                `Bee Species` = ifelse(is.na(`Bee Species`), 
                                       `Pollinator Species`,
                                       `Bee Species`)) %>%
  
  dplyr::rename(`Bee Type` = `Bee Species`) %>%
  
  dplyr::select(-bee, -extension, -`Pollinator Species`, -filename,
                -year, -month, -day) %>%
  dplyr::select(filepath, date, round, observer, siteID, transectID,
                `Bee Type`, `Nectar Plant Species`, everything()) %>%
  dplyr::arrange(date, observer, transectID)


# The following data.frame is used to `complete` the bee data with missing counts
# we use this rather than `complete` because there are surveys where nothing
# was observed and thus are completely missing from the `bee_raw` data.frame
bee_surveys_with_bee_types <- bee_surveys %>%
  merge(tibble::tibble(`Bee Type` = unique(bee_raw$`Bee Type`)), by = NULL)


bee <- bee_raw   %>%
  
  dplyr::select(-`Nectar Plant Species`, -siteID, -filepath) %>%
  
  tidyr::gather(section, count,
         -`Bee Type`,
         -date, -transectID, -round, -observer) %>% 
  
  # Bee data are duplicated because they are recorded by plant type
  # Since we are ignoring plant type for data, we aggregate these counts.
  dplyr::group_by(date, round, observer, transectID, section, `Bee Type`) %>%
  dplyr::summarize(count = sum(as.integer(count), na.rm = TRUE)) %>%
  ungroup() %>%
  
  # Add missing zeros for surveys done, but missing in the data set.
  dplyr::right_join(bee_surveys_with_bee_types,
                    by = c("date","round","transectID","observer","section","Bee Type")) %>%
  tidyr::replace_na(list(count = 0)) %>%
  
  # Gather data across sections since sections aren't consistent across years
  # dplyr::mutate(count = as.integer(count)) %>% 
  # dplyr::group_by(`Bee Type`, date, transectID, round, observer) %>%  
  # dplyr::summarize(count = sum(count, na.rm = TRUE)) %>% # non-existent combinations are given NA counts
  # dplyr::ungroup() %>%
  
  # observer misclassified look-alike insects as solitary bees
  dplyr::mutate(count = ifelse(observer == "CodyA" & 
                                 `Bee Type` == "solitary bee",
                               NA, count)) %>%

  dplyr::select(date, round, transectID, section, `Bee Type`, count) %>%
  dplyr::arrange(date, transectID, section)
	

###############################################################################

# The following data.frame is used to `complete` the bee data with missing counts
# we use this rather than `complete` because there are surveys were nothing
# was observed and thus are completely missing from the `bee_raw` data.frame
bee_surveys_with_plants <- bee_surveys %>%
  merge(expand.grid(`Bee Type` = unique(bee_raw$`Bee Type`),
                    `Nectar Plant Species` = unique(bee_raw$`Nectar Plant Species`),
                    stringsAsFactors = FALSE), 
        by = NULL) %>%
  dplyr::arrange(date, transectID, section, `Bee Type`, `Nectar Plant Species`)



cat("Creating bee_plants.\n")
bee_plants <- bee_raw %>%
  
  dplyr::select(-siteID, -filepath) %>%
  
  tidyr::gather(section, count,
                -date, -transectID, -round, -observer, 
                -`Bee Type`, -`Nectar Plant Species`) %>% 
  
  # Observations are duplicated, see e.g. 
  # data-raw/2016/06/28/KelseyFJohnP/byd2_tbyd2a_1.pdf
  # this will remove duplications
  dplyr::group_by(date, round, transectID, observer, section,
                  `Nectar Plant Species`, `Bee Type`) %>%
  dplyr::summarize(count = sum(as.integer(count), na.rm = TRUE)) %>%
  ungroup() %>%
  
  # Add missing zeros for surveys done, but missing in the data set
  # bee_surveys data.frame, constructed above from file names, includes all surveys
  dplyr::right_join(bee_surveys_with_plants,
                    by = c("date","round", "transectID","section","observer",
                           "Nectar Plant Species", "Bee Type")) %>%
  tidyr::replace_na(list(count = 0)) %>%
  dplyr::mutate(count = as.integer(count)) %>%
  
  # observer misclassified look-alike insects as solitary bees
  dplyr::mutate(count = ifelse(observer == "CodyA" & 
                                 `Bee Type` == "solitary bee",
                               NA, count)) %>%
  
  dplyr::select(date, round, transectID, section,
                `Bee Type`, `Nectar Plant Species`, count)


usethis::use_data(bee_surveys, overwrite = TRUE)
usethis::use_data(bee_raw,     overwrite = TRUE)
usethis::use_data(bee,         overwrite = TRUE)
usethis::use_data(bee_plants,  overwrite = TRUE)
