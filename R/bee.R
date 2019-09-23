#' Bee species and nectar plant species bees utilized
#'
#' This data set contains the count of bees observed and the specific flowering plant they were nectaring on observed within certain sections of a transect.
#'
#' @section Data Collection Protocol:
#' 
#' Bees and the nectar plants on which the bees were nectaring were surveyed by an observer walking along a permanent transect line. 
#'  
#' Observer walked a line parallel to the transect at a length of 1.5m to the left of the transect at a rate of 2minutes/10m section.
#'   
#' Surveys were conducated for 20 minutes.
#'   
#' If transect was shorter than 100m (20 minutes), observer stopped the time at the end of the transect, walked around plot, returned to start of transect, and continued survey until reaching 20 minutes (100m total).
#'   
#' Observer visually surveyed a 3m wide band along the whole length of the transect, recording every visual detection of nectaring bee and the plant it was nectaring on at the time of first observation. 
#'  
#' Observer only counted nectaring bees and did not include flying bees.  
#' 
#' Observer observed 180 degrees in front of themselves.  
#' 
#' @section Variable Notes:
#' 
#' *Nectar Plant Species* the specific nectar plant on which the bee was nectaring 
#'    
#'      Nectar species scientific names and corresponding common names are in folder 'data-raw/nectar' in file 'nectar_species_scientific_name_counting_unit'
#' 
#' *Bee Species* Only nectaring bees were counted. There were 3 possible options for bee names: *honey bee* *bumble bee* *solitary bee*
#' 
#' @format A data frame with the following variables:
#' \itemize{
#'   \item year: numeric, year of observation
#'   \item month: numeric, month of observation
#'   \item day: numeric, day of observation
#'   \item siteID: character, id of the site
#'   \item transectID: character, id of the transect
#'   \item round: character, the round number: 1, 2, or 3
#'   \item section: character, the interval of the observation in length of meters along transect
#'   \item Nectar Plant Species: character, common name for nectar plant species on which the bee was nectaring
#'   \item Bee Species: character, type of bee: honey bee, bumble bee, or solitary bee
#'   \item count: integer, number of bees observed for each bee type
#' }
#' 
#' @seealso \code{\link{monarch}}
#' 
"bee"
