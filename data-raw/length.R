library("readxl")
library("dplyr")


tmp <- read_excel("Site Metadata Git 4-7-17.xlsx", 1) 
tmp <- tmp[, !duplicated(names(tmp))]

length <- tmp %>%
  rename(site   = site_id,
         round1 = r1_transect_length,
         round2 = r2_transect_length,
         round3 = r3_transect_length) %>%
  select(site, round1, round2, round3) %>%
  tidyr::gather(round, length, -site) %>%
  mutate(length = as.numeric(length)) %>%
  na.omit() %>%
  group_by(site) %>%
  summarize(length = sum(length))

devtools::use_data(length, overwrite = TRUE)