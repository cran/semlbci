skip_on_cran()

library(testthat)
library(semlbci)

# Fit the model

library(lavaan)

data(simple_med_mg)
dat <- simple_med_mg
mod <-
"
m ~ c(a1, a2)*x
y ~ c(b1, b2)*m
"
fit <- lavaan::sem(mod, simple_med_mg, fixed.x = FALSE, test = "satorra.bentler", group = "gp")

# Find the scaling factors

sf1 <- scaling_factor3(fit, 1)
sf2 <- scaling_factor3(fit, 10)

# Find the LBCIs

ciperc <- .96

fn_constr0 <- set_constraint(fit, ciperc = ciperc)

# opts0 <- list(print_level = 3)
opts0 <- list()
opts0 <- list(#ftol_abs = 1e-7,
              ftol_rel = 1e-4
              # xtol_abs = 1e-7,
              # xtol_rel = 1e-7
              # print_level = 3
              )
time1l <- system.time(out1l <- ci_bound_wn_i( 1, 16, sem_out = fit, f_constr = fn_constr0, which = "lbound", opts = opts0, verbose = TRUE, ciperc = ciperc, sf = sf1$c_r, sf2 = sf1$c_rb))
time1u <- system.time(out1u <- ci_bound_wn_i( 1, 16, sem_out = fit, f_constr = fn_constr0, which = "ubound", opts = list( ftol_rel = 1e-6), verbose = TRUE, ciperc = ciperc, sf = sf1$c_r, sf2 = sf1$c_rb))
time2l <- system.time(out2l <- ci_bound_wn_i(10, 16, sem_out = fit, f_constr = fn_constr0, which = "lbound", opts = opts0, verbose = TRUE, ciperc = ciperc, sf = sf2$c_r, sf2 = sf2$c_rb))
time2u <- system.time(out2u <- ci_bound_wn_i(10, 16, sem_out = fit, f_constr = fn_constr0, which = "ubound", opts = opts0, verbose = TRUE, ciperc = ciperc, sf = sf2$c_r, sf2 = sf2$c_rb))

# 2023-10-23: Updated precomputed answers manually checked for validity.
# 2023-10-23: Tolerance updated to allow for cross-platform differences.
test_that("Check against precomputed answers", {
    expect_equal(out1l$bound, -0.190309, tolerance = 1e-3)
    expect_equal(out1u$bound, 2.752005, tolerance = 1e-4)
    expect_equal(out2l$bound, 0.362989, tolerance = 1e-4)
    expect_equal(out2u$bound, 0.7840242, tolerance = 1e-4)
  })

skip("Run only if data changed")

# Check the results

modc0 <-
"
m ~ c(a1, a2)*x
y ~ c(b1, b2)*m
"

test_limit <- out1l
modc <- paste(modc0, "\na1 == ", test_limit$bound)
fitc <- lavaan::sem(modc, simple_med_mg, fixed.x = FALSE, do.fit = FALSE, test = "satorra.bentler", group = "gp")
ptable <- parameterTable(fitc)
ptable[ptable$free > 0, "est"] <- test_limit$diag$history$solution
fitc <- update(fitc, start = ptable, do.fit = TRUE,
                   baseline = FALSE, h1 = FALSE, se = "none",
                   verbose = TRUE
                  #  optim.force.converged = TRUE,
                  #  optim.dx.tol = .01,
                  #  warn = FALSE,
                  #  control = list(
                  #     eval.max = 2,
                  #     iterations = 1,
                  #     control.outer = list(tol = 1e-02,
                  #                          itmax = 1)
                  # )
                )
fitc_out1l <- fitc

test_limit <- out1u
modc <- paste(modc0, "\na1 == ", test_limit$bound)
fitc <- lavaan::sem(modc, simple_med_mg, fixed.x = FALSE, do.fit = FALSE, test = "satorra.bentler", group = "gp")
ptable <- parameterTable(fitc)
ptable[ptable$free > 0, "est"] <- test_limit$diag$history$solution
fitc <- update(fitc, start = ptable, do.fit = TRUE,
                   baseline = FALSE, h1 = FALSE, se = "none",
                   verbose = TRUE
                  #  optim.force.converged = TRUE,
                  #  optim.dx.tol = .01,
                  #  warn = FALSE,
                  #  control = list(
                  #     eval.max = 2,
                  #     iterations = 1,
                  #     control.outer = list(tol = 1e-02,
                  #                          itmax = 1)
                  # )
                )
fitc_out1u <- fitc

test_limit <- out2l
modc <- paste(modc0, "\nb2 == ", test_limit$bound)
fitc <- lavaan::sem(modc, simple_med_mg, fixed.x = FALSE, do.fit = FALSE, test = "satorra.bentler", group = "gp")
ptable <- parameterTable(fitc)
ptable[ptable$free > 0, "est"] <- test_limit$diag$history$solution
fitc <- update(fitc, start = ptable, do.fit = TRUE,
                   baseline = FALSE, h1 = FALSE, se = "none",
                   verbose = TRUE
                  #  optim.force.converged = TRUE,
                  #  optim.dx.tol = .01,
                  #  warn = FALSE,
                  #  control = list(
                  #     eval.max = 2,
                  #     iterations = 1,
                  #     control.outer = list(tol = 1e-02,
                  #                          itmax = 1)
                  # )
                )
fitc_out2l <- fitc

test_limit <- out2u
modc <- paste(modc0, "\nb2 == ", test_limit$bound)
fitc <- lavaan::sem(modc, simple_med_mg, fixed.x = FALSE, do.fit = FALSE, test = "satorra.bentler", group = "gp")
ptable <- parameterTable(fitc)
ptable[ptable$free > 0, "est"] <- test_limit$diag$history$solution
fitc <- update(fitc, start = ptable, do.fit = TRUE,
                   baseline = FALSE, h1 = FALSE, se = "none",
                   verbose = TRUE
                  #  optim.force.converged = TRUE,
                  #  optim.dx.tol = .01,
                  #  warn = FALSE,
                  #  control = list(
                  #     eval.max = 2,
                  #     iterations = 1,
                  #     control.outer = list(tol = 1e-02,
                  #                          itmax = 1)
                  # )
                )
fitc_out2u <- fitc

(lr_out_1l <- lavTestLRT(fitc_out1l, fit, method = "satorra.2000", A.method = "exact"))
get_scaling_factor(lr_out_1l)
sf1
(lr_out_2u <- lavTestLRT(fitc_out2u, fit, method = "satorra.2000", A.method = "exact"))
get_scaling_factor(lr_out_2u)
sf2

test_that("Check p-value for the chi-square difference test", {
    expect_true(test_p(fitc_out1l, fit, ciperc = ciperc, tol = 1e-4))
    expect_true(test_p(fitc_out1u, fit, ciperc = ciperc, tol = 1e-4))
    expect_true(test_p(fitc_out2l, fit, ciperc = ciperc, tol = 1e-4))
    expect_true(test_p(fitc_out2u, fit, ciperc = ciperc, tol = 1e-4))
  })

