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

# Create survey dataframe and change values
survey <- tmp %>% 
  select(-filename, -ext, -dataset) %>%
  mutate(transectID = gsub(pattern="van2_tvan2a",  replacement="dav1_tdav1a", x=transectID)) %>%
  mutate(transectID = gsub(pattern="pre4b_tpre4b", replacement="pre8_tpre8a", x=transectID)) %>%
  mutate(transectID = gsub(pattern="pre4a_tpre4a", replacement="pre7_tpre7a", x=transectID)) %>%
  mutate(transectID = gsub(pattern="pre3b_tpre3b", replacement="pre6_tpre6a", x=transectID)) %>%
  mutate(transectID = gsub(pattern="pre3a_tpre3a", replacement="pre5_tpre5a", x=transectID)) %>%
  mutate(transectID = gsub(pattern="pre2b_tpre2b", replacement="pre4_tpre4a", x=transectID)) %>%
  mutate(transectID = gsub(pattern="pre2a_tpre2a", replacement="pre3_tpre3a", x=transectID)) %>%
  mutate(transectID = gsub(pattern="pre1b_tpre1b", replacement="pre2_tpre2a", x=transectID)) %>%
  mutate(transectID = gsub(pattern="pre1a_tpre1a", replacement="pre1_tpre1a", x=transectID))


# Drop surveys that weren't done
survey <- survey %>% drop_na(length)

# Write out csvs for each individual year
survey %>% filter(year %in% "2016") %>% write.csv(.,file = "survey/2016/survey2016.csv", row.names=FALSE)
survey %>% filter(year %in% "2017") %>% write.csv(.,file = "survey/2017/survey2017.csv", row.names=FALSE)
survey %>% filter(year %in% "2018") %>% write.csv(.,file = "survey/2018/survey2018.csv", row.names=FALSE)



usethis::use_data(survey, overwrite = TRUE)
