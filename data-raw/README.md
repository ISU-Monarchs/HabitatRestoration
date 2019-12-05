This directory lists all the important conventions we followed while entering 
data. 
These conventions apply to all categories of data.
More specific conventions can be found in each of the data folders, 
e.g. `bee/README.md`.

## Data entry

For anybody who will be entering data, 
you will need to install 
 - [R](https://www.r-project.org/),
 - [RStudio](https://www.rstudio.com/products/rstudio/#Desktop), and
 - [Git](https://git-scm.com/downloads).

You will need an account on <github.com> where you can request an 
[education discount](https://education.github.com/) 
([discount no longer needed](https://github.blog/2019-01-07-new-year-new-github/)).
We also suggest you set up 
[ssh keys](https://www.r-bloggers.com/rstudio-pushing-to-github-with-ssh-authentication/)
to make pushing and pulling to the repository easy. 

For data entry, the relevant directories in the repository are 

 - data-raw/ - contains all data collected
 - data-raw/Data Entry - RStudio/ - contains data entry protocols such as how to set up a computer with the github repository, scan/upload pdfs, and enter data.
 - R/ - contains R help files that provide information about how each type of data was collected in the field as well as specifications for site and plant ID. 
 - data/ - scripts in data-raw/ convert data files into RData (.rda) binary files, you won't need to touch this directory



Data entry should mirror physical data sheet as much as possible.

### Directories

Create the following subdirectory to store your data

      GIT/ISUmonarch/data-raw/<data>/YYYY/MM/DD/<observer>
  
  1. <data>     (category of data) - nectar, daubenmire, monarch, landscape, bee
  2. YYYY       (4-digit year)
  3. MM         (2-digit month)
  4. DD         (2-digit day)
  5. <observer> (name) - first name with last initial
  
    Example: ISUmonarch/data-raw/nectar/2016/08/15/CoryH
  
  If multiple observers are listed, 
  type them all in alphabetical order by last name. 
  No spaces.

      RoyceBKelseyFCoryHRickHJuliaPJohnP
  
For 2016 only: 
  Observers are on data sheets next to "Recorded by" and if that is blank, 
  use the "Team Lead".
  
Create new year, month, day, observer folders as needed.

### Files

Save new data files as 

      site_transect_round.csv

    Example: Uthe 1 round 1: uth1_tuth1a_1.csv
             Uthe 2 round 3: uth2_tuth2a_3.csv
               
Save scanned data sheets as 

      site_transect_round.pdf

Do not capitalize anything except observer names as above.

### Commits

Perform a commit and push after every data file is created/saved/changed/updated.

For newly added data, commit message should be

      Add YYYY/MM/DD site_transect_round
      
For updating/fixing typos in already-saved data files, Commit message should be

      Update YYYY/MM/DD site_transect_round
      
  Then press enter twice to move down two lines and explain why the changes were
  made.
      
### Notes
      
For 2016 only: 

  - uth3, arm1, ber3, dun3, nor1, bcr1, bcr2, tie1, app1 did not exist in round 1. No data.
  - nor1, app1 did not exist in round 2. No data.
  - see spreadsheet for transect length changes by round.
      

      
## Scripts

Jarad Niemi is in charge of the scripts.










