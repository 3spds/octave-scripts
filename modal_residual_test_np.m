function output = modal_residual_test_np(mics, order, winsize, mscale, mshift, directory, rep)

if directory(length(directory)) != "/"
	directory = [directory, "/"];
end
[vec, lambdas, f, z, w, r] = modesynth(mics, order, winsize, mscale, mshift);
[evec, eval] = modesolver(vec, mics, order, winsize-order-1);
enorm = ones(order*mics, 1) * evec(end, :);
evec_n = evec ./ enorm;
c = modal_regression(vec, evec_n, eval, mics, order);
fhat = inverse_filter(c, eval);
rhat = evec_n * fhat;
rhat = real(rhat(end-mics+1:end, 1:end-order));
correlation = corr(rhat, f(1, 1+order:end-1));
save("-text", [directory, "data", num2str(rep), ".txt"],"lambdas", "r", "rhat", "eval", "evec", "order", "mics", "winsize", "correlation");
output = correlation;
endfunction
