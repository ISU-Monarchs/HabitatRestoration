#' Monarch
#'
#' This data set contains weather data and count data for monarch adults, eggs, and instars during a survey as well as count data for palmer amaranth.
#'
#'@section Data Collection Protocol
#'
#' Data collection protocols evolved as the project aged. See readme in 'monarch' folder within 'data-raw' for details.
#' 
#' Adult monarchs were surveyed by an observer walking along a permanent transect line. 
#' Observer walked a line parallel to the transect, immediately to the right of the transect at a rate of 2minutes/10m section. 
#' Surveys were conducated for 20 minutes. Exceptions noted in files in 'survey' folder.
#' If transect was shorter than 100m (20 minutes), observer stopped the time at the end of the transect, walked around plot, returned to start of transect, and continued survey until reaching 20 minutes (100m total).
#' Observer visually surveyed 180 degrees in front of themselves, recording every visual detection of a monarch and it's location at the time of first observation.
#'
#' See readme in 'monarch' folder in 'data-raw' for all other details.
#'
#' @format A data frame with the following variables:
#' \itemize{
#'   \item year: year of observation
#'   \item month: month of observation
#'   \item day: day of observation
#'   \item siteID: id of the site
#'   \item transectID: id of the transect
#'   \item round: the round number: 1, 2, or 3
#'   \item end_time: time survey ended
#'   \item sky: cloud cover (clear, mostly clear, mostly cloudy, cloudy, rain)
#'   \item start_time: time survey began
#'   \item temp: temperature in fahrenheit at start of survey
#'   \item wind: wind in miles per hour at start of survey
#'   \item distance: the interval of the observation in length of meters along transect
#'   \item count: count data for monarch adults, eggs, and instars. count data for palmer amaranth
#' }
#' @format A data frame with the variables above.
"monarch"