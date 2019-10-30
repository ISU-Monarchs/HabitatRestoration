#' Species - Flowering Forb Species Information
#'
#' This data set contains flowering forb species common and scientific names, native status, planted vs non planted species, and species specific counting units for all flowering plant species which were currently flowering at the time of data collection.
#' These species are present in the \code{\link{nectar}}, \code{\link{bee_plants}}, and \code{\link{environment}} datasets.  
#' Only ACTIVELY BLOOMING/FLOWERING forb species are included in this list.
#' No data in this project attempts to quantify species which flower but were not at the time of data colleciton.
#' Data collection does not include flowering grasses. 
#'
#' @section 'data-raw/nectar/nectar_species_scientific_name_counting_unit' - document explanation:
#' 
#' 'common_name' 'genus' 'species': common names and corresponding scientific names
#' 
#' 'field count unit' specific to each species. Floral counting units are either umbel, head, ramet, or spike
#' 
#' 'native_introduced_both' classification of plants as defined by the USDA PLANTS database.
#' 
#' 'planted_non_planted' Indicates which species were in the native seed mix planted. Seed mix same at all plots.
#' 
#' 'technical_count' more specifc description of 'field_count_unit'
#' 
#' 'inflorescence_name_when_technical' details if inflorescence is not easily explained
#'
#'
#' @format A data frame with the following variables:
#' \itemize{
#'   \item common_name: character, common name of the flowering plant species. Common names are not based on any standard name list.
#'   \item field_count_unit: character, physiological plant component used to count floral units for each species.
#'   Options are: 'umbel' 'ramet' 'head' 'spike' 'spike (flower cluster)'
#'   \item genus: character, genus of the plant according to USDA PLANTS Database
#'   \item species: character, species of the plant according to USDA PLANTS Database
#'   \item native_introduced_both: character, 'native', 'introduced', or 'both'. Native status of the plant according to USDA PLANTS Database. 
#'   \item planted_non_planted: character, 'planted' or 'non planted'. Indicates if plant species was included in the seed mix planted in fall 2016. 
#'   \item technical_count: character, clarification of *field_count_unit* if necessary
#'   \item infloresence_name_when_technical: character, clarification of *technical_count* if necessary
#' }
#' @seealso \code{\link{nectar}}, \code{\link{bee_plants}}, \code{\link{environment}}
#' 
"species"