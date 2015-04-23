# Add a high-level name for group of tests, typically the function name
context("myfunc")

# Simplest test
test_that("Defaults return expected result",{
  result<-myfunc()
  check<-"blah0.5"
  expect_equal(result,check)
})

# Vector test
test_that("Basic vectorisation works",{
  result<-myfunc(a=c(1,1),b=c(2,2), c=c("blah","blah"))
  check<-c("blah0.5","blah0.5")
  expect_equal(result,check)
})

# Non-uniform vectorisation test
test_that("Complex vectorisation works",{
  result<-myfunc(a=c(1,1),b=c(2,2))
  check<-c("blah0.5","blah0.5")
  expect_equal(result,check)
})

# Test a different condition
test_that("Negative a values result in multiplication",{
  result<-myfunc(a=c(-1,-2),b=c(2,2))
  check<-c("blah-2","blah-4")
  expect_equal(result,check)
})

# Test a different condition
test_that("a=0 values result in 0",{
  result<-myfunc(a=0)
  check<-c("blah0")
  expect_equal(result,check)
})

# Test some duff inputs
test_that("errors expectedly",{
  expect_error(myfunc(a="0"))
  expect_error(myfunc(b="0"))
  expect_error(myfunc(c=0))
})

