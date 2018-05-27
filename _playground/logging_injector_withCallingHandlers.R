# Store this using the file name "logging_injector_withCallingHandlers.R"

# Main function to inject logging of warnings without changing your original source code

library(futile.logger)

flog.threshold(INFO)


# Injecting the logging of errors and warnings:
tryCatch(withCallingHandlers({
  source("your_code_file.R")     # call your unchanged code by sourcing it!
}, error = function(e) {
     call.stack <- sys.calls()   # "sys.calls" within "withCallingHandlers" is like a traceback!
     log.message <- e$message
     flog.error(log.message)     # let's ignore the call.stack for now since it blows-up the output
}, warning = function(w) {
     call.stack <- sys.calls()   # "sys.calls" within "withCallingHandlers" is like a traceback!
     log.message <- w$message
     flog.warn(log.message)     # let's ignore the call.stack for now since it blows-up the output
     invokeRestart("muffleWarning")  # avoid warnings to "bubble up" to being printed at the end by the R runtime
})
 , error = function(e) {
  flog.info("Logging injector: The called user code had errors...")
})

# $ Rscript logging_injector_withCallingHandlers.R
# NULL
# [1] "f1() called"
# [1] "f2() called"
# WARN [2017-06-08 22:35:53] NaNs produced
# [1] "log(-1) = NaN"
# [1] "f2() returns"
# [1] "f1() returns"
# [1] "f1() called"
# [1] "f2() called"
# WARN [2017-06-08 22:35:53] NaNs produced
# [1] "log(-1) = NaN"
# ERROR [2017-06-08 22:35:53] non-numeric argument to mathematical function
# INFO [2017-06-08 22:35:53] Logging injector: The called user code had errors...
