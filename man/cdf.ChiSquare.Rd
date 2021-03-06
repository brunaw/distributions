% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ChiSquare.R
\name{cdf.ChiSquare}
\alias{cdf.ChiSquare}
\title{Evaluate the cumulative distribution function of a chi square distribution}
\usage{
\method{cdf}{ChiSquare}(d, x, ...)
}
\arguments{
\item{d}{A \code{ChiSquare} object created by a call to \code{\link[=ChiSquare]{ChiSquare()}}.}

\item{x}{A vector of elements whose cumulative probabilities you would
like to determine given the distribution \code{d}.}

\item{...}{Unused. Unevaluated arguments will generate a warning to
catch mispellings or other possible errors.}
}
\value{
A vector of probabilities, one for each element of \code{x}.
}
\description{
Evaluate the cumulative distribution function of a chi square distribution
}
\examples{

X <- ChiSquare(5)
X

random(X, 10)

pdf(X, 2)
log_pdf(X, 2)

cdf(X, 4)
quantile(X, 0.7)

cdf(X, quantile(X, 0.7))
quantile(X, cdf(X, 7))

}
