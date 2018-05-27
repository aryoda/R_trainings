# Just call the unchanged code

source("your_code_file.R")   # call your unchanged code by sourcing it!

# $ Rscript no_logging.R 
# [1] "f1() called"
# [1] "f2() called"
# [1] "log(-1) = NaN"
# [1] "f2() returns"
# [1] "f1() returns"
# [1] "f1() called"
# [1] "f2() called"
# [1] "log(-1) = NaN"
# Error in log(value) : non-numeric argument to mathematical function
# Calls: source -> withVisible -> eval -> eval -> f1 -> f2
# In addition: Warning messages:
# 1: In log(-1) : NaNs produced
# 2: In log(-1) : NaNs produced
# Execution halted
