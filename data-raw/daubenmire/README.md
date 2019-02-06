The daubenmire and robel data is stored in this directory.
Seth Appelgate is in charge of this directory.
Data entry individuals: 2016: Cory Haggard. 2017: Riley Nylin. 2018: Sydney Lizotte-Hall.
Data verification: 2016,2017,2018 Complete: Jacob Handel.

Daubenmire and robel data share the same directory and are both saved with the same file name except that robel data is saved with a '2' after the .csv extension.

      site_transect_round.csv2
      
Daubenmire

Daubenmire survey was done at 10m lengths along a permanent transect line. Observer placed a quadrant (1 meter x 0.5m rectangle) on the left side of the transect. Quadrant was placed with 1 meter edge perpendicular to the 100m tape and 0.5 meter edge extending from transect point to 0.5 meters along transect length. Observations started at 0 meters on the transect and were taken every 10m of the transect. Observations were at a point on the transect and did not encompass the full length of a section. Data collection began at 0 meter starting point of the transect and stopped before the transect ended. A transect length of 100m will have points recorded for 0 meters through 90 meters; 10 points. Data is not taken at the final point on the transect as this area is outside the transect.  

  ‘section’
    
    Denotes the point along the transect at which the observation was made. 

  ‘csg’ ‘wsg’ ‘forbs’ ‘milkweed’ ‘woody_species’ ‘bare_ground’ ‘leaf_litter’

    All values are percentages. Data points represent a daubenmire coverage class based off Daubenmire 1959.  Observer looks from a top-down/birds eye view and estimates the area of the frame the specific plant material covers. Due to cover existing at different heights with potential for overlap, total percent cover of all cover classes combined can be greater than 100%. Example: quadrant could potentially have 16% WSG, 86% CSG, 38% forbs, 16% milkweed, 3% woody vegetation, 16% bare ground, and 38% leaf litter. When these percentages are added together, they exceed 100%. (A milkweed could be covering 16% of the frame and still have grasses taking up area underneath it.)

    Daubenmire coverage classes:
      0	  None
      1	  Trace
      3	  1-5%
      16	5-25%
      38	25-50%
      63	50-75%
      86	75-95%
      98	95-100%

  ‘csg’
  
    Cool season grass. Includes sedges and equisetum. Does not differentiate between native and non-native species.

  ‘wsg’
  
    Warm season grass. Does not differentiate between native and non-native species.
  
  ‘forbs’

    All non-grass herbaceous plants. Does not include milkweed. Does not differentiate between native and non-native species.

  ‘milkweed’

    Milkweed of any species

  ‘common_ramet’, ‘swamp_ramet’, ‘butterfly_ramet’

    Count data, not % daubenmire coverage class. Total number of milkweed ramets by their species.

  ‘woody species’

    Trees or shrubs

  ‘bare ground’

    Soil surface which is not covered with leaf litter, residue, or stems. Includes tree roots, stumps, animal manure, and mushrooms.

  ‘leaf litter’

    All horizontal dead plant material that is no longer rooted: twigs, leaves, grass.

  ‘litter depth’

    Depth of horizontal dead plant material on the soil surface in cm. Value is not a %.

  2016
	
    Variables included: ‘csg’ ‘wsg’ ‘forbs’ ‘milkweed’ ‘woody_species’ ‘bare_ground’ ‘leaf_litter’ ‘litter depth’

  2017 and years following

    Variables added: ‘common_ramet’, ‘swamp_ramet’, ‘butterfly_ramet’

Robel

Robel survey is a visual obstruction survey of standing vegetative material. Robel survey was done at 10m lengths along a permanent transect line. Observer placed a robel pole on the left side of the transect. Our robel pole was marked with bands every 10cm starting at a value of ‘1’. 0-10cm is 1. Pole was 160cm tall or a value of ‘16’. Observer crouched at a distance of 4 meters from the pole and at a height of 1 meter above the ground. A robel reading was taken in all 4 cardinal directions (N,E,S,W). Robel reading is the highest band (10cm section) on the pole at which vegetation obscures ≥50% of the band on the pole when vegetation obscures ≤50% of the band above it on the pole. Example: “4” is barely visible but “5” is unobscured, the reading is 4. Visual obstruction readings are allowed to be zero.
Observations started at 0 meters on the transect and were taken every 10m of the transect and stopped before the transect ended. A transect length of 100m will have points recorded for 0 meters through 90 meters; 10 points. Data is not taken at the final point on the transect as this area is outside the transect.  

  ‘direction’

    Denotes the cardinal direction from which the data was taken.

  ‘n’, ‘e’, ‘s’, ‘w’

    Denotes the cardinal direction from which the data was taken. Directions are based on the observer’s position in relation to the pole, not the direction in which the observer is looking. Example: ‘n’ data is taken by the observer when the observer is north of the pole looking south.
