source("common.R")

transect <- readr::read_csv("transect/transect.csv",
                            col_types = cols(.default = "c")) %>%
  dplyr::arrange(transectID)

usethis::use_data(transect, overwrite = TRUE)
