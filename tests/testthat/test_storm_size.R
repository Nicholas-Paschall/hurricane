
test_that("Storm Size looks ok", {

  #testing that an error is produced if the storm year is incorrect
  expect_error(storm_size(c("CAROL"), c(2018), hurdat) )

  #testing that an error is produced when the storm name is not found
  expect_error(storm_size(c("INVALID_STORM"), c(2017), hurdat) )

  #testing that an error is produced when "UNNAMED" is given
  expect_error(storm_size(c("UNNAMED"), c(1958), hurdat) )

  #testing that storm_size returns equivalent results for storm id and name
  florence.size1 <- storm_size( c("FLORENCE"), c(1988), hurdat )
  florence.size2 <- storm_size( c("AL071988"), c(1988), hurdat )
  expect_equal(florence.size1$data, florence.size2$data)

  #testing that storm_size returns equivalent results for lists of storm id and name
  storms.size1 <- storm_size( c("EMILY", "IVAN", "DANNY"),
                              c(1993, 2004, 2009), hurdat)
  storms.size2 <- storm_size( c("AL051993", "AL092004", "AL052009"),
                              c(1993, 2004, 2009), hurdat)
  expect_equal( storms.size1$data, storms.size2$data )

})
