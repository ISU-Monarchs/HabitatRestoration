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

# Create tmp dataframe and clean up a bit
tmpsurvey <- tmp %>% 
  select_if(function(x) any(!is.na(x))) %>% # Remove columns that are all NAs
  rename(transectID = transect_id,
         siteID = site_id,
         round1 = `r1_transect_length`,
         round2 = `r2_transect_length`,
         round3 = `r3_transect_length`,
         length = `sum_transect_lengths`) %>%
  select( -grant, -site_name,
         -dataset, -r1_date, -r2_date, -r3_date, -acres, 
         -`r3_date_bee/environment_resample`, -`total_#_rounds`) %>%
  mutate(transectID = factor(transectID),
         siteID = factor(siteID))

# Melt/gather the dataframes by round
tmp1 <- tmpsurvey %>% gather(round, transect_length, round1:round3) %>% 
  mutate(round = readr::parse_number(round)) %>% 
  select(siteID, transectID, year, round, transect_length, area_m2)

tmp2 <- tmpsurvey %>% gather(round, section_length, c(r1_section_length, r2_section_length, r3_section_length)) %>% 
  mutate(round = readr::parse_number(round)) %>% 
  select(siteID, transectID, year, round, section_length, area_m2)

tmp3 <- tmpsurvey %>% gather(round, monarch_time, c(r1_monarch_time, r2_monarch_time, r3_monarch_time)) %>% 
  mutate(round = readr::parse_number(round)) %>% 
  select(siteID, transectID, year, round, monarch_time, area_m2)

# Leftjoin the datasets to create survey dataset
survey <- tmp1 %>% 
  left_join(tmp2, by=c('siteID', 'transectID', 'year', 'round')) %>%
  left_join(tmp3, by=c('siteID', 'transectID', 'year', 'round')) %>%
  rename(length = transect_length,
         area = area_m2) %>%
  select(siteID, transectID, year, round, length, section_length, area, monarch_time, -area_m2.y, -area_m2.x)

# Drop surveys that weren't done
survey <- survey %>% drop_na(length)

# Write out csvs for each individual year
survey %>% filter(year %in% "2016") %>% write.csv(.,file = "survey/2016/survey2016.csv", row.names=FALSE)
survey %>% filter(year %in% "2017") %>% write.csv(.,file = "survey/2017/survey2017.csv", row.names=FALSE)
survey %>% filter(year %in% "2018") %>% write.csv(.,file = "survey/2018/survey2018.csv", row.names=FALSE)



usethis::use_data(survey, overwrite = TRUE)
