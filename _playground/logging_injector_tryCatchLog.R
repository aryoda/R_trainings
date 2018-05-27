# Main function to inject logging of warnings without changing your original source code

# install.packages("devtools")
# library(devtools)
# install_github("aryoda/tryCatchLog")
library(tryCatchLog)
library(futile.logger)

flog.threshold(INFO)

tryCatchLog({
  source("your_code_file.R")     # call your unchanged code by sourcing it!
  #, dump.errors.to.file	# TRUE: Saves a dump of the workspace and the call stack named dump_<YYYYMMDD_HHMMSS>.rda
})


# $ Rscript -e "options(keep.source = TRUE); source('logging_injector_tryCatchLog.R')" > log.txt
