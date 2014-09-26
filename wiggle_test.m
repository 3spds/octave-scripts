function [control, r_err, i_err] = wiggle_test(winsize, angle, radius, epsi);

%winsize = 10000;
%angle = 0;
%radius = 0;
%epsi = 0.0000001;

%   generate complex single-pole modal signal
[x, y] = pol2cart(angle, radius);
lambda = x+y*1i;
[vec, r] = modesynth_single_norand(winsize, lambda);

%   control - approx = target
resid = modal_residuals_nosolve(vec, 1, 1, 1, lambda, winsize);
control = resid_error(resid, r, 1)

%   x-wiggle - approx = target + epsilon
resid = modal_residuals_nosolve(vec, 1, 1, 1, lambda+epsi, winsize);
r_err = resid_error(resid, r, 1)

%   y-wiggle - approx = target + epsilon*1i
resid = modal_residuals_nosolve(vec, 1, 1, 1, lambda+(epsi*1i), winsize);
i_err = resid_error(resid, r, 1)
