mics = 2;
order = 4;
winsize = 1000;
mscale = 0.001;
mshift = 0.999;
[vec, lambdas, f] = modesynth(mics, order, winsize, mscale, mshift);
[evec, eval] = modesolver(vec, mics, order, winsize-order-1);
enorm = ones(order*mics, 1) * evec(end, :);
evec_n = evec ./ enorm;
c = modal_regression(vec, evec_n, eval, mics, order);
fhat = evec_n * inverse_filter(c, eval);

