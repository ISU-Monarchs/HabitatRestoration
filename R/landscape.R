#' Landscape
#'
#' This data set contains general information about the landscape surrounding the plots
#' Data set was only used in 2016. Replaced by 'environment'
#' 
#' @section Data Collection Protocol
#' 
#' Landscape data only exists for 2016. In 2017 and following years, data collection relating to the outside of the plot is stored in the 'environment' data set. 
#' Surveyed the area outside the perimeter of the plot to determine if milkweed and flowering plants were present. 
#' Physical data sheet also listed ‘type of habitat’ which was outside the plot but this data was too ambiguous to be used so it was not recorded in the Git ‘landscape’ data set. 
#' Plot perimeter was not established until round 3 2016 data collection. Round 1/2 landscape surveyed area was at the discretion of the observer as to what was ‘outside’ the plot.
#'
#' @format A data frame with the following variables:
#' \itemize{
#'   \item year: year of observation
#'   \item month: month of observation
#'   \item day: day of observation
#'   \item siteID: id of the site
#'   \item transectID: id of the transect
#'   \item round: the round number: 1, 2, or 3
#'   \item direction: direction (N,E,S, or W) of the surrouding landscape from the plot
#'   \item milkweed: milkweed present in surrounding landscape? yes/no answer
#'   \item flowering_plants: currently flowering plants present in surrounding landscape? yes/no answer
#'   \item observer: individual who observed (and possibly recorded) the observations
#' }
#' @format A data frame with the variables above.
"landscape2016"