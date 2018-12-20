The environment data is stored in this directory. 
Seth Appelgate is in charge of this directory.
Data entry individuals: 2017: Riley Nylin. 2018: Sydney Lizotte-Hall.
Data verification: incomplete

Environment surveyed the weather at the time of data collection and the area outside the perimeter of the plot to determine milkweed ramet abundance and % ground cover of flowering plants. 

Environment data does not exist for 2016. Environment data was collected in 2017 and the years following.

‘temperature’
  
    °F. Measured with an anemometer on site.

‘wind’

    Miles per hour. Measured with an anemometer on site. 

‘sky’
  
    'Clear': no clouds. 
    'Mostly clear': <50% cloud cover
    'Mostly cloudy': >50% cloud cover
    'Cloudy': 100% cloud cover
    'Rain': rain

‘milkweed_ramet’
    
    Count data of total milkweed ramets of any milkweed species observed within defined banded area around plot perimeter. Band was defined as area which was between 5-25 meters from the plot edges, essentially a ‘frame’ around the plot which had a width of 20 meters wide, starting 5m from the plot edge.

‘currently_flowering_plants’

    Visually estimated % of land cover which is covered by currently flowering plants within same defined area as ‘milkweed_ramet’ data collection. A 20 meter wide frame around plot exterior, starting 5m from the plot edge. In essence this data is attempting to do a daubenmire reading for % of cover of flowering plants across a large area.
    
    ‘0’: 0% (no flowering plants present in defined area)
    ‘0-5’: <0-5%
    ‘25-50’: 25-50%
    ‘50-75’: 50-75%
    ’75-100’: 75-100%

‘dominant_flowering_species’

    Visually estimated evaluation of which flowering species was present at greatest total number of plants inside the 20 meter wide frame around the plot exterior, starting 5m from the plot edge. Observation was recorded by its common name. Common names and corresponding scientific names are recorded in the file ‘nectar_species_scientific_name_counting_unit’ located in the folder 'data-raw/nectar' in the Git repository ISUmonarch.
    
    If no flowering species were present (‘currently_flowering_plants’ was 0) no data for ‘dominant_flowering_species’ is recorded
    
    If multiple species were codominant; multiple species were listed separated by a semicolon
