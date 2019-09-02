#' Submits a build job for a package
#'
#' This function assumes you know what you're doing and expects a valid
#' `.build.yml` in the `package` directory.
#'
#' @param package path to package (assumes current directory)
#' @param note human-friendly description of this build (markdown, optional)
#' @param tags character vector of strings that identify this build and can be
#'        used to navigate the dashboard. Each string must use only lowercase
#'        alphanumeric characters, or any of "-_."
#' @param read_access,write_access character vector of users that have read or write access to the job.
#' @param execute start build immediately? (Default: `TRUE`)
#' @param secrets provide secrets to the build? (Default: `TRUE`)
#' @param browse open browser to the builder URL? (Default: `FALSE`)
#' @param username see [sourcehut_user()]
#' @param pat see [sourcehut_pat()]
#' @references <https://man.sr.ht/builds.sr.ht/api.md>
#' @export
build_pkg <- function(package = ".",
                      note = "New build",
                      tags = c("package", "rstats"),
                      read_access = NULL,
                      write_access = NULL,
                      execute = TRUE,
                      secrets = TRUE,
                      browse = FALSE,
                      username = sourcehut_user(),
                      pat = sourcehut_pat()) {

  stopifnot(is_package(package))

  build_yml <- rprojroot::find_package_root_file(".build.yml", path = package)
  build_yml <- paste0(readLines(build_yml, warn = FALSE), collapse="\n")

  httr::POST(
    url = "https://builds.sr.ht/api/jobs",
    body = list(
      `manifest` = build_yml,
      `note` = note,
      `tags` = tags,
      `access:read` = read_access,
      `access:write` = write_access,
      `execute` = execute,
      `secrets` = secrets
    ),
    encode = "json",
    sh_authorize(pat),
    .SOURCEHUT_UA
  ) -> res

  out <- process_response(res)

  if ("id" %in% names(out)) {
    if (browse) {
      browseURL(glue::glue("https://builds.sr.ht/{username}/job/{out[['id']]}"))
    }
  }

}

#' @rdname build_pkg
#' @param job_id `builds.sr.ht` job id
#' @export
get_build_status <- function(job_id, pat = sourcehut_pat()) {

  route_url <- glue::glue("https://builds.sr.ht/api/jobs/{job_id}")

  res <- make_get_request(route_url)
  process_response(res)

}

#' @rdname build_pkg
#' @export
get_build_manifest <- function(job_id, pat = sourcehut_pat()) {

  route_url <- glue::glue("https://builds.sr.ht/api/jobs/{job_id}/manifest")

  res <- make_get_request(route_url)

  httr::stop_for_status(res)

  httr::content(res, as = "text", encoding = "UTF-8")

}

#' @rdname build_pkg
#' @export
start_build <- function(job_id, pat = sourcehut_pat()) {

  route_url <- glue::glue("https://builds.sr.ht/api/jobs/{job_id}/start")

  httr::POST(
    url = route_url,
    encode = "json",
    sh_authorize(pat),
    .SOURCEHUT_UA
  ) -> res

  process_response(res)

}
