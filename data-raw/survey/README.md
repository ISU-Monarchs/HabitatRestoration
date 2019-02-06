The survey data is stored in this directory. 
Seth Appelgate/Nehemias Ulloa is in charge of this directory.
Data entry individuals: 2016,2017,2018: Seth Appelgate.
Data verification: 2016,2017,2018 all incomplete: 

Files are organized by survey year. 

'survey2016' 'survey2017' 'survey 2018' contain site and survey specific information.
  
    Each line represents an individual survey at a site
    
    If site did not yet exist at time of survey the site is not listed for that year/round.
    
'transectID'

    unique site identifier. Each site has only 1 transect.
    
'year'

    year in which the data was collected at the site
    
'round'

    round in which the data was collected at the site. 3 rounds exist for all sites unless site did not yet exist or data was not collected.
    
'length'

    transect length in meters
    
'section_length'

    length of section. Length of section is always 10 meters in 2017 and years following. Length of section in 2016 was sometimes 20 meters and sometimes 10 meters. This issue affects 2016 'bee' 'monarch' and 'nectar' data.
    
'area'

    area in meters squared of the plot at the time of survey. Area occassionally varied due to plot length or edge changes.
    
'monarch_time'

    length of time in minutes for which monarchs were observed and recorded at the site. Observers were supposed to walk the transect at a speed of 2 minutes/10m section (which they did correctly). For round 1/2 of 2016 only, if the transect was shorter than 100m they were supposed to continue to observe at the end of the transect while stationary until reaching a total of 20 minutes of survey time. This stationary observation only occurred if the site was shorter than 100m and the observer completed a 20 minute survey as they were supposed to. This stationary observation did not occur if the observer errored and stopped collecting data at the end of the transect, having not reached 20 minutes of total observation time. These errors resulted in observation times shorter than 20 minutes, as is detailed in the file ‘2016_survey_dates_transect_length’ or 'survey2016'. Observations in 2017 and years following were always 20 minutes.
