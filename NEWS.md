# semlbci 0.11.3

## New Feature

- Can plot log profile likelihood of
  parameters using root finding. The
  function is `loglike_compare_ur()`,
  which related helper functions with
  suffix `_ur`. This variant can be used
  for parameters in the standardized
  solution, such as standardized
  regression paths or correlations.
  (0.11.2.1)

## Miscellaneous

- Addressed a minor numerical difference
  in a test. (0.11.2.2)

# semlbci 0.11.2

## New Feature

- Added the method `"ur"` for forming the
  LBCI. It uses root finding without
  derivatives. It is inefficient
  (*very* slow) because
  a model with an equality constraint is
  fitted in each iteration. However, it
  may be able to find the bound for a
  parameter when the `"wn"` method
  cannot. It also supports robust LBCIs
  using Satorra (2000) chi-square
  difference test. (0.10.4.2)

- Add `get_cibound_status_not_0()`. It
  checks the status of each bound in
  a `semlbci` object, and returns as
  a list the `cibound` objects of
  bounds with status not equal to zero.
  For diagnostic purpose. (0.10.4.13)

- When calling `semlbci()`, users can
  use `lavaan` model syntax operators to
  select parameters. Supported operators
  are `"~"`, `"~~"`, `"=~"`, and `":="`.
  (0.10.4.25)

## (Possibly) Breaking Changes

- Disabled some further attempts in
  the `wn` method by default
  as they rarely help but they usually
  increase
  the processing time unnecessarily.
  If necessary, one of the set of
  attempts, successively lowering the
  lower limits of variances can be
  enabled again by setting `try_lb`
  to `TRUE` when calling `semlbci()`
  (0.10.4.6)

- Added the `timeout` argument to
  `ci_bound_wn_i()`, default to 300
  (300 seconds or 5 minutes). Can be
  used in `semlbci()` too if the method
  is `"wn"` (the default).
  (0.10.4.21)

## Miscellaneous

- Added the option to use load balancing
  when calling `semlbci()` with
  `use_pbapply` set to `TRUE`. Enabled
  by default. (0.10.4.3)

- Added support for dynamic scheduling
  in `semlbci()` when `parallel` is
  `FALSE`. (0.10.4.27)

- Added `fit_lb` and `fit_ub` arguments
  to `ci_bound_wn_i()` for setting
  the bounds. Can also be used
  in `semlbci()` if the method is
  `"wn"` (the defalt).
  (0.10.4.18, 0.10.4.19)

- In `print.semlbci()`, added
  suggestions on what to do if some
  bounds could not be found (0.10.4.22)

- Use whitespace instead of tab to
  align the output of `print.cibound()`.
  (0.10.4.23)

## Bug Fixes

- Revised `ci_bound_wn_i()` and
  `ci_bound_ur_i()` to make
  sure the bound is a numeric object,
  even if `NA`. (0.10.4.5)

- Fixed a bug in `print.cibound()` when
  the call is of the form `xxx::yyy()`.
  (0.10.4.17)

- Fixed a bug with `std_lav()` for
  models with only one factor.
  (0.10.4.20)

- Fixed a bug with `semlbci()`.
  Intercepts are now automatically
  skipped if `standardized` is `TRUE`,
  as stated in the help page.
  (0.10.4.24)

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