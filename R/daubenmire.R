#' Daubenmire
#'
#' This data set contains daubenmire land cover %'s, count data for 3 milkweed species, and litter depth in cm observed at 10m intervals inside a 0.5m square along a transect.
#'
#' @format A data frame with the following variables:
#' \itemize{
#'   \item section: point along the transect at which data was collected inside a 0.5m square
#'   \item year: year of observation
#'   \item month: month of observation
#'   \item day: day of observation
#'   \item recorder: individual who observed (and possibly recorded) the observations
#'   \item siteID: id of the site
#'   \item transectID: id of the transect
#'   \item round: the round number: 1, 2, or 3
#'   \item land_cover: daubenmire specific ground cover categories
#'   \item percentage: daubenmire specific cover classes in percentages. Numbers indicate birds eye coverage of specific cover category within 0.5m frame
#' }
#' @format A data frame with the variables above.
"daubenmire"