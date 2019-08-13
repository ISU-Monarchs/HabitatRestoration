#' Landscape2016
#'
#' This data set contains general information about the landscape surrounding the plots.
#' Data set only used in 2016. Replaced by 'environment' for 2017-2019
#' 
#' @section Data Collection Protocol:
#' 
#' Landscape data only exists for 2016. 2017-2019 data collection relating to the outside of the plot is stored in the 'environment' data set. 
#' 
#' Surveyed the area outside the perimeter of the plot to determine if milkweed and flowering plants were present. 
#' 
#' Plot perimeter was not established until round 3 2016 data collection. Round 1/2 landscape surveyed area was at the discretion of the observer as to what was 'outside' the plot.
#'
#' @format A data frame with the following variables:
#' \itemize{
#'   \item year: year of observation
#'   \item month: month of observation
#'   \item day: day of observation
#'   \item siteID: id of the site
#'   \item transectID: id of the transect
#'   \item round: the round number: 1, 2, or 3
#'   \item direction: direction 'n' 'e' 's' 'w' of the surrouding landscape from the plot. 
#'   
#'   'general'- round 1 (and a few round 2) sites did not include cardinal directions. Only one observation was made, named as 'general'
#'   
#'   \item milkweed: presence/abence survey of milkweed present in surrounding landscape, 'yes' 'no' answer
#'   \item flowering_plants: presence/absence of currently flowering plants present in surrounding landscape. 'yes' 'no' answer
#' }
#' @format A data frame with the variables above.
"landscape2016"