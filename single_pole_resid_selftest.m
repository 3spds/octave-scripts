winsize = 10000;
[vec, lambda, r] = modesynth_single(winsize, 0.1, 0.9);
resid = modal_residuals_nosolve(vec, 1, 1, 1, lambda, winsize);
err = resid_error(resid, r, 1)
