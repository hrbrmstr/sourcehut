% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/meta.R
\name{meta_ssh_keys}
\alias{meta_ssh_keys}
\title{Retrieve your SSH keys}
\usage{
meta_ssh_keys(id = NULL, next_id = 1, pat = sourcehut_pat())
}
\arguments{
\item{id}{if not \code{NULL} then a valid key ID}

\item{next_id}{if there is a \code{next} field in the API response and you wish
to paginate through the results, feed the value of \code{next} to
the \code{next_id} parameter.}

\item{pat}{see \code{\link[=sourcehut_pat]{sourcehut_pat()}}}
}
\description{
Retrieve your SSH keys
}
