function [residual, evec_n, evec_reg, eval, eval_reg] = modal_residuals_reg(vec, mics, order, winsize, alpha, b, gamma, delta)
%	modal residuals - find residuals from modal decomposition with regularization
%       performs a regularized linear regression and computes residual vector
%	[residual, evec, eval] = modal_residuals(vec, mics, order, winsize, alpha)
%-------------------------------------------------
%	returns
%		residual -  a real-valued "error signal" on the regression
%                   a <mics> * <winsize-order-1> matrix
%       evec     -  a complex basis of column eigenvectors, describing the spatial distribution of modes
%                   for a real-valued input, these should be in complex-conjugate pairs
%                   these will be normalized such that their last components are 1 + 0i
%       eval     -  a complex diagonal matrix of eigenvalues, describing the modal frequencies
%                   for a real-valued input, these should be in complex-conjugate pairs
%-------------------------------------------------
%	arguments
%		vec	 	: input vector. "unwrapped" from the matrix of inputs
%					time moves from left to right, in blocks of size <mics>
%		mics	: the number of spatially arranged microphones
%		order	: the order of the linear predictions
%					computational cost (and perhaps accuracy?) increases considerably with higher values
%		winsize	: the size of the covariance matrix's summation window
%					computational cost (and perhaps accuracy?) increases considerably with higher values
%		( <order> + <winsize> ) * <mics> must be less than or equal to the length( vec )
%       alpha   : the tikhonov regularization parameter. the regularizer will be alpha * eye
%       b    : the inverse filter regularization parameter. scales the eigenvalues.
%       gamma   : minimum L-1 norm of the eigenvalues' imaginary components (try 0.1)
%                   increasing this value kills more eigenvalues near DC and Nyquist
%       delta   : minimum L-2 norm of the eigenvalues (try 0.4)
%                   effectively, a minimum squared radius.

[evec, eval] = modesolver_reg(vec, mics, order, winsize-order-1, alpha);
[evec_reg, eval_reg] = reg_eigs(eval, evec, b, gamma, delta);
enorm = ones(order*mics, 1) * evec(end, :);
evec_n = evec_reg ./ enorm;
c = modal_regression(vec, evec_n, eval_reg, mics, order);
fhat = inverse_filter(c, eval_reg);
rhat = evec_n * fhat;
residual = real(rhat(end-mics+1:end, 1:end-order));
end
