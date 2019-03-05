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




################################################################################
## Replace names as described in: https://github.com/jarad/ISUmonarch/issues/61

# Fix misspellings in the og data
files <- list.files(pattern=".csv|.csv2|.pdf", recursive = TRUE)
grep("pre2_tpre2b", files, value=TRUE)
files = gsub("pre2_tpre2b", "pre2b_tpre2b", files)
grep("pre3_tpre3a", files, value=TRUE)
files = gsub("pre3_tpre3a", "pre3a_tpre3a", files)
grep("pre4_tpre4a", files, value=TRUE)
files = gsub("pre4_tpre4a", "pre4a_tpre4a", files)
grep("pre4_tpre4b", files, value=TRUE)
files = gsub("pre4_tpre4b", "pre4b_tpre4b", files)
grep("pre1_tpre1a", files, value=TRUE)
files = gsub("pre1_tpre1a", "pre1a_tpre1a", files)
grep("pre1_tpre1b", files, value=TRUE)
files = gsub("pre1_tpre1b", "pre1b_tpre1b", files)
grep("pre2_tpre2a", files, value=TRUE)
files = gsub("pre2_tpre2a", "pre2a_tpre2a", files)
grep("pre3_tpre3b", files, value=TRUE)
files = gsub("pre3_tpre3b", "pre3b_tpre3b", files)



grep("pre2_tpre2b", files, value=TRUE)
grep("pre3_tpre3a", files, value=TRUE)
grep("pre4_tpre4a", files, value=TRUE)
grep("pre4_tpre4b", files, value=TRUE)
grep("pre1_tpre1a", files, value=TRUE)
grep("pre1_tpre1b", files, value=TRUE)
grep("pre2_tpre2a", files, value=TRUE)
grep("pre3_tpre3b", files, value=TRUE)




# Relabel some 
length(grep("van2_tvan2a", files, value=TRUE))
files = gsub("van2_tvan2a", "dav1_tdav1a", files)
length(grep("van2_tvan2a", files, value=TRUE))
length(grep("dav1_tdav1a", files, value=TRUE))

unique(nectar[grep("pre", nectar$siteID),c("siteID", "transectID")])

length(grep("pre4b_tpre4b", files, value=TRUE))
files = gsub("pre4b_tpre4b", "pre8_tpre8a", files)
length(grep("pre4b_tpre4b", files, value=TRUE))
length(grep("pre8_tpre8a", files, value=TRUE))

length(grep("pre4a_tpre4a", files, value=TRUE))
files = gsub("pre4a_tpre4a", "pre7_tpre7a", files)
length(grep("pre4a_tpre4a", files, value=TRUE))
length(grep("pre7_tpre7a", files, value=TRUE))

length(grep("pre3b_tpre3b", files, value=TRUE))
files = gsub("pre3b_tpre3b", "pre6_tpre6a", files)
length(grep("pre3b_tpre3b", files, value=TRUE))
length(grep("pre6_tpre6a", files, value=TRUE))

length(grep("pre3a_tpre3a", files, value=TRUE))
files = gsub("pre3a_tpre3a", "pre5_tpre5a", files)
length(grep("pre3a_tpre3a", files, value=TRUE))
length(grep("pre5_tpre5a", files, value=TRUE))

length(grep("pre2b_tpre2b", files, value=TRUE))
files = gsub("pre2b_tpre2b", "pre4_tpre4a", files)
length(grep("pre2b_tpre2b", files, value=TRUE))
length(grep("pre4_tpre4a", files, value=TRUE))

length(grep("pre2a_tpre2a", files, value=TRUE))
files = gsub("pre2a_tpre2a", "pre3_tpre3a", files)
length(grep("pre2a_tpre2a", files, value=TRUE))
length(grep("pre3_tpre3a", files, value=TRUE))

length(grep("pre1b_tpre1b", files, value=TRUE))
files = gsub("pre1b_tpre1b", "pre2_tpre2a", files)
length(grep("pre1b_tpre1b", files, value=TRUE))
length(grep("pre2_tpre2a", files, value=TRUE))

length(grep("pre1a_tpre1a", files, value=TRUE))
files = gsub("pre1a_tpre1a", "pre1_tpre1a", files)
length(grep("pre1a_tpre1a", files, value=TRUE))
length(grep("pre1_tpre1a", files, value=TRUE))

#check that the locations will be the same
tmp1 = list.files(pattern=".csv|.csv2|.pdf", recursive = TRUE)
tmp2 = files
tmp1 = sapply(strsplit(tmp1, "/"), FUN = function(x) paste(x[1:5], collapse="/"))
tmp2 = sapply(strsplit(files, "/"), FUN = function(x) paste(x[1:5], collapse="/"))
all.equal(tmp1, tmp2)

file.rename(list.files(pattern=".csv|.csv2|.pdf", recursive = TRUE), files)




################################################################################