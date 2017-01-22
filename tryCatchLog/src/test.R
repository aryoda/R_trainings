library(tryCatchLog)
f <- function(value) {
  log(value)
}
a <- "100"
tryLog(f(a), dump.errors.to.file = TRUE)


a <- c("don't", "i'm", "he'd")
b <- c("do not", "i am", "he would")
c <- c("i'm going to the party", "he'd go too")
newc <- gsub(a, b, c)
cc <- c
for(i in seq_along(a)) cc <- gsub(a[i], b[i], cc, fixed = TRUE)
cc
