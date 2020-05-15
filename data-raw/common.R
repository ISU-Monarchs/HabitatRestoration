read_first_line = function(f, into) {
  readr::read_csv(f, col_names = FALSE, n_max = 1, skip = 1) %>%
    dplyr::mutate(file = f) %>%
    tidyr::separate(file, into)
}

max_length = function(sections) {
  max(as.integer(unlist(regmatches(sections, gregexpr("[[:digit:]]+", sections)))))
}
