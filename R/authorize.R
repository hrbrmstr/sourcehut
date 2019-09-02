sh_authorize <- function(pat = sourcehut_pat()) {
  httr::add_headers(`Authorization` = glue::glue("token {pat}"))
}