#' Milkweed ramets (flowering and non flowering) - collected during nectar survey
#'
#' This data set contains the count of the number of milkweed ramets observed for three species of milkweed (which were included in the seed mix planted) within certain sections of a transect.
#'
#' @section Data Collection Protocol:
#' 
#' **Note** Data collection protocol is same as 'Nectar' dataset except that 'Ramets' dataset only contains non flowering milkweed ramet count data for 3 milkweed species
#' 
#' **Note** No data for 2016. Data collection began in 2017.
#' 
#' Milkweed ramet data available 2017-2019 
#' 
#' Observer recorded every visual detection of a common milkweed, swamp milkweed, or butterfly milkweed ramet.
#' 
#' Milkweed ramet was recorded regardless of whether or not it was flowering. 
#' 
#' Data allows for calculation of milkweed ramet density for these three species but only in years 2017-2019.
#' 
#' Observer walked a line parallel to the transect at a length of 1.5m to the right of the transect. 
#' 
#' Observer visually surveyed a 1m wide band along the whole length of the transect, recording every visual detection of milkweed ramets
#' 
#' Area surveyed was the same as the length of transect because width of survey was 1m along whole length of transect.
#' 
#' Transect lengths can be found in 'survey' folder.
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
#'   \item Nectar Plant Species: character, 3 possible options: 'butterfly milkweed ramet' 'common milkweed ramet' or 'swamp milkweed ramet'
#'   \item count: integer, count of milkweed ramets observed
#' }
#' @references Here is a reference.
"nectar"
