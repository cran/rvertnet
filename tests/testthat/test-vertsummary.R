context("vertsummary")

test_that("vertsummary works with vertsearch input", {
  skip_on_cran()

  vcr::use_cassette("vertsummary_prep_vertsearch", {
    vs1 <- vertsearch("Junco hyemalis", messages = FALSE, limit = 10)
    vs2 <- vertsearch("Oncorhynchus clarki henshawi", messages = FALSE)
  })
  vs1_summ <- vertsummary(vs1)
  vs2_summ <- vertsummary(vs2)

  expect_is(vs1, "list")
  expect_is(vs1$meta, "list")
  expect_is(vs1$data, "data.frame")
  expect_is(vs1_summ, "vertsummary")
  expect_is(vs1_summ$country, "table")
  expect_is(vs1_summ$taxon, "table")
  expect_equal(vs1_summ$recs, 10)

  expect_is(vs2, "list")
  expect_is(vs2$meta, "list")
  expect_is(vs2$data, "data.frame")
  expect_is(vs2_summ, "vertsummary")
  expect_is(vs2_summ$country, "table")
  expect_is(vs2_summ$taxon, "table")
  expect_gt(vs2_summ$recs, 10)
})

test_that("vertsummary works with searchbytem input", {
  skip_on_cran()

  vcr::use_cassette("vertsummary_prep_searchbyterm", {
    sbt1 <- searchbyterm(class = "aves", st = "california", lim = 10,
                         messages = FALSE)
  })
  sbt1_summ <- vertsummary(sbt1)

  expect_is(sbt1, "list")
  expect_is(sbt1$meta, "list")
  expect_is(sbt1$data, "data.frame")
  expect_is(sbt1_summ, "vertsummary")
  expect_is(sbt1_summ$country, "table")
  expect_is(sbt1_summ$taxon, "table")
  expect_named(sbt1_summ, c('recs', 'coords', 'errest', 'instcoll',
                            'country', 'year', 'taxon'))
})

test_that("vertsummary works with spatialsearch input", {
  skip_on_cran()

  vcr::use_cassette("vertsummary_prep_spatialsearch", {
    sps1 <- spatialsearch(lat = 33.529, long = -105.694, radius = 2000,
                          lim = 10, messages = FALSE)
  })
  sps1_summ <- vertsummary(sps1)

  expect_is(sps1, "list")
  expect_is(sps1$meta, "list")
  expect_is(sps1$data, "data.frame")
  expect_is(sps1_summ, "vertsummary")
  expect_is(sps1_summ$country, "table")
  expect_is(sps1_summ$taxon, "table")
  expect_equal(sps1_summ$recs, 10)
  expect_named(sps1_summ, c('recs', 'coords', 'errest', 'instcoll',
                            'country', 'year', 'taxon'))
})

test_that("vertsummary fails correctly", {
  skip_on_cran()

  expect_error(vertsummary(), 'argument \"input\" is missing')
  expect_error(vertsummary(5), 'Input must be of class list or data.frame')
})
