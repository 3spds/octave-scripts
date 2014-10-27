winsize = 10000;
angle = 0.1;
radius = 0.8;
epsi = 0.0000001;
[x, y] = pol2cart(angle, radius);
lambda = x+y*1i;
[vec, r] = modesynth_single_norand(winsize, lambda);
resid = modal_residuals_nosolve(vec, 1, 1, 1, lambda, winsize);
control = resid_error(resid, r, 1)

resid = modal_residuals_nosolve(vec, 1, 1, 1, lambda+epsi, winsize);
r_err = resid_error(resid, r, 1)

resid = modal_residuals_nosolve(vec, 1, 1, 1, lambda+(epsi*1i), winsize);
i_err = resid_error(resid, r, 1)
