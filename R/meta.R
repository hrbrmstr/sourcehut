#' Retrieve metadata about yourself
#'
#' @param pat see [sourcehut_pat()]
#' @references <https://man.sr.ht/meta.sr.ht/user-api.md>
#' @export
meta_profile <- function(pat = sourcehut_pat()) {

  route_url <- "https://meta.sr.ht/api/user/profile"

  res <- make_get_request(route_url = route_url, pat = pat)
  process_response(res)

}

#' Retrieve your audit log
#'
#' @inheritParams meta_profile
#' @export
meta_audit <- function(pat = sourcehut_pat()) {

  route_url <- "https://meta.sr.ht/api/user/audit-log"

  res <- make_get_request(route_url = route_url, pat = pat)
  process_response(res)

}

#' Retrieve your SSH keys
#'
#' @inheritParams meta_profile
#' @param id if not `NULL` then a valid key ID
#' @param next_id if there is a `next` field in the API response and you wish
#'        to paginate through the results, feed the value of `next` to
#'        the `next_id` parameter.
#' @export
meta_ssh_keys <- function(id = NULL, next_id = 1, pat = sourcehut_pat()) {

  id <- if (!is.null(id)) glue::glue("/{id}")  else ""

  route_url <- glue::glue("https://meta.sr.ht/api/user/ssh-keys{id}")

  res <- make_get_request(route_url = route_url, next_id = next_id, pat = pat)
  process_response(res)

}

#' Retrieve your PGP keys
#'
#' @inheritParams meta_profile
#' @inheritParams meta_ssh_keys
#' @rdname meta_profile
#' @export
meta_pgp_keys <- function(id = NULL, next_id = 1, pat = sourcehut_pat()) {

  id <- if (!is.null(id)) glue::glue("/{id}")  else ""

  route_url <- glue::glue("https://meta.sr.ht/api/user/pgp-keys{id}")

  res <- make_get_request(route_url = route_url, next_id = next_id, pat = pat)
  process_response(res)

}




