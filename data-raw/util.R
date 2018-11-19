stop("This file is not meant to be sourced. Run lines manually.")

# The scripts below are meant to be run from the data-raw/ directory

library("tidyverse")

################################################################################
## Rename .PDF.pdf to .pdf
old_names <- list.files(path = ".", pattern=".PDF.pdf", recursive=TRUE)
new_names <- gsub(".PDF","",old_names)

for (i in 2:length(old_names)) system(paste("git mv", old_names[i], new_names[i]))
system('git commit -m "Rename *.PDF.pdf to *.pdf"')
################################################################################
## Rename .PDF to .pdf
old_names <- list.files(path = ".", pattern=".PDF", recursive=TRUE)
new_names <- gsub(".PDF",".pdf",old_names)

for (i in 2:length(old_names)) system(paste("git mv -f", old_names[i], new_names[i]))
system('git commit -m "Rename *.PDF to *.pdf"')
################################################################################



################################################################################
## Find missing csv,csv2, or pdf files

# $ is needed because the daubenmire directory has csv and csv2 files
d <- read.table(textConnection("
type dir extension
bee bee .csv
daubenmire daubenmire .csv$
environment environment .csv
landscape2016 landscape2016 .csv
monarch monarch .csv
nectar nectar .csv
robel daubenmire .csv2"), header=TRUE, stringsAsFactors = FALSE)

find_missing <- function(d) {
  dir <- d$dir
  ext <- d$extension
  
  pdf_files <- gsub(".pdf", "", list.files(path = dir, pattern = ".pdf", full.names = TRUE, recursive = TRUE))
  csv_files <- gsub(ext,    "", list.files(path = dir, pattern = ext,    full.names = TRUE, recursive = TRUE))
  
  pdf_missing <- paste0(setdiff(csv_files, pdf_files), ".pdf")
  csv_missing <- paste0(setdiff(pdf_files, csv_files), ext)
  
  data_frame(missing = c(pdf_missing,csv_missing))
}

d %>% 
  group_by(type) %>%
  do(find_missing(.)) %>%
  ungroup() %>%
  select(-type) %>%
  mutate(missing = gsub("\\$","",missing)) %>%
  write_csv(path="missing_files.csv")
################################################################################