context("nectar species names")

test_that("There are misspellings",{
  expect_true(all(nectar$`Nectar Plant Species` %in% species$common_name))
  print(unique(nectar$`Nectar Plant Species`)[!(unique(nectar$`Nectar Plant Species`) %in% species$common_name)])
})