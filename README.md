<!-- badges: start -->
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Code size](https://img.shields.io/github/languages/code-size/sfcheung/semlbci.svg)](https://github.com/sfcheung/semlbci)
[![Last Commit at Main](https://img.shields.io/github/last-commit/sfcheung/semlbci.svg)](https://github.com/sfcheung/semlbci/commits/master)
[![R-CMD-check](https://github.com/sfcheung/semlbci/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/sfcheung/semlbci/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

(Version 0.10.3, updated on 2023-05-05, [release history](https://sfcheung.github.io/semlbci/news/index.html))

# semlbci <img src="man/figures/logo.png" align="right" height="150" />

This package includes functions for forming the
likelihood-based confidence intervals (LBCIs) for parameters
in structural equation modeling. It also supports the robust LBCI proposed
by [Falk (2018)](https://doi.org/10.1080/10705511.2017.1367254).
It was described in the following manuscript:

Cheung, S. F., & Pesigan, I. J. A. (2023). *semlbci*:
An R package for forming likelihood-based confidence
intervals for parameter estimates, correlations,
indirect effects, and other derived parameters.
*Structural Equation Modeling: A Multidisciplinary Journal*.
Advance online publication.
https://doi.org/10.1080/10705511.2023.2183860

More information on this package:

https://sfcheung.github.io/semlbci/

# Installation

The latest version can be installed by `remotes::install_github`:

```r
remotes::install_github("sfcheung/semlbci")
```

# How To Use It

Illustration with examples can be found
in the [*Get Started* guide](https://sfcheung.github.io/semlbci/articles/semlbci.html)
(`vignette("semlbci", package = "semlbci")`).

# Implementation

It currently implements the
algorithm illustrated by [Pek and Wu (2018)](https://doi.org/10.1007/s11336-015-9461-1),
adapted from
[Wu and Neale (2012)](https://doi.org/10.1007/s10519-012-9560-z) without adjustment for parameters with
attainable bounds. It also supports the robust LBCI proposed
by Falk (2018). More on the implementation can be found in
the [technical appendices](https://sfcheung.github.io/semlbci/articles/).

# References

Cheung, S. F., & Pesigan, I. J. A. (2023). *semlbci*: An R
package for forming likelihood-based confidence intervals
for parameter estimates, correlations, indirect effects,
and other derived parameters.
*Structural Equation Modeling: A Multidisciplinary Journal*. Advance online publication.
https://doi.org/10.1080/10705511.2023.2183860

Falk, C. F. (2018). Are robust standard errors the best approach
for interval estimation with nonnormal data in structural equation
modeling? *Structural Equation Modeling: A Multidisciplinary
Journal, 25*(2), 244-266.
https://doi.org/10.1080/10705511.2017.1367254

Pek, J., & Wu, H. (2015). Profile likelihood-based confidence
intervals and regions for structural equation models.
*Psychometrika, 80*(4), 1123-1145.
https://doi.org/10.1007/s11336-015-9461-1

Wu, H., & Neale, M. C. (2012). Adjusted confidence intervals for a
bounded parameter. *Behavior Genetics, 42*(6), 886-898.
https://doi.org/10.1007/s10519-012-9560-z
