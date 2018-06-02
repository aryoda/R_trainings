# devtools::install_github("metacran/cranlogs")
library(cranlogs)
library(data.table)

res <- cran_downloads(when = "last-month", packages = c("futile.logger", "logging", "logR", "logr", "loggr", "dtq", "loggit", "rlogging", "log4r", "luzlogr"))

setDT(res)
res[, .(.N, downloads = sum(count)), by = .(package)][downloads > 0,][order(-downloads),]

#    package        N downloads
# 1: futile.logger 30     29139
# 2:       logging 30      1751
# 3:         log4r 30       753
# 4:       luzlogr 30       204
# 5:        loggit 30       166



