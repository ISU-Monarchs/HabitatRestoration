#' Robel
#'
#' This data set contains visual obstruction robel pole readings observed at 10m intervals along a transect.
#'
#' @format A data frame with the following variables:
#' \itemize{
#'   \item year: year of observation
#'   \item month: month of observation
#'   \item day: day of observation
#'   \item siteID: id of the site
#'   \item transectID: id of the transect
#'   \item round: the round number: 1, 2, or 3
#'   \item section: the interval of the observation in length of meters along transect
#'   \item Direction: direction from pole in which observation is taken. North, east, west, or south.
#'   \item count: visual obstruction robel pole reading. Numbers above 16 are 16. 16 is max.
#' }
#' @format A data frame with the variables above.
"robel"