#' @description
#' DBI defines an interface for communication between R and relational database
#' management systems.
#' All classes in this package are virtual and need to be extended by
#' the various R/DBMS implementations (so-called *DBI backends*).
#'
#' @inheritSection DBItest::DBIspec Definition
#' @inheritSection DBItest::DBIspec DBI classes and methods
#' @inheritSection DBItest::DBIspec Construction of the DBIDriver object
#'
#' @examples
#' RSQLite::SQLite()
#' @seealso
#'   Important generics: [dbConnect()], [dbGetQuery()],
#'   [dbReadTable()], [dbWriteTable()], [dbDisconnect()]
#'
#'   Formal specification (currently work in progress and incomplete):
#'   `vignette("spec", package = "DBI")`
"_PACKAGE"



# Example file named "DBI-package.R" to declare a package documentation header

# http://r-pkgs.had.co.nz/man.html
# Hadley proposes another naming convention:
# "I usually put this documentation in a file called <package-name>.R"


# You can use roxygen to provide a help page for your package as a whole.
# This is accessed with package?foo, and can be used to describe the most important components of your package.
