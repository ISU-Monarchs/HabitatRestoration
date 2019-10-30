#' Nectar plant bees utilized
#'
#' This data set contains the count of bees observed and the specific flowering plant they were nectaring on.
#'
#' @section Data Collection Protocol:
#' 
#' Protocol was the same as \code{\link{bee}} 
#' 
#' @section Variable Notes:
#' 
#' *Nectar Plant Species* the specific nectar plant on which the bee was nectaring 
#'    
#'      Nectar species scientific names and corresponding common names are in \code{\link{species}}
#'      
#' *Bee Species* Only nectaring bees were counted. There were 3 possible options for bee names: *honey bee* *bumble bee* *solitary bee*
#' 
#' @format A data frame with the following variables:
#' \itemize{
#'   \item year: numeric, year of observation
#'   \item month: numeric, month of observation
#'   \item day: numeric, day of observation
#'   \item siteID: character, id of the site
#'   \item transectID: character, id of the transect
#'   \item round: character, the round number: 1, 2, or 3
#'   \item Nectar Plant Species: character, common name for nectar plant species on which the bee was nectaring
#'   \item Bee Species: character, type of bee: honey bee, bumble bee, or solitary bee
#'   \item count: integer, number of bees observed for each bee type (NAs have been removed, see \code{\link{bee}})
#' }
#' 
#' @seealso \code{\link{monarch}}, \code{\link{bee}}, \code{\link{species}}
#' 
"bee_plant"
