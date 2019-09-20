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

bee = read_dir(path = "bee",
               pattern = "*.csv",
               into = c("bee",
                        "year","month","day","observer",
                        "siteID","transectID","round",
                        "extension")) %>%
  
  # Some data files used Bee Species and others used Pollinator Species
  mutate(`Bee Species` = ifelse(is.na(`Bee Species`), 
                                `Pollinator Species`,
                                `Bee Species`)) %>%
  
  select(-bee, -extension, -`Pollinator Species`) %>% 
         #, -observer) %>%      
  
  # rename(nectar_plant_species = `Nectar Plant Species`,
  #        `Pollinator Species`) %>%
  
  gather(distance, count,
         -`Nectar Plant Species`, 
         -`Bee Species`,
         -year, -month, -day, -siteID, -transectID, -round, 
         -observer,
         na.rm=TRUE) %>% 
	
	mutate(count = as.numeric(count),
	       year  = as.numeric(year),
	       month = as.numeric(month),
	       day   = as.numeric(day),
	       
	       section = distance) %>%      # some columns are character
  
  dplyr::select(year, month, day, 
                siteID, transectID, 
                round, section,
                observer,
                everything(),
                -distance)
	

#   # The above gather should really explicitly gather the distances, but the code below doesn't work
#   # because the gather does not recognize the column names.
#   #
#   # Convert from wide to long format for distances
#   gather_(key_col     = "distance",
#           value_col   = "count",
#           gather_cols = c("0-19m", "20-39m", "40-50m", "60-79m", "80-100m"),
#           na.rm       = TRUE) %>%

usethis::use_data(bee,
                   overwrite = TRUE)
