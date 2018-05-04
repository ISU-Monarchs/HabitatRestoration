# Other scripts in this directory need access to the length data.frame. 
# Thus, we need to be able to run the script without creating new data within
# the package.

source("length-script.R")

devtools::use_data(length, overwrite = TRUE)