#' Retrieve metadata about yourself or another SourceHut user
#'
#' @param username if not `NULL` then a valid SourceHut username
#' @param pat see [sourcehut_pat()]
#' @references <https://man.sr.ht/git.sr.ht/api.md>
#' @export
git_user <- function(username = NULL, pat = sourcehut_pat()) {

  username <- if (!is.null(username)) glue::glue("/{make_canonical(username)}")  else ""

  route_url <- glue::glue("https://git.sr.ht/api/user{username}")

  res <- make_get_request(route_url = route_url, pat = pat)
  process_response(res)

}

#' Retrieve metadata about repositories
#'
#' @param username if not `NULL` then a valid SourceHut username
#' @param next_id if there is a `next` field in the API response and you wish
#'        to paginate through the results, feed the value of `next` to
#'        the `next_id` parameter.
#' @param pat see [sourcehut_pat()]
#' @references <https://man.sr.ht/git.sr.ht/api.md>
#' @export
git_repos <- function(username = NULL, next_id = 1, pat = sourcehut_pat()) {

  username <- if (!is.null(username)) glue::glue("/{make_canonical(username)}")  else ""

  route_url <- glue::glue("https://git.sr.ht/api{username}/repos")

  res <- make_get_request(route_url = route_url, next_id = next_id, pat = pat)
  process_response(res)

}

