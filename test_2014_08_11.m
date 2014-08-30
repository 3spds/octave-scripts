%   regularization parameter tester
%       tests:
%           modesolver_reg
%           modal_filter
%
%	08/11/14
%

mics = 2;
order = 4;
winsize = 1000;
mscale = 0.1;
mshift = 0.9;
alpha = 1000;
base = "/media/joe/Milarepa/experiments/2014_08_11/reg_eigs/";
directory = [base, num2str(clock)];
%mkdir(directory);

[vec, lambdas, f, z, w, r] = modesynth(mics, order, winsize, mscale, mshift);
[evec, eval] = modesolver_reg(vec, mics, order, winsize-order-1, alpha);

r1 = rand(1, winsize)*2-1;
vec1 = modal_filter(lambdas, z, w, r1);
[evec1, eval1] = modesolver_reg(vec1, mics, order, winsize-order-1, alpha);

r2 = rand(1, winsize)*2-1;
vec2 = modal_filter(lambdas, z, w, r2);
[evec2, eval2] = modesolver_reg(vec2, mics, order, winsize-order-1, alpha);

r3 = rand(1, winsize)*2-1;
vec3 = modal_filter(lambdas, z, w, r3);
[evec3, eval3] = modesolver_reg(vec3, mics, order, winsize-order-1, alpha);
