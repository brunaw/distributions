#' Create a chi-square distribution
#'
#' Chi-square distributions show up often in frequentist settings
#' as the sampling distribution of test statistics, especially
#' in maximum likelihood estimation settings. The chi-square
#' distribution with a single degree of freedom is equivalent
#' to a squared standard normal distribution, and also to a Gamma distribution
#' with \eqn{shape = 1/2} and \eqn{rate = 1/2} chi squar\eqn{n}
#' e
#- distr distributions, with  \eqn{n_i = n_1,\dots, n_n},
#' results in a new chi-square distribution with added degrees of
#' freedom, given by \eqn{\sum_{i = 1}^{n} n_i}. Thereby, summing up
#' normal random variables (which are \eqn{ChiSq(1)}) will result in a
#' \eqn{ChiSq(n)}. A chi-square distribution with \eqn{n} degrees of freedom
#' is also a special case of the Gamma distribution with
#' \eqn{shape = n/2} and \eqn{rate = 1/2} (see [Gamma()]).
#'
#' Many more relationships can be built around the chi-square distribution.
#' For instance, if we have an \eqn{X_1 \sim ChiSq(n)} and an
#' \eqn{X_2 \sim ChiSq(m)}, the result of \eqn{\frac{X_1}{n}/\frac{X_2}{m}}
#' is a new random variable which follows an \eqn{F(n, m)} distribution.
#' On the other hand, if we have an \eqn{X_1 \sim Normal(0, 1)} and
#' an \eqn{X_2 \sim ChiSq(n)}, the result of \eqn{\frac{X_1}{\sqrt{X_2/}}
#' will have a Student's T distribution (see [StudentsT()]).
#' Such properties are useful to understand the distributions involved
#' in the most common hypothesis tests.
#'
#'m df Degrees of freedom. Must be positive.
#'
#' @return A `ChiSquare` object.
#' @export
#'
#' @family continuous distributions
#'
#' @details
#'
#'   We recommend reading this documentation on
#'   <https://alexpghayes.github.io/distributions>, where the math
#'   will render with additional detail and much greater clarity.
#'
#'   In the following, let \eqn{X} be a \eqn{\chi^2} random variable with
#'   `df` = \eqn{k}.
#'
#'   **Support**: \eqn{R^+}, the set of positive real numbers
#'
#'   **Mean**: \eqn{k}
#'
#'   **Variance**: \eqn{2k}
#'
#'   **Probability density function (p.d.f)**:
#'
#'   \deqn{
#'     f(x) = \frac{1}{\sqrt{2 \pi \sigma^2}} e^{-(x - \mu)^2 / 2 \sigma^2}
#'   }{
#'     f(x) = 1 / (2 \pi \sigma^2) exp(-(x - \mu)^2 / (2 \sigma^2))
#'   }
#'
#'   **Cumulative distribution function (c.d.f)**:
#'
#'   The cumulative distribution function has the form
#'
#'   \deqn{
#'     F(t) = \int_{-\infty}^t \frac{1}{\sqrt{2 \pi \sigma^2}} e^{-(x - \mu)^2 / 2 \sigma^2} dx
#'   }{
#'     F(t) = integral_{-\infty}^t 1 / (2 \pi \sigma^2) exp(-(x - \mu)^2 / (2 \sigma^2)) dx
#'   }
#'
#'   but this integral does not have a closed form solution and must be
#'   approximated numerically. The c.d.f. of a standard normal is sometimes
#'   called the "error function". The notation \eqn{\Phi(t)} also stands
#'   for the c.d.f. of a standard normal evaluated at \eqn{t}. Z-tables
#'   list the value of \eqn{\Phi(t)} for various \eqn{t}.
#'
#'   **Moment generating function (m.g.f)**:
#'
#'   \deqn{
#'     E(e^{tX}) = e^{\mu t + \sigma^2 t^2 / 2}
#'   }{
#'     E(e^(tX)) = e^(\mu t + \sigma^2 t^2 / 2)
#'   }
#'
#' @examples
#'
#' X <- ChiSquare(5)
#' X
#'
#' random(X, 10)
#'
#' pdf(X, 2)
#' log_pdf(X, 2)
#'
#' cdf(X, 4)
#' quantile(X, 0.7)
#'
#' cdf(X, quantile(X, 0.7))
#' quantile(X, cdf(X, 7))
#'
ChiSquare <- function(df) {
  d <- list(df = df)
  class(d) <- c("ChiSquare", "distribution")
  d
}

#' @export
print.ChiSquare <- function(x, ...) {
  cat(glue("Chi Square distribution (df = {x$df})"))
}

#' Draw a random sample from a chi square distribution
#'
#' @inherit ChiSquare examples
#'
#' @param d A `ChiSquare` object created by a call to [ChiSquare()].
#' @param n The number of samples to draw. Defaults to `1L`.
#' @param ... Unused. Unevaluated arguments will generate a warning to
#'   catch mispellings or other possible errors.
#'
#' @return A numeric vector of length `n`.
#' @export
#'
random.ChiSquare <- function(d, n = 1L, ...) {
  rchisq(n = n, df = d$df)
}

#' Evaluate the probability mass function of a chi square distribution
#'
#' @inherit ChiSquare examples
#' @inheritParams random.ChiSquare
#'
#' @param x A vector of elements whose probabilities you would like to
#'   determine given the distribution `d`.
#' @param ... Unused. Unevaluated arguments will generate a warning to
#'   catch mispellings or other possible errors.
#'
#' @return A vector of probabilities, one for each element of `x`.
#' @export
#'
pdf.ChiSquare <- function(d, x, ...) {
  dchisq(x = x, df = d$df)
}

#' @rdname pdf.ChiSquare
#' @export
#'
log_pdf.ChiSquare <- function(d, x, ...) {
  dchisq(x = x, df = d$df, log = TRUE)
}

#' Evaluate the cumulative distribution function of a chi square distribution
#'
#' @inherit ChiSquare examples
#' @inheritParams random.ChiSquare
#'
#' @param x A vector of elements whose cumulative probabilities you would
#'   like to determine given the distribution `d`.
#' @param ... Unused. Unevaluated arguments will generate a warning to
#'   catch mispellings or other possible errors.
#'
#' @return A vector of probabilities, one for each element of `x`.
#' @export
#'
cdf.ChiSquare <- function(d, x, ...) {
  pchisq(q = x, df = d$df)
}

#' Determine quantiles of a chi square distribution
#'
#' `quantile()` is the inverse of `cdf()`.
#'
#' @inherit ChiSquare examples
#' @inheritParams random.ChiSquare
#'
#' @param p A vector of probabilites.
#' @param ... Unused. Unevaluated arguments will generate a warning to
#'   catch mispellings or other possible errors.
#'
#' @return A vector of quantiles, one for each element of `p`.
#' @export
#'
quantile.ChiSquare <- function(d, p, ...) {

  # TODO: in the documentation, more information on return and
  # how quantiles are calculated

  qchisq(p = p, df = d$df)
}
