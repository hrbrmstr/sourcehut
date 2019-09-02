#' Setup .build.yml for SourceHut builds
#'
#' @md
#' @param username your SourecHut user id (with or without the leading tilde)
#' @param open if `TRUE`, open the resultant file
#' @export
use_builds <- function(username = sourcehut_user(), open = TRUE) {

  check_is_package("use_builds()")

  pkg <- basename(rprojroot::find_package_root_file())

  use_template(
    template = "build.yml",
    save_as = ".build.yml",
    data = list(
      username = username,
      pkg = pkg
    ),
    open = open,
    ignore = TRUE,
    package = "sourcehut"
  )

}