# ISUmonarch

This repository is being used to store some of the data for the 
[Iowa Monarch Conservation Consortium](https://monarch.ent.iastate.edu/).
The structure is a [package](http://r-pkgs.had.co.nz/) for the statistical 
computing software [R](https://www.r-project.org/) which makes loading the data
in R easy.
The R package utilizes 
[Git](https://git-scm.com/) for version control and recording keeping.
The website <http://github.com> hosts the Git repository.

## People

Currently 
[Jarad Niemi](https://monarch.ent.iastate.edu/people/jarad-niemi)
is in charge of data processing while undergraduate interns are doing most of the actual data entry. 
[Additional individuals](https://github.com/jarad/ISUmonarch/graphs/contributors)
have contributed along the way.

## Data entry setup

For anybody who will be entering data, follow the protocol outlined in 'initial computer.personnel set up'

you will need to install 
[R](https://www.r-project.org/),
[RStudio](https://www.rstudio.com/products/rstudio/#Desktop), and
[Git](https://git-scm.com/downloads).
You will need an account on <github.com> where you can request an 
[education discount](https://education.github.com/).
We also suggest you set up 
[ssh keys](https://www.r-bloggers.com/rstudio-pushing-to-github-with-ssh-authentication/)
to make pushing and pulling to the repository easy. 

## data-raw/

Contains all data collected

## data-raw/Data Entry - RStudio/

Contains data entry protocols such as how to set up a computer with the github 
repository, scan/upload pdfs, and enter data.

## R/

Contains information about how each type of data was collected in the field as 
well as specifications for site and plant ID. 
These files become the R help files.

## Data/

RData (.rda) binary files created from the scripts in the data-raw/ folder.
These files contain every piece of data collected and allows you to view it in 
one place. 
Click on the file you want to load under the data file. 
When asked if you want to load the R data file into the golbal environemnt, 
click yes. Then in the top right panel of R, 
click on the environemnt tab and click on the file you want to load. 
