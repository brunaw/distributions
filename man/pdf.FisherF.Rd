% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FisherF.R
\name{pdf.FisherF}
\alias{pdf.FisherF}
\alias{log_pdf.FisherF}
\title{Evaluate the probability mass function of an F distribution}
\usage{
\method{pdf}{FisherF}(d, x, ...)

\method{log_pdf}{FisherF}(d, x, ...)
}
\arguments{
\item{d}{A \code{FisherF} object created by a call to \code{\link[=FisherF]{FisherF()}}.}

\item{x}{A vector of elements whose probabilities you would like to
determine given the distribution \code{d}.}

\item{...}{Unused. Unevaluated arguments will generate a warning to
catch mispellings or other possible errors.}
}
\value{
A vector of probabilities, one for each element of \code{x}.
}
\description{
Evaluate the probability mass function of an F distribution
}
\examples{

X <- FisherF(5, 10, 0.2)
X

random(X, 10)

pdf(X, 2)
log_pdf(X, 2)

cdf(X, 4)
quantile(X, 0.7)

cdf(X, quantile(X, 0.7))
quantile(X, cdf(X, 7))

}
