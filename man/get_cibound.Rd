% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_cibound.R
\name{get_cibound}
\alias{get_cibound}
\alias{get_cibound_status_not_0}
\title{A 'cibound' Output From a 'semlbci' Object}
\usage{
get_cibound(x, row_id, which = c("lbound", "ubound"))

get_cibound_status_not_0(x)
}
\arguments{
\item{x}{The output of \code{\link[=semlbci]{semlbci()}}.}

\item{row_id}{The row number in \code{x}. Should be the number
on the left, not the actual row number, because some rows
may be omitted in the printout of \code{x}.}

\item{which}{The bound for which the \code{\link[=ci_bound_wn_i]{ci_bound_wn_i()}} is
to be extracted. Either \code{"lbound"} or \code{"ubound"}.}
}
\value{
\code{\link[=get_cibound]{get_cibound()}} returns a \code{cibound}-class object. See \code{\link[=ci_bound_wn_i]{ci_bound_wn_i()}}
for details.
\code{\link[=get_cibound_status_not_0]{get_cibound_status_not_0()}} returns a list of
\code{cibound}-class objects with \code{status} not equal
to zero. If all bounds have \code{status} equal to
zero, it returns an empty list.
}
\description{
Get the \code{cibound} output of a bound from
a \code{semlbci} object, the output of \code{\link[=semlbci]{semlbci()}}.
}
\details{
The function \code{\link[=get_cibound]{get_cibound()}}
returns the original output of
\code{\link[=ci_bound_wn_i]{ci_bound_wn_i()}} for a bound.
Usually for diagnosis.

The function \code{\link[=get_cibound_status_not_0]{get_cibound_status_not_0()}}
checks the status code of each bound,
and returns the \code{cibound} outputs of
bounds with status code not equal to
zero (i.e., something wrong in the
search). Printing it can print the
diagnostic information for all bounds
that failed in the search.
}
\examples{

library(lavaan)
mod <-
"
m ~ a*x
y ~ b*m
ab := a * b
"
fit_med <- sem(mod, simple_med, fixed.x = FALSE)
p_table <- parameterTable(fit_med)
p_table
lbci_med <- semlbci(fit_med,
                    pars = c("ab :="))
lbci_med

# Get the output of ci_bound_wn_i() of the lower
# bound of the LBCI for the indirect effect:
get_cibound(lbci_med, row_id = 6, which = "lbound")

# Get the output of ci_bound_wn_i() of the upper
# bound of the LBCI for the indirect effect:
get_cibound(lbci_med, row_id = 6, which = "ubound")

}
\seealso{
\code{\link[=semlbci]{semlbci()}}
}
\author{
Shu Fai Cheung \url{https://orcid.org/0000-0002-9871-9448}
}
