#' Environment
#'
#' This data set contains weather data and floral/milkweed resources of surrounding landscape (milkweed ramet counts, % of flowering plants, and dominant flowering species) at the time of observation
#' No environment data exists for 2016.
#'
#' @format A data frame with the following variables:
#' \itemize{
#'   \item environment: weather data and floral/milkweed resources of surrounding landscape
#'   \item year: year of observation
#'   \item month: month of observation
#'   \item day: day of observation
#'   \item recorder: individual who observed (and possibly recorded) the observations
#'   \item siteID: id of the site
#'   \item transectID: id of the transect
#'   \item round: the round number: 1, 2, or 3
#'   \item milkweed_ramet: count of milkweed ramets in defined area surrounding plot
#'   \item temperature: temperature in fahrenheit
#'   \item wind: wind speed in miles per hour
#'   \item currently_flowering_plants: daubenmire style land cover of currently flowering plants. Grouped by percentages: 0,0-5,5-25,25-50,50-75,75-100
#' }
#' @format A data frame with the variables above.
"robel"