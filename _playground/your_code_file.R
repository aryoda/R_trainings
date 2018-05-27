# Store this using the file name "your_code_file.R"
# This could be your code...

f1 <- function(value) {
  print("f1() called")
  f2(value)                 # call another function to show what happens
  print("f1() returns")
}

f2 <- function(value) {
  print("f2() called")
  a <- log(-1)           # This throws a warning: "NaNs produced"
  print(paste("log(-1) =", a))
  b <- log(value)        # This throws an error if you pass a string as value
  print("f2() returns")
}

f1(1)  # produces a warning:
# [1] "f1() called"
# [1] "f2() called"
# [1] "log(-1) = NaN"
# [1] "f2() returns"
# [1] "f1() returns"
# Warning message:
# In log(-1) : NaNs produced

f1("not a number") # produces a warning and an error
# [1] "f1() called"
# [1] "f2() called"
# [1] "log(-1) = NaN"
# Error in log(value) : non-numeric argument to mathematical function
# In addition: Warning message:
# In log(-1) : NaNs produced

