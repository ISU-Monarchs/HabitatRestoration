#' Bee species and nectar plant species
#'
#' This data set contains the count of bees observed and the specific flowering plant they were nectaring on observed within certain sections of a transect.
#'
#' @format A data frame with the following variables:
#' \itemize{
#'   \item year: year of observation
#'   \item month: month of observation
#'   \item day: day of observation
#'   \item recorder: individual who observed (and possibly recorded) the observations
#'   \item siteID: id of the site
#'   \item transectID: id of the transect
#'   \item round: the round number: 1, 2, or 3
#'   \item distance: the interval of the observation in length of meters along transect
#'   \item Nectar Plant Species: common name for nectar plant species on which the bee was nectaring
#'   \item Bee Species: type of bee: honey bee, bumble bee, or solitary bee
#'   \item count: number of bees observed for each bee type
#' }
#' 
#' @seealso \code{\link{monarch}}
#' 
"bee"
