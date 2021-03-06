context("bigsearch")

test_that("bigsearch sends email correctly", {
  skip_on_cran()
  
  vcr::use_cassette("bigsearch", {
    a <- bigsearch(specificepithet = "princeps", genus = "ochotona", 
      rfile = "test-bigsearch1", email = "stuff@things.com",
      messages=FALSE)
  })
  
	expect_null(a)
	expect_null(bigsearch(specificepithet = "collaris",
    genus = "ochotona", year = 1960, rfile = "test-bigsearch2",
    email = "stuff@things.com", messages=FALSE))
})

test_that("bigsearch fails correctly", {
  skip_on_cran()
  
  # have to pass in rfile
  expect_error(
    bigsearch(genus = "adfadf", email = "stuff@things.com", messages=FALSE),
    'argument "rfile" is missing')
  # have to pass in email
  expect_error(bigsearch(genus = "adfadf", rfile = "file1", messages=FALSE),
    'argument "email" is missing')
  # have to pass in at least one query term
  expect_error(
    bigsearch(rfile = "file2", email = "stuff@stuff.com", messages=FALSE))
})
