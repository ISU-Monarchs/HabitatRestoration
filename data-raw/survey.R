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
               into = c("dataset", "year", "filename", "ext"))

# Drop surveys that weren't done and unused variables: dataset, filename, ext
survey <- tmp %>% 
  select(-dataset, -filename, -ext) %>% 
  drop_na(length)



usethis::use_data(survey, overwrite = TRUE)
