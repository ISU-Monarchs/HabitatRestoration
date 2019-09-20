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
                           "year","month","day","observer",
                           "siteID","transectID","round",
                           "extension")) %>%
  dplyr::select(-nectar, -extension) %>%
                # , -observer) %>%             # Might want to include type in the future

  # rename(nectar_plant_species = `Nectar Plant Species`) %>%

  tidyr::gather(distance, count,
         -`Nectar Plant Species`, 
         -year, -month, -day, 
         -siteID, -transectID, -round,
         -observer,
         na.rm=TRUE) %>% 
	
  dplyr::group_by(`Nectar Plant Species`, year, month, day, siteID, transectID,
                  round, distance, observer) %>%
  
	dplyr::summarize(count = sum(count)) %>%
  
  ungroup %>%
  
  dplyr::mutate(year  = as.numeric(year),
                month = as.numeric(month),
                day   = as.numeric(day),
                
                siteID     = siteID,
                transectID = transectID) %>%
  
  dplyr::rename(section = distance) %>%
  
  dplyr::select(year, month, day, 
                siteID, transectID, 
                round, section,
                observer,
                everything())


# Get names with Ramet in them
rametnm <- unique(nectar$`Nectar Plant Species`[grep("ramet", nectar$`Nectar Plant Species`)])

# Create `ramet` data.frame from nectar where species are ramet type
ramet <- nectar %>% filter(`Nectar Plant Species` %in% rametnm)

# Remove ramet species from nectar data.frame 
nectar <- nectar %>% filter(!(`Nectar Plant Species` %in% rametnm))
nectar %>% filter(`Nectar Plant Species` %in% rametnm) # quick check to make sure that the ramet names are removed.
                                                       # should print no data


usethis::use_data(nectar, overwrite = TRUE)
usethis::use_data(ramet, overwrite = TRUE)