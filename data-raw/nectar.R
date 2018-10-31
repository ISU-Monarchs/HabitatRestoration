library("dplyr")
# library("tidyr")
# library("readr")

my_read_csv = function(f, into) {
  cat("Reading",f,"\n")
  readr::read_csv(f, 
                  col_types = readr::cols(
                    "Nectar Plant Species" = "c",
                    .default               = "i")) %>%
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

nectar = read_dir(path = "nectar",
                  pattern = "*.csv",
                  into = c("nectar",
                           "year","month","day","recorder",
                           "siteID","transectID","round",
                           "extension")) %>%
  dplyr::select(-nectar, -extension) %>%             # Might want to include type in the future

  # rename(nectar_plant_species = `Nectar Plant Species`) %>%

  tidyr::gather(distance, count,
         -`Nectar Plant Species`, 
         -year, -month, -day, 
         -recorder, -siteID, -transectID, -round,
         na.rm=TRUE) %>% 
	
  dplyr::group_by(`Nectar Plant Species`, year, month, day, siteID, transectID,
                  round) %>%
  
	dplyr::summarize(count = sum(count)) %>%
  
  ungroup %>%
  
  dplyr::mutate(siteID     = factor(siteID),
                transectID = factor(transectID),
                
                year = as.numeric(year))
	

devtools::use_data(nectar,
                   overwrite = TRUE)
