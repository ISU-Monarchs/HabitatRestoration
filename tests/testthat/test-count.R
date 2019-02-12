context("count")

test_that("count is non-negative",
					expect_true(all(nectar$count>=0)))

test_that("count is not too large",
					expect_true(all(nectar$count<9001)))

context("recorder")

test_that("recorder exists",
					expect_true(all(nectar$recorder %in% c("Seth","Teresa"))))
