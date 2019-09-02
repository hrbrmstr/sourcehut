make_get_request <- function(route_url, next_id = NULL, query = list(), ..., pat = sourcehut_pat()) {

  if (!is.null(next_id)) {
    if (next_id > 1) {
      query[["start"]] = next_id
    }
  }

  httr::GET(
    url = route_url,
    sh_authorize(pat),
    .SOURCEHUT_UA,
    query = query,
    ...
  )

}