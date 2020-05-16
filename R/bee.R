#' Bee counts
#'
#' This data set contains the count of bees observed
#'
#' @section Data Collection Protocol:
#'
#' Bees and the nectar plants on which the bees were nectaring were surveyed by 
#' an observer walking along a permanent transect line. 
#'  
#' Observer walked a line parallel to the transect at a length of 1.5m to the 
#' left of the transect at a rate of 2minutes/10m section. Section information 
#' was removed due to inconsistent methodology from year to year, but this 
#' information is available in the raw data.
#'   
#' Surveys were conducted for 20 minutes.
#'   
#' If transect was shorter than 100m (20 minutes), observer stopped the time at 
#' the end of the transect, walked around plot, returned to start of transect, and continued survey until reaching 20 minutes (100m total).
#'   
#' Observer visually surveyed a 3m wide band along the whole length of the 
#' transect, recording every visual detection of nectaring bee and the plant it was nectaring on at the time of first observation. 
#'  
#' Observer only counted nectaring bees and did not include flying bees. 
#' Observer recorded species on plant the bee was on an these data are available 
#' in \code{\link{bee_plant}}.
#' 
#' Observer observed 180 degrees in front of themselves. 
#' 
#' @section Variable Notes:
#' 
#' *Bee Species* Only nectaring bees were counted. There were 3 possible options 
#' for bee names: *honey bee* *bumble bee* *solitary bee*
#' 
#' @format A data.frame with the following variables:
#' \itemize{
#'   \item date: Date, date of survey
#'   \item transectID: character, id of the transect
#'   \item round: character, the round number: 1, 2, or 3
#'   \item transect_length: integer, length of transect in meters
#'   \item Bee Type: character, type of bee: honey bee, bumble bee, or solitary bee
#'   \item count: integer, number of bees observed for each bee type 
#'   (NAs are due to observer misclassification)
#' }
#' 
#' @seealso \code{\link{monarch}}, \code{\link{bee_plant}}, \code{\link{bee_raw}}
#' 
"bee"


#' Bee surveys
#' 
#' A list of all surveys conducted for bees. This was primarily used to complete
#' the \code{\link{bee}} with zeros. 
#' 
#' @format A data.frame with the following columns:
#' \itemize{
#'   \item date: Date, date of survey
#'   \item round: character, round number for the survey: 1,2,3
#'   \item observer: character, name of surveyor
#'   \item transectID: character, id of the transect
#'   \item transect_length: integer, length of transect in meters
#' }
#' 
"bee_surveys"


#' Raw bee observations
#' 
#' This data set contains data as read in from the csv files. It is likely NOT
#' the data that you want to use for an analysis, instead you should (most 
#' likely) use the \code{\link{bee}} data.frame. 
#' 
#' The main purpose of this data.frame is to allow you to troubleshoot data
#' issues. If you discover a possible problem in \code{\link{bee}}, you can take
#' a look at this data.frame to determine if the error is due to the original
#' data or the processing. If you find the same error in \code{\link{bee_raw}},
#' then the error is likely in the data where if you do not find the error 
#' in \code{\link{bee_raw}}, then the error arose during data processing in the 
#' data-raw/bee.R script. 
#' 
#' Many of the section data are <NA> indicating that particular section was not
#' recorded during that survey. This is typically due to changing how sections 
#' were recorded, e.g. recording 0-20m vs 0-10m,10-20m. 
#' 
#' @format A data.frame with the following variables:
#' \itemize{
#'   \item filepath: path to the file within the data-raw/ directory
#'   \item date: Date, date of survey
#'   \item round: character, the round number: 1, 2, or 3
#'   \item siteID: character, ID of the site
#'   \item transectID: character, ID of the transect
#'   \item Bee Type: character, type of bee: honey bee, bumble bee, or solitary bee
#'   \item Nectar Plant Species: character, common name for plant
#'   \item count: integer, number of bees observed for each bee type (NAs are due to observer misclassification)
#'   \item transect_length: integer, length of transect in meters
#'   \item remaining columns contain counts for each section
#' }
#' 
"bee_raw"


#' Nectar plant bees utilized
#'
#' This data set contains the count of bees observed and the specific flowering plant they were nectaring on.
#'
#' @section Data Collection Protocol:
#' 
#' Protocol was the same as \code{\link{bee}} 
#' 
#' @section Variable Notes:
#' 
#' *Nectar Plant Species* the specific nectar plant on which the bee was nectaring 
#'    
#'      Nectar species scientific names and corresponding common names are in 
#'      \code{\link{species}}
#'      
#' *Bee Species* Only nectaring bees were counted. There were 3 possible options 
#' for bee names: *honey bee* *bumble bee* *solitary bee*
#' 
#' @format A data frame with the following variables:
#' \itemize{
#'   \item date: Date, date of survey
#'   \item round: character, the round number: 1, 2, or 3
#'   \item transectID: character, id of the transect
#'   \item transect_length: integer, length of transect (meters)
#'   \item Bee Type: character, type of bee: honey bee, bumble bee, or solitary bee
#'   \item Nectar Plant Species: character, common name for nectar plant species on which the bee was nectaring
#'   \item count: integer, number of bees observed for each bee type 
#'   (NAs refer to observer misclassification)
#' }
#' 
#' @seealso \code{\link{monarch}}, \code{\link{bee}}, \code{\link{species}}
#' 
"bee_plants"
