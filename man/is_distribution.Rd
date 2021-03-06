% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{is_distribution}
\alias{is_distribution}
\title{Is an object a distribution?}
\usage{
is_distribution(x)
}
\arguments{
\item{x}{An object to test.}
}
\description{
\code{is_distribution} tests if \code{x} inherits from \code{"distribution"}.
}
\examples{

Z <- Normal()

is_distribution(Z)
is_distribution(1L)

}
