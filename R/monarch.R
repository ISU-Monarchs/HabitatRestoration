#' Monarch
#'
#' This data set contains weather data and count data for monarch adults, eggs, and instars during a survey as well as count data for palmer amaranth.
#'
#'@section Data Collection Protocol
#'
#' Data collection protocols evolved as the project aged. See readme in 'monarch' folder within 'data-raw' for details.
#' 
#' Adult monarchs were surveyed by an observer walking along a permanent transect line.
#'  
#' Observer walked a line parallel to the transect, immediately to the right of the transect at a rate of 2minutes/10m section.
#'  
#' Surveys were conducated for 20 minutes. Exceptions noted in files in 'survey' folder.
#' 
#' If transect was shorter than 100m (20 minutes), observer stopped the time at the end of the transect, walked around plot, returned to start of transect, and continued survey until reaching 20 minutes (100m total).
#' 
#' Observer visually surveyed 180 degrees in front of themselves, recording every visual detection of a monarch and it's location at the time of first observation.
#'
#' See readme in 'monarch' folder in 'data-raw' for all other details.
#' 
#' @section Variable Notes
#' 
#' *distance* contains many variables (see bullet point list)
#' 
#' *end time* data only exists for 2016. Was not necessary to collect in 2017-2019 as all surveys were 20 minutes long.
#' 
#' *sky* *temp* *wind* available in this dataset for 2016 round 2 and 3. Available from 'landscape2016' dataset for 2016 round 1. Available from 'environment' data set for 2017-2019.
#'
#' @format A data frame with the following variables:
#' \itemize{
#'   \item year: year of observation
#'   \item month: month of observation
#'   \item day: day of observation
#'   \item siteID: id of the site
#'   \item transectID: id of the transect
#'   \item round: the round number: 1, 2, or 3
#'   \item end_time: time survey ended
#'   \item sky: cloud cover (clear, mostly clear, mostly cloudy, cloudy, rain)
#'   \item start_time: time survey began
#'   \item temp: temperature in fahrenheit at start of survey
#'   \item wind: wind in miles per hour at start of survey
#'   \item distance: contains many variables 
#' 
#' MONARCH ADULTS WITHIN SURVEY TIME 
#'   --   the interval of the observation in length of meters along transect: 2016 round 1 and 2 only
#'   --  'watch_monarch' a monarch seen during the monitoring time while the observer was standing still observing at the end of the transect: 2016 round 1 and 2 only
#'   
#'   Observers were supposed to walk the transect at a speed of 2 minutes/10m section (which they did correctly). If the transect was shorter than 100m they were supposed to continue to observe at the end of the transect while stationary until reaching a total of 20 minutes of survey time. 'watch_monarch' only occurred if the site was shorter than 100m and the observer completed a 20 minute survey as they were supposed to. The observer would do 'watch_monarch' for as long as the time of the 20 minutes was remaining after reaching the end of the transect. 'watch_monarch' did not occur if the observer errored and stopped collecting data at the end of the transect, having not reached 20 minutes of total observation time. 
#'   
#'   --  'bin0-5m' 'bin5-50m' 'bin>50m': 2016 round 3 only 
#'   --  '#_inside_plot' '#_outside_plot': 2017-2019
#'    
#' MONARCH ADULTS OUTSIDE SURVEY TIME ANYWHERE AROUND SITE
#'   --  'extra monarchs' monarchs seen outside the survey time anywhere at the site. 
#'
#'  NUMBER OF MILKWEED PLANTS SURVEYED WITHIN THE PLOT
#'   --  'stems' milkweed ramets of any species: 2016 only. 
#'   --  'butterfly_ramets' 'common_ramets' 'swamp_ramets': 2017-2019
#'
#'  EGGS FOUND ON SURVEYED MILKWEED WITHIN THE PLOT 
#'   --  'eggs': 2016 only
#'   --  'butterfly_eggs' 'common_eggs' 'swamp_eggs': 2017-2019
#'   
#' INSTARS FOUND ON SURVEYED MILKWEED WITHIN THE PLOT
#'   --  '1instar' '2instar' '3instar' '4instar' '5instar': 2016 only
#'   --  'butterfly_1instar' 'butterfly_2instar' 'butterfly_3instar' 'butterfly_4instar' 'butterfly_5instar'
#'   --  'common_1instar' 'common_2instar' 'common_3instar' 'common_4instar' 'common_5instar'
#'   --  'swamp_1instar' 'swamp_2instar' 'swamp_3instar' 'swamp_4instar' 'swamp_5instar'

#' PALMER AMARANTH   
#'   --  'palmer amaranth' count data for palmer amaranth
#'   \item count: count data for monarch adults(2017-2019: '#inside), 'eggs', and instars ('1instar' '2instar' '3instar' '4instar' '5instar) count data for palmer amaranth
#' }
#' @format A data frame with the variables above.
"monarch"