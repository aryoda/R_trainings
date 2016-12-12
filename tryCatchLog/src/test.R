library(tryCatchLog)
f <- function(value) {
  log(value)
}
a <- "100"
tryLog(f(a), dump.errors.to.file = TRUE)
