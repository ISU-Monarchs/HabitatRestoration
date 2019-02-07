#' Environment
#'
#' This data set contains weather data and floral/milkweed resources of surrounding landscape (milkweed ramet counts, % of flowering plants, and dominant flowering species) at the time of observation
#' No environment data exists for 2016.
#'
#' @format A data frame with the following variables:
#' \itemize{
#'   \item year: year of observation
#'   \item month: month of observation
#'   \item day: day of observation
#'   \item siteID: id of the site
#'   \item transectID: id of the transect
#'   \item round: the round number: 1, 2, or 3
#'   \item currently_flowering_plants: daubenmire style land cover of currently flowering plants in defined area surrounding plot. Grouped by percentages: 0,0-5,5-25,25-50,50-75,75-100
#'   \item dominant_flowering_species: dominant flowering plant species in defined area surrounding plot
#'   \item milkweed_ramet: count of milkweed ramets in defined area surrounding plot
#'   \item sky: cloud cover group name(clear, mostly clear, mostly cloudy, cloudy, rain)
#'   \item temperature: temperature in fahrenheit
#'   \item wind: wind speed in miles per hour
#' }
#' @format A data frame with the variables above.
"environment"