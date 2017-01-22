library(tryCatchLog)

send.email <- function(reveiver, body) { }  # dummy function (does nothing)

tryCatchLog(log("not a number"),
            error = function(e) { send.email("admin@home", e)
            })



