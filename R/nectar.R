#' Nectar plant species
#'
#' This data set contains the count of the number of plant species specific 
#' inflorescences observed within certain sections of a transect.
#'
#' @section Data Collection Protocol:
#' 
#' Nectar plants were surveyed by an observer walking along a permanent transect line. 
#' Observer walked a line parallel to the transect at a length of 1.5m to the right of the transect. 
#' Observer visually surveyed a 1m wide band along the whole length of the transect, recording every visual detection of an actively flowering floral resource.
#' Area surveyed was the same as the length of transect because width of survey was 1m along whole length of transect.
#' Transect lengths can be found in 'survey' folder.
#' ‘nectar_species_scientific_name_counting_unit’ document contains information which denotes species, specific counting units, and other plant information. 
#' File is located in the folder 'data-raw/nectar' in the Git repository ISUmonarch.
#' 
#' Observer also recorded every visual detection of a common milkweed, swamp milkweed, or butterfly milkweed ramet.
#' Milkweed ramet was recorded regardless of whether or not it was flowering. 
#' Data allows for calculation of milkweed density for these three species.
#' 
#' 
#' @section ‘nectar_species_scientific_name_counting_unit’ document explanation:
#' ‘common_name’ 'genus' 'species' common names and corresponding scientific names
#' 'field count unit' specific to each species. Counting units are either umbel, head, ramet, or spike
#' 'native_introduced_both' classification of plants as defined by the USDA PLANTS database.
#' 'planted_non_planted' Indicating which species were in the native seed mix planted. Seed mix same at all plots.
#' 'technical_count' more specifc description of 'field_count_unit'
#' 'inflorescence_name_when_technical' details if inflorescence is not easily explained
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
#'   \item Nectar Plant Species: common name for nectar plant species which were flowering at the time of the survey
#'   \item count: number of plant species specific floral units observed
#' }
#' @references Here is a reference.
"nectar"
