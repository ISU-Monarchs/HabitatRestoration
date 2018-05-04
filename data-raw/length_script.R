library("readxl")
library("dplyr")


tmp <- readxl::read_excel("Site Metadata Git 4-7-17.xlsx", 
                          sheet = 1,
                          na = c("","NA")) 
tmp <- tmp[, !duplicated(names(tmp))]

# 2016
length_2016 <- tmp %>%
  rename(transectID   = transect_id,
         round1 = `2016_r1_transect_length`,
         round2 = `2016_r2_transect_length`,
         round3 = `2016_r3_transect_length`) %>%
  select(transectID, round1, round2, round3) %>%
  tidyr::gather(round, length, -transectID) %>%
  mutate(transectID = factor(transectID),
         year = 2016)

# 2017
length_2017 <- tmp %>%
  mutate(transectID   = transect_id,
         
         # This is hacky, but all rounds in 2017 had the same length.
         # But were surveys done in all rounds?
         round1 = final_transect_length,
         round2 = final_transect_length,
         round3 = final_transect_length) %>%
  select(transectID, round1, round2, round3) %>%
  tidyr::gather(round, length, -transectID) %>%
  mutate(transectID = factor(transectID),
         year = 2017)

length <- bind_rows(length_2016,
                    length_2017)

devtools::use_data(length, overwrite = TRUE)