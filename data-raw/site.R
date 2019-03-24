library("dplyr")


site <- read.csv("transect/site_details.csv", header=TRUE)

# Remove 'X' from names of stie df
colnames(site) <- gsub("^X", "",  colnames(site))


usethis::use_data(site, overwrite = TRUE)
