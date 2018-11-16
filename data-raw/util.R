stop("This file is not meant to be sourced. Run lines manually.")

## Rename .PDF.pdf to .pdf
old_names <- list.files(path = ".", pattern=".PDF.pdf", recursive=TRUE)
new_names <- gsub(".PDF","",old_names)

for (i in 2:length(old_names)) system(paste("git mv", old_names[i], new_names[i]))
