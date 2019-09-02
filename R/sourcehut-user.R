#' Get or set SourceHut username value
#'
#' @param force force setting a new SourceHut username for the current environment?
#' @return atomic character vector containing the SourceHut username (with tilde)
#' @export
sourcehut_user <- function(force = FALSE) {

  user <- Sys.getenv('SOURCEHUT_USERNAME')
  if (!identical(user, "") && !force) {
    return(make_canonical(user))
  }

  if (!interactive()) {
    stop("Please set env var SOURCEHUT_USERNAME to your SourceHut username (with or without the tilde)",
         call. = FALSE)
  }

  message("Couldn't find env var SOURCEHUT_USERNAME See ?sourcehut_user for more details.")
  message("Please enter your SourceHut username and press enter:")
  user <- readline(": ")

  if (identical(user, "")) {
    stop("SourceHut username entry failed", call. = FALSE)
  }

  message("Updating SOURCEHUT_USERNAME env var")
  Sys.setenv(SOURCEHUT_USERNAME = make_canonical(user))

  user

}