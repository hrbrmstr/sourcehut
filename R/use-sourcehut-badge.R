#' Adds a SourceHut builds.sr.ht badge to your README
#'
#' See [usethis::use_badge()] for details on what happens under the hood.
#'
#' @param package path to package (assumes current dir)
#' @param username see [sourcehut_user()]
#' @export
use_sourcehut_badge <- function(package = ".", username = sourcehut_user()) {

  pkg <- basename(rprojroot::find_package_root_file(path = package))

  usethis::use_badge(
    badge_name = "builds.sr.ht status",
    href = glue::glue("https://builds.sr.ht/{username}/{package}?"),
    src = glue::glue("https://builds.sr.ht/{username}/{package}.svg")
  )

}
