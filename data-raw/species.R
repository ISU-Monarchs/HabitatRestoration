library("dplyr")


species = read.csv("nectar/nectar_species_scientific_name_counting_unit.txt", header=TRUE)

# Remove columns that are all NA
species <- species %>% 
  select_if(function(x) any(!is.na(x)))


usethis::use_data(species,
                   overwrite = TRUE)
