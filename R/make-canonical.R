make_canonical <- function(username) {
  if (!startsWith(username, "~")) glue::glue("~{username}") else username
}