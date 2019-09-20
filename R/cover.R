#' Cover - Sourced from Daubenmire
#'
#' This data set contains daubenmire land cover percentages observed at 10m intervals inside a 0.5m square along a transect.
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
#' @section Variable  Notes:
#' 
#' **section** --Denotes the point along the transect at which the observation was made. 
#' 
#' **class** --*csg* *wsg* *forbs* *milkweed* *woody_species* *bare_ground* *leaf_litter*  
#' 
#' All values are percentages.
#'   
#' Data points represent a daubenmire coverage class based off Daubenmire 1959.
#'   
#' Observer looks from a top-down/birds eye view and estimates the area of the frame the specific plant material covers.  
#' 
#' Due to cover existing at different heights with potential for overlap, total percent cover of all cover classes combined can be greater than 100%. Example: quadrant could potentially have 16% WSG, 86% CSG, 38% forbs, 16% milkweed, 3% woody vegetation, 16% bare ground, and 38% leaf litter. When these percentages are added together, they exceed 100%. (A milkweed could be covering 16% of the frame and still have grasses taking up area underneath it.)
#' 
#' Daubenmire percentage coverage classes are as follows:
#' 
#' 0:	  None
#' 
#' 1:	  Trace
#' 
#' 3:	  1-5
#' 
#' 16:	5-25
#' 
#' 38:	25-50
#' 
#' 63:	50-75
#' 
#' 86:	75-95
#' 
#' 98:	95-100
#' 
#' *csg* Cool season grass. Includes sedges and equisetum. Does not differentiate between native and non-native species.  
#' 
#' *wsg* Warm season grass. Does not differentiate between native and non-native species. 
#'  
#' *forbs* All non-grass herbaceous plants. Does not include milkweed. Does not differentiate between native and non-native species.  
#' 
#' *milkweed* Milkweed of any species  
#' 
#' *woody species* Trees or shrubs  
#' 
#' *bare ground* Soil surface which is not covered with leaf litter, residue, or stems. Includes tree roots, stumps, animal manure, and mushrooms. 
#'  
#' *leaf litter* All horizontal dead plant material that is no longer rooted: twigs, leaves, grass.  
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
#'   \item class: character, daubenmire specific ground cover categories
#'   \item percentage: numeric, daubenmire specific cover classes in percentages. Numbers indicatenam birds eye coverage of specific cover category within 0.5m frame
#' }
#' @format A data frame with the variables above.
"cover"