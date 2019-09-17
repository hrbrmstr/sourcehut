#' Install a package from a SourceHut git repository
#'
#' Works like [remotes::install_gitlab()], [remotes::install_bitbucket()], [remotes::install_github()] (etc).
#' You can also omit the leading tilde ("~") from the username portion of the repository address
#'
#' @param repo Repository address in the format `username/repo`. You can specify `subdir` and/or `ref` using the
#'        respective parameters (via `...`).
#' @param ... passed on to [remotes::install_git()]
#' @export
install_sourcehut <- function(repo, ...) {

  repo <- repo[1]

  if (!startsWith(repo, "~")) repo <- glue::glue("~{repo}")

  remotes::install_git(url = glue::glue("https://git.sr.ht/{repo}"), ...)

}