This directory lists all the important rules that we followed while entering data. 
These rules apply to all categories of data.



Data entry should mirror physical data sheet as much as possible.

Create the following subdirectory to store your data

      GIT/ISUmonarch/data-raw/"data"/YYYY/MM/DD/"observer"
  
  1. data     (category of data) - nectar, daubenmire, monarch, landscape, bee
  2. YYYY     (4-digit year)
  3. MM       (2-digit month)
  4. DD       (2-digit day)
  5. observer (name) - first name with last initial
  
    Example: GIT/ISUmonarch/data-raw/nectar/2016/08/15/CoryH
  
  If multiple observers are listed, type them all in alphabetical order by last name. No spaces.

      RoyceBKelseyFCoryHRickHJuliaPJohnP
  
For 2016 only: Observers are on data sheets next to "Recorded by" and if that is blank, use the "Team Lead".
  
Create new folders for dates and observers as you go.

Save new data files as 

      site_transect_round.csv

    Example: Uthe 1 round 1: uth1_tuth1a_1.csv
             Uthe 2 round 3: uth2_tuth2a_3.csv
               
Save scanned data sheets as 

      site_transect_round.csv

Do not capitalize anything.

Perform a commit and push after every data file is created/saved/changed/updated.

For newly added data, commit message should be

      Add YYYY/MM/DD site_transect_round
      
For updating/fixing typos in already-saved data files, Commit message should be

      Update YYYY/MM/DD site_transect_round
      
  Then press enter twice to move down two lines and explain in detail exactly what you did to the file.
      
For 2016 only: uth3, arm1, ber3, dun3, nor1, bcr1, bcr2, tie1, app1 did not exist in round 1. No data.

For 2016 only: nor1, app1 did not exist in round 2. No data.

**2016: see spreadsheet for transect length changes by round.
      

      

      










