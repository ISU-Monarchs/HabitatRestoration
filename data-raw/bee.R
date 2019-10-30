library("dplyr")
library("tidyr")

my_read_csv = function(f, into) {
  cat("Reading",f,"\n")
  readr::read_csv(f, 
                  skip = 1,
                  col_types = readr::cols(.default = "c")) %>%
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

# Read filenames to get a complete list of all surveys completed
surveys = list.files(path = "bee",
                     pattern = "*.csv",
                     recursive = TRUE,
                     full.names = TRUE) %>%
  
  as.data.frame(stringsAsFactors = FALSE) %>%
  
  tidyr::separate(col = 1,
                  into = c("bee","year","month","day","observer",
                           "siteID","transectID","round","extension")) %>%
  dplyr::select(-bee, -extension, -siteID)


# Read file contents to get all non-zero counts
# If a file has no rows (other than a header), the data are missing but are 
# imputed below based on surveys data.frame above
bee_and_plants = read_dir(path = "bee",
               pattern = "*.csv",
               into = c("bee",
                        "year","month","day","observer",
                        "siteID","transectID","round",
                        "extension")) %>%
  
  # Some data files used Bee Species and others used Pollinator Species
  dplyr::mutate(`Bee Species` = ifelse(is.na(`Bee Species`), 
                                `Pollinator Species`,
                                `Bee Species`)) %>%
  
  dplyr::select(-bee, -extension, -`Pollinator Species`, -siteID) %>% 
  
  tidyr::gather(distance, count,
         -`Nectar Plant Species`, 
         -`Bee Species`,
         -year, -month, -day, -transectID, -round, 
         -observer) %>% 
  
  
  # Gather data across sections since sections aren't consistent across years
  mutate(count = as.integer(count)) %>% 
  group_by(`Nectar Plant Species`,`Bee Species`, year, month, day, transectID, round, observer) %>%  
  summarize(count = sum(count, na.rm = TRUE)) %>% # non-existent distances are given NA counts
  ungroup() %>%

  
  # Add missing zeros for surveys done, but missing in the data set
  # surveys data.frame, constructed above from file names, includes all surveys
  dplyr::full_join(surveys, by = names(surveys)) %>%
  tidyr::complete(
    nesting(transectID, year, month, day, round, observer), `Bee Species`, 
    fill = list(count = 0)) %>%
  
  dplyr::filter(!is.na(`Bee Species`)) %>% # It's unclear how these NAs arise
  
  
  # observer misclassification: look-alike insects as solitary bees
  dplyr::mutate(count = ifelse(observer == "CodyA" & `Bee Species` == "solitary bee",
                              NA, count)) %>%
  
	dplyr::mutate(
	  year  = as.numeric(year),
	  month = as.numeric(month),
	  day   = as.numeric(day),
	  
	  count = as.integer(count)) %>%      # some columns are character
  
  dplyr::select(year, month, day, transectID, round, 
                `Nectar Plant Species`, `Bee Species`, count)
	

###############################################################################

bee_plants <- bee_and_plants %>%
  filter(!is.na(`Nectar Plant Species`), 
         !is.na(count)) # should only exclude the misclassification above


###############################################################################

bee <- bee_and_plants %>%
  group_by(year, month, day, transectID, round, `Bee Species`) %>%
  summarize(count = sum(count)) # NAs in count should be due to misclassification above




usethis::use_data(bee,        overwrite = TRUE)
usethis::use_data(bee_plants, overwrite = TRUE)
