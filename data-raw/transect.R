library("dplyr")

tmp <- readxl::read_excel("metadata/Site Info Metadata.xlsx", 
                            sheet = 1,
                            na = c("","NA")) 
tmp <- tmp[, !duplicated(names(tmp))]

transect <- tmp %>%
  select(site_id, transect_id) %>%
  rename(siteID     = site_id,
         transectID = transect_id)

usethis::use_data(transect, overwrite = TRUE)
