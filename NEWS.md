# semlbci 0.10.4

## New Feature

- The print method of the output of
  `semlbci()` (`print.semlbci()`) can
  print the results in a `lavaan`-like
  format. (0.10.4).

## Miscellaneous

- Updated README.md for CRAN release. Identical
  to the CRAN release in code. (0.10.3.1)
- Added an R CMD check for noSuggests. (0.10.3.2)
- Revised an example of `syntax_to_i()`
  for a coming changes to the parser of
  `lavaan` (0.10.3.3).
- Updated a few tests (0.10.3.4, 0.10.3.5).
- Finalized to 0.10.4.

# semlbci 0.10.3

- First submission to CRAN. (0.10.2)
- Fixed the description in DESCRIPTION. (0.10.3)
- Uncommented some lines of code in examples. (0.10.3)
- Make sure that `cat()` calls can be suppressed. (0.10.3)

# semlbci 0.10.0.12 to 0.10.0.31

- First public release. (0.10.0.12)
- Added R CMD Check GitHub actions. (0.10.0.13)
- WIP Changes to CITATION, DESCRIPTION, and README. (0.10.0.14)
- Revised a test. (0.10.0.15)
- WIP fixed to the documentations. (0.10.0.16)
- Simplified the examples of `loglike_compare()` and helpers.  (0.10.0.17)
- Used precomputed vignettes. (0.10.0.17)
- Added a vignette for `loglike_compare()`. (0.10.0.17)
- Made the examples for `loglike_compare()`,
  `plot.loglike_compare()`, and `nearby_levels()` run faster. (0.10.0.18)
- Fixed a bug that `loglike_compare()` does not pass
  `use_pbapply` to the helper functions. (0.10.0.18)
- Added the `semlbci_out` argument to `loglike_compare()`. (0.10.0.18)
- Added a few arguments to `plot.loglike_compare()` and
  fixed the problems with labels. (0.10.0.19)
- Added `rlang` to Imports to avoid the need to set global
  variables (0.10.0.19)
- Updated the vignette for `loglike_compare()`. (0.10.0.19)
- Set `try_k_more` to 0 such that the examples of
  `loglike_compare()` and `plot.loglike_compare()` can run faster. (0.10.0.20)
- Fixed `details` in documentation. (0.10.0.21)
- Fixed some examples in documentation. (0.10.0.22)
- Proofread the vignettes and recompute them. (0.10.0.23)
- Fixed the pkgdown site. (0.10.0.24)
- Used `bibentry()` in CITATION. (0.10.0.24)
- Updated doc. (0.10.0.25)
- Added simplified versions of the technical appendices as vignettes. (0.10.0.26)
- Updated vignettes. (0.10.0.27)
- Changed a technical appendix from a vignette to an article. (0.10.0.28)
- Proofread the technical articles. (0.10.0.29)
- Updated the sources. (0.10.0.30)
- Fixed some typos and tests. (0.10.0.31)