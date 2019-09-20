#' Litter - Sourced from Daubenmire
#'
#' This data set contains litter depth in cm sourced from daubenmire survey observed at 10m intervals inside a 0.5m square along a transect.
#'
#' @section Data Collection Protocol:
#' 
#' **Note** Daubenmire and robel data share the same directory and are both saved with the same file name except that robel data is saved with a '2' after the .csv extension.
#' site_transect_round.csv2
#' 
#' Daubenmire survey was done at 10m lengths along a permanent transect line
#' 
#' Observer placed a quadrant (1 meter x 0.5m rectangle) on the left side of the transect
#' 
#' Quadrant was placed with 1 meter edge perpendicular to the 100m tape and 0.5 meter edge extending from transect point to 0.5 meters along transect length. 
#' 
#' Observations started at 0 meters on the transect and were taken every 10m of the transect. 
#' 
#' Observations were at a point on the transect and did not encompass the full length of a section.
#' 
#' Data collection began at 0 meter starting point of the transect and stopped before the transect ended.
#' 
#' A transect length of 100m will have points recorded for 0 meters through 90 meters; 10 points.
#' 
#' Data is not taken at the final point on the transect as this area is outside the transect. 
#'
#' @format A data frame with the following variables:
#' \itemize{
#'   \item year: numeric, year of observation
#'   \item month: numeric, month of observation
#'   \item day: numeric, day of observation
#'   \item siteID: character, id of the site
#'   \item transectID: character, id of the transect
#'   \item round: character, the round number: 1, 2, or 3
#'   \item section: character, point along the transect at which data was collected inside a 0.5m square
#'   \item depth: numeric, depth of horizontal dead plant material on the soil surface in cm. cm values limited to measurement by 0.25cm increments.
#' }
#' @format A data frame with the variables above.
"litter"