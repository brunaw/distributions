% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Multinomial.R
\name{Multinomial}
\alias{Multinomial}
\title{Create a Multinomial distribution}
\usage{
Multinomial(size, p)
}
\arguments{
\item{size}{The number of trials. Must be an integer greater than or equal
to one. When \code{size = 1L}, the Multinomial distribution reduces to the
categorical distribution (also called the discrete uniform).
Often called \code{n} in textbooks.}

\item{p}{A vector of success probabilities for each trial. \code{p} can
take on any positive value, and the vector is normalized internally.}
}
\value{
A \code{Multinomial} object.
}
\description{
Create a Multinomial distribution
}
\details{
We recommend reading this documentation on
\url{https://alexpghayes.github.io/distributions}, where the math
will render with additional detail and much greater clarity.

In the following, let \eqn{X} be a Multinomial random variable with
success probability \code{p} = \eqn{p}.

TODO: multiple parameterizations BLEH

\strong{Support}: TODO

\strong{Mean}: TODO

\strong{Variance}: TODO

\strong{Probability density function (p.d.f)}:

TODO

\strong{Cumulative distribution function (c.d.f)}:

TODO

\strong{Moment generating function (m.g.f)}:

TODO
}
\examples{

X <- Multinomial(size = 5, p = c(0.3, 0.4, 0.2, 0.1))
X

random(X, 10)

# pdf(X, 2)
# log_pdf(X, 2)


}
\seealso{
Other discrete distributions: \code{\link{Bernoulli}},
  \code{\link{Binomial}}, \code{\link{Categorical}},
  \code{\link{Geometric}}, \code{\link{HyperGeometric}},
  \code{\link{NegativeBinomial}}, \code{\link{Poisson}}
}
\concept{discrete distributions}
\concept{multivariate distributions}
