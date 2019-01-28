library("dplyr")
library("tidyr")
library("readr")

my_read_csv = function(f, into) {
  cat("Reading",f,"\n")
  readr::read_csv(f, 
                  col_types = readr::cols(.default = "c")) %>%
    dplyr::mutate(file=f) %>%
    tidyr::separate(file, into)
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


tmp = read_dir(path = "survey",
               pattern = "*.csv",
               into = c("dataset", "year"))

# Remove columns that are all NAs
survey <- tmp %>% 
  select_if(function(x) any(!is.na(x))) %>%
  rename(siteID = site_id,
         transectID = transect_id,
         round1 = `r1_transect_length`,
         round2 = `r2_transect_length`,
         round3 = `r3_transect_length`,
         length = `sum_transect_lengths`) %>%
  select(-dataset, year, siteID, transectID, everything()) %>%
  mutate(transectID = factor(transectID),
         siteID = factor(siteID))

# devtools::use_data(nectar,
#                    overwrite = TRUE)
