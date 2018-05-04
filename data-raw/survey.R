# Other scripts in this directory need access to the survey data.frame. 
# Thus, we need to be able to run the script without creating new data within
# the package.

source("survey_script.R")

devtools::use_data(survey, overwrite = TRUE)