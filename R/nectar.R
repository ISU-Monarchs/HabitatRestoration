#' Nectar plant species
#'
#' This data set contains the count of the number of plant species specific inflorescences (floral counting units) observed within certain sections of a transect.
#'
#' @section Data Collection Protocol:
#' 
#' Nectar plants were surveyed by an observer walking along a permanent transect line. 
#' 
#' Observer walked a line parallel to the transect at a length of 1.5m to the right of the transect. 
#' 
#' Observer visually surveyed a 1m wide band along the whole length of the transect, recording every visual detection of an actively flowering floral resource.
#' 
#' Area surveyed was the same as the length of transect because width of survey was 1m along whole length of transect.
#' 
#' Transect lengths can be found in \code{\link{survey}} data.frame.
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
#'   \item Nectar Plant Species: character, common name for nectar plant species which were flowering at the time of the survey
#'   \item count: integer, number of plant species specific floral units observed
#' }
#' @references Here is a reference.
"nectar"
