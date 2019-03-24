library(dplyr)


landcover <- read.csv("land_cover/land_cover.csv", header=TRUE)

usethis::use_data(landcover, overwrite = TRUE)
