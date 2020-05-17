#' Raw nectar and ramet data
#' 
#' This data.frame contains the raw nectar and ramet data. The purpose of the 
#' data.frame is to allow investigation of data issues. If you find an issue
#' in the \code{\link{nectar}} or \code{\link{ramet}} data.frames and the issue
#' is also in this raw file, then the issue is with the raw data in 
#' data-raw/nectar. If you find an issue in the above data.frames, but the
#' issue is not in this raw file, then the issue arose in the processing script
#' data-raw/nectar. If no observations was made during a survey, there will be
#' no information in this data.frame, but the survey will appear in
#' \code{\link{nectar_surveys}}
#' 
#' @format A data.frame with the following columns:
#' \itemize{
#'   \item filepath: character, path to the raw data file
#'   \item date: Date, survey date
#'   \item round: character, the round number: 1, 2, or 3
#'   \item observer
#'   \item siteID
#'   \item transectID
#'   \item Nectar Plant Species
#'   \item the remaining columns are counts of the number of observations in 
#'   the corresponding section of the transect
#' }
#' @seealso \code{\link{nectar}}, \code{\link{ramet}}, \code{\link{nectar_surveys}}
"nectar_raw"


#' Nectar and ramet surveys
#' 
#' This data.frame contains all the nectar and ramet surveys that were conducted.
#' The primary purpose of this data.frame was to complete the 
#' \code{\link{nectar}} and \code{\link{ramet}} data.frames with missing zero 
#' counts. 
#' 
#' @format A data.frame with the following columns:
#' \itemize{
#'   \item date:
#'   \item round:
#'   \item observer:
#'   \item transectID:
#'   \item section:
#' }
#' @seealso \code{\link{nectar}}, \code{\link{ramet}}, \code{\link{nectar_raw}}
#' 
"nectar_surveys"



#' Nectar plant species
#'
#' This data set contains the count of the number of plant species specific inflorescences (floral counting units) observed within certain sections of a transect.
#'
#' @section Data Collection Protocol:
#' 
#' Nectar plants were surveyed by an observer walking along a permanent transect line. 
#' 
#' Observer walked a line parallel to the transect at a length of 1.5m to the right of the transect. 
#' 
#' Observer visually surveyed a 1m wide band along the whole length of the transect, recording every visual detection of an actively flowering floral resource.
#' 
#' Area surveyed was the same as the length of transect because width of survey was 1m along whole length of transect.
#' 
#' Transect lengths can be found in \code{\link{survey}} data.frame.
#' 
#' @format A data frame with the following variables:
#' \itemize{
#'   \item date: Date, survey date
#'   \item transectID: character, id of the transect
#'   \item round: character, the round number: 1, 2, or 3
#'   \item section: character, the interval of the observation in length of meters along transect
#'   \item Nectar Plant Species: character, common name for nectar plant species which were flowering at the time of the survey
#'   \item count: integer, number of plant species specific floral units observed
#' }
#' @seealso \code{\link{ramet}}, \code{\link{nectar_surveys}}, \code{\link{nectar_raw}}
#' 
"nectar"




#' Milkweed ramets (flowering and non flowering) - collected during nectar survey
#'
#' This data set contains the count of the number of milkweed ramets observed 
#' for three species of milkweed (which were included in the seed mix planted) within certain sections of a transect.
#'
#' @section Data Collection Protocol:
#' 
#' **Note** Data collection protocol is same as \code{\link{nectar}} except that 
#' \code{\link{ramet}} only contains non-flowering milkweed ramet count data for 
#' 3 milkweed species.
#' 
#' **Note** No data for 2016. Data collection began in 2017.
#' 
#' Milkweed ramet data available 2017-2019 
#' 
#' Observer recorded every visual detection of a common milkweed, swamp 
#' milkweed, or butterfly milkweed ramet.
#' 
#' Milkweed ramet was recorded regardless of whether or not it was flowering. 
#' 
#' Data allows for calculation of milkweed ramet density for these three species 
#' but only in years 2017-2019.
#' 
#' Observer walked a line parallel to the transect at a length of 1.5m to the 
#' right of the transect. 
#' 
#' Observer visually surveyed a 1m wide band along the whole length of the 
#' transect, recording every visual detection of milkweed ramets
#' 
#' Area surveyed was the same as the length of transect because width of survey 
#' was 1m along whole length of transect.
#' 
#' Transect lengths can be found in 'survey' folder.
#'
#' @format A data frame with the following variables:
#' \itemize{
#'   \item date: Date, survey date
#'   \item round: character, the round number: 1, 2, or 3
#'   \item transectID: character, id of the transect
#'   \item section: character, the interval of the observation in length of 
#'   meters along transect
#'   \item Nectar Plant Species: character, 3 possible options: 
#'   'butterfly milkweed ramet' 'common milkweed ramet' or 'swamp milkweed ramet'
#'   \item count: integer, count of milkweed ramets observed
#' }
#' 
#' @seealso \code{\link{nectar}}, \code{\link{nectar_surveys}}, \code{\link{nectar_raw}}
#' 
"ramet"


#' Ramet strip data
#' 
#' It is unclear exactly what these data are. They are derived from data files
#' in data-raw/nectar, but they are NOT part of the formal survey. 
#' 
"ramet_strip"
