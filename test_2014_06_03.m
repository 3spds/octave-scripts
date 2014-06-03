mics = 1;
order = 4;
winsize = 10000;
mscale = 0.001;
mshift = 0.999;
[vec, lambdas, f, z, w, r] = modesynth(mics, order, winsize, mscale, mshift);
[evec, eval] = modesolver(vec, mics, order, winsize-order-1);
enorm = ones(order*mics, 1) * evec(end, :);
evec_n = evec ./ enorm;
c = modal_regression(vec, evec_n, eval, mics, order);
fhat = inverse_filter(c, eval);
rhat = evec_n * fhat;
rhat = real(rhat(end-mics+1:end, 1:end-order));
plot([rhat(1, 1:50); f(1, 1+order:50+order)]');
corr(rhat, r(1, 1+order:end-1))
