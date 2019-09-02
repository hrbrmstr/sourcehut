#' Get or set SourceHut Personal Access Token
#'
#' @param force force setting a new SourceHut Personal Access Token
#' @return atomic character vector containing the SourceHut Personal Access Token
#' @references <https://meta.sr.ht/oauth/personal-token>
#' @export
sourcehut_pat <- function(force = FALSE) {

  pat <- Sys.getenv('SOURCEHUT_PAT')
  if (!identical(pat, "") && !force) {
    return(pat)
  }

  if (!interactive()) {
    stop("Please set env var SOURCEHUT_PAT to your SourceHut Personal Access Token",
         call. = FALSE)
  }

  message("Couldn't find env var SOURCEHUT_PAT See ?sourcehut_pat for more details.")
  message("Please enter your SourceHut personal access token and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("SourceHut personal access token entry failed", call. = FALSE)
  }

  message("Updating SOURCEHUT_PAT env var")
  Sys.setenv(SOURCEHUT_PAT = pat)

  pat

}