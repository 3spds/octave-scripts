function residual = modal_residuals_nosolve(vec, mics, order, evec, eval, winsize)
%	modal residuals (no solve)- find residuals from modal decomposition with regularization
%       computes residual vector with a user-supplied eigenvector basis
%	[residual] = modal_residuals_nosolve(vec, mics, order, evec, eval, winsize)
%-------------------------------------------------
%	returns
%		residual -  a real-valued "error signal" on the regression
%                   a <mics> * <winsize-order-1> matrix
%-------------------------------------------------
%	arguments
%		vec	 	: input vector. "unwrapped" from the matrix of inputs
%					time moves from left to right, in blocks of size <mics>
%		mics	: the number of spatially arranged microphones
%		order	: the order of the linear predictions
%					computational cost (and perhaps accuracy?) increases considerably with higher values
%       evec     -  a complex basis of column eigenvectors, describing the spatial distribution of modes
%                   for a real-valued input, these should be in complex-conjugate pairs
%       eval     -  a complex diagonal matrix of eigenvalues, describing the modal frequencies
%                   for a real-valued input, these should be in complex-conjugate pairs
%		winsize	: the size of the covariance matrix's summation window
%					computational cost (and perhaps accuracy?) increases considerably with higher values
%		( <order> + <winsize> ) * <mics> must be less than or equal to the length( vec )


enorm = ones(order*mics, 1) * evec(end, :);
evec_n = evec ./ enorm;
c = modal_regression(vec, evec_n, eval, mics, order);
fhat = inverse_filter(c, eval);
rhat = evec_n * fhat;
residual = (rhat(end-mics+1:end, 1:end-order));
end
