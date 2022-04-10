test_that("mean_95ci() produces the expected result", {
  expect_equal(mean_95ci(1.02, 0.89, 1.24, 2), "1.02 (0.89, 1.24)")
})
