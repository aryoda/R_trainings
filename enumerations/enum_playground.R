# Source of these examples as starting point for own experiments:
# https://stackoverflow.com/questions/33838392/enum-like-arguments-in-r

EnumTest = function(enum = c("BLUE", "RED", "BLACK")) {
  enumArg <-
    switch(
      match.arg(enum), "BLUE" = 0L, "RED" = 1L, "BLACK" = 2L
    )
  switch(enumArg,
         # do something
  )
}


# Make enums with assigned values or use the name as the value if no value is specified.
# defines the enum by returning list(a= "a", ...)
makeEnum <- function(inputList) {
  # TODO check values
  # if (length(inputList) < 1)
  #   stop ("Enums may not be empty." )
  # inputList.upper <- toupper(as.character(inputList))
  # uniqueEnums <- unique(inputList.upper)
  # if ( ! identical( inputList.upper, uniqueEnums ))
  #   stop ("Enums must be unique (ignoring case)." )
  # validNames <- make.names(inputList.upper)   # Make syntactically valid names out of character vectors.
  # if ( ! identical( inputList.upper, validNames ))
  #   stop( "Enums must be valid R identifiers." )
  
  
  myEnum <- as.list(inputList)
  enumNames <- names(myEnum)
  if (is.null(enumNames)) {
    names(myEnum) <- myEnum
  } else if ("" %in% enumNames) {
    stop("The inputList has some but not all names assigned. They must be all assigned or none assigned")
  }
  return(myEnum)
}


# make a defined list of names and don't care about the values you can use like this:
colors <- makeEnum(c("red", "green", "blue"))

# specify values
hexColors <- makeEnum(c(red="#FF0000", green="#00FF00", blue="#0000FF"))

# It is easy to access the enum names because of code completion:
hexColors$green
# [1] "#00FF00"

# To check if a variable is a value in your enum you can check like this:
param <- hexColors$green
param %in% hexColors

intColors <- makeEnum(c(red=1, green=2, blue=3))
intColors
intColors$red


match.enum.arg <- function(arg, choices) {
  if (missing(choices)) {
    formal.args <- formals(sys.function(sys.parent()))
    choices <- eval(formal.args[[as.character(substitute(arg))]])
  }
  
  if(identical(arg, choices))
    arg <- choices[[1]][1]    # choose the first value of the first list item
  
  allowed.values <- sapply(ColorEnum,function(item) {item[1]})   # extract the integer values of the enum items
  
  if(!is.element(arg, allowed.values))
    stop(paste("'arg' must be one of the values in the 'choices' list:", paste(allowed.values, collapse = ", ")))
  
  return(arg)
}

ColorEnum <- list(BLUE = 1L, RED = 2L, BLACK = 3L)

color2code = function(enum = ColorEnum) { 
  i <- match.enum.arg(enum)
  return(i)
}
