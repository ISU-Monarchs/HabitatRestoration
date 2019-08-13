#' Environment - Weather and Outside of Plot Data
#'
#' This data set contains weather data and floral/milkweed resources of surrounding landscape outside the plot (milkweed ramet counts, percentage of flowering plants, and dominant flowering species).
#' No environment data exists for 2016.
#' Similar data (but with data protocol differences) pertaining to outside of plot area is in 'landscape2016' data set in 2016.
#' Similar data (same protocol) pertaining to weather is in 'monarch' for 2016. 
#' 
#' @section Data Collection Protocol:
#' 
#' -temperature and wind measured with a hand held anemometer on site
#' 
#' *currently_flowering_plants* *dominant_flowering_species* and *milkweed_ramet* all surveyed the same area on the outside of the plot.
#' 
#' -A 20 meter wide frame around plot exterior, starting 5m from the plot edge.
#' 
#' -Plots differ in their perimeter and shape so this frame is not the same meter square area across all plots.
#' 
#' @section Variable Notes:
#' 
#' *currently_flowering_plants*: Visually estimated percentage of land cover which is covered by currently flowering plants within the frame defined above.
#' 
#' -In essence this data is attempting to do a daubenmire reading for percentage of cover of currently flowering plants across a large area.
#'
#' '0': 0 percent (no flowering plants present in defined area)
#' 
#' '0-5': <0-5 percent
#' 
#' '25-50': 25-50 percent
#' 
#' '50-75': 50-75 percent
#' 
#' '75-100': 75-100 percent
#' 
#' *dominant_flowering_species*: of the *currently_flowering_plants* visually estimated evaluation of which flowering species was present at greatest total number of plants inside the frame defined above.
#' 
#' -Observation was recorded by its common name. 
#' 
#' -Common names and corresponding scientific names are recorded in the file 'nectar_species_scientific_name_counting_unit' located in the folder 'data-raw/nectar' in the Git repository ISUmonarch.
#' 
#' -If no flowering species were present (*currently_flowering_plants* was 0) no data for *dominant_flowering_species* is recorded
#' 
#' -If multiple species were codominant; multiple species were listed separated by a semicolon
#'
#' *milkweed_ramet*: Count data of total milkweed ramets of any milkweed species observed within frame defined above.
#' 
#' *sky*: 
#' 
#' 'clear': no clouds. 
#' 
#' 'mostly clear': <50 percent cloud cover. 
#' 
#' 'mostly cloudy': >50 percent cloud cover. 
#' 
#' 'cloudy': 100 percent cloud cover. 
#' 
#' 'rain': rain.
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
#'   \item temperature: temperature in degrees fahrenheit
#'   \item wind: wind speed in miles per hour
#' }
#' @format A data frame with the variables above.
"environment"