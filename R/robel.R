#' Robel
#'
#' This data set contains visual obstruction robel pole readings observed at 10m intervals along a transect.
#'
#' @section Data Collection Protocol
#' 
#' Robel survey is a visual obstruction survey of standing vegetative material. Robel survey was done at 10m lengths along a permanent transect line. Observer placed a robel pole on the left side of the transect. Our robel pole was marked with bands every 10cm starting at a value of ‘1’. 0-10cm is 1. Pole was 160cm tall or a value of ‘16’. Observer crouched at a distance of 4 meters from the pole and at a height of 1 meter above the ground. A robel reading was taken in all 4 cardinal directions (N,E,S,W). Robel reading is the highest band (10cm section) on the pole at which vegetation obscures ≥50% of the band on the pole when vegetation obscures ≤50% of the band above it on the pole. Example: “4” is barely visible but “5” is unobscured, the reading is 4. Visual obstruction readings are allowed to be zero.
Observations started at 0 meters on the transect and were taken every 10m of the transect and stopped before the transect ended. A transect length of 100m will have points recorded for 0 meters through 90 meters; 10 points. Data is not taken at the final point on the transect as this area is outside the transect.  

‘direction’

Denotes the cardinal direction from which the data was taken.

‘n’, ‘e’, ‘s’, ‘w’

Denotes the cardinal direction from which the data was taken. Directions are based on the observer’s position in relation to the pole, not the direction in which the observer is looking. Example: ‘n’ data is taken by the observer when the observer is north of the pole looking south.

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