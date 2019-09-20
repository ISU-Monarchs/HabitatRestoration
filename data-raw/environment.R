library("dplyr")
library("tidyr")

my_read_csv = function(f, into) {
  cat("Reading",f,"\n")
  readr::read_csv(f, 
                  col_names = c("variable","value"),
                  col_types = "cc") %>%
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

environment <- read_dir(path = "environment",
               pattern = "*.csv",
               into = c("environment",
                        "year","month","day","observer",
                        "siteID","transectID","round",
                        "extension")) %>%
  select(-environment, -extension) %>%
         # , -observer) %>%
  tidyr::spread(variable, value)

# Remove quotes from column names
names(environment) <- gsub('“', '', names(environment)) 
names(environment) <- gsub('”', '', names(environment))

environment <- environment %>%

  mutate(year           = as.numeric(year),
         month          = as.numeric(month),
         day            = as.numeric(day),
         
         milkweed_ramet = as.integer(milkweed_ramet),
         temperature    = as.numeric(temperature),
         wind           = as.numeric(wind),
         
         currently_flowering_plants = factor(currently_flowering_plants,
                                             levels = c("0","0-5","5-25","25-50","50-75"))) %>%
  
  select(year, month, day, 
         siteID, transectID, round, 
         currently_flowering_plants, dominant_flowering_species, milkweed_ramet,
         sky, temperature, wind)

usethis::use_data(environment,
                   overwrite = TRUE)
