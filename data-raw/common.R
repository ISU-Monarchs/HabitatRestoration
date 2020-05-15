require("dplyr")
require("tidyr")
require("readr")

read_first_line = function(f, into, skip = 0) {
  readr::read_csv(f, col_names = FALSE, , 
                  col_types = cols(.default = "c"),
                  n_max = 1, skip = skip) %>%
    dplyr::mutate(file = f) %>%
    tidyr::separate(file, into)
}

max_length = function(sections) {
  max(as.integer(unlist(regmatches(sections, gregexpr("[[:digit:]]+", sections)))))
}
