%   regularization test for deconvolution
%       tests tfunc regularized acyclic deconvolution routine
%
%
%	08/13/14
%
mics = 1;
order = 4;
winsize = 1000;
mscale = 0.1;
mshift = 0.9;

%   adjust regularization parameter alpha to find optimum
alpha = 1;

[vec, lambdas, f, z, w, r] = modesynth(mics, order, winsize, mscale, mshift);
VEC = fft(vec, length(output));

%   regularized acyclic deconvolution
output = tfunc(r, vec, alpha);

plot((abs(output)./max(abs(output))).^2, "color", "r");
hold on;
plot(abs(VEC./max(abs(VEC))).^2, "color", "b");
hold off;
