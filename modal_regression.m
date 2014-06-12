function c_n = modal_regression(u1, e_vecs, e_vals, mics, order)
%	modal_regression - finds modal coefficients
%		c_n = modal_regression(u1, e_vecs, e_vals, mics, order)
%		splits the multichannel signal up into modal components, using a previously calculated eigendecomposition
%------------
%	returns:
%		c_n	: modal excitation coefficients matrix
%					these should be complex (given a real signal)
%                   the dimensions will be <mics> * <order> rows x length(<u1>) columns
%------------
%	arguments:
%		u1	 	: input vector. "unwrapped" from the matrix of inputs
%					time moves from left to right, in blocks of size <mics>
%       e_vecs  : eigenvector matrix of u1. can be found using modesolver.m
%       e_vals  : diagonal eigenvalue matrix matrix of u1. can be found using modesolver.m
%		mics	: the number of spatially arranged microphones
%		order	: the order of the linear predictions
%					computational cost (and perhaps accuracy?) increases considerably with higher values

len = length(u1)/mics;
c_n = zeros(order*mics, len);
i = 0;
for i=1:(len-order)
    c_n(:, i) = pinv(e_vecs) * u1(1+mics*(i-1):(order+i-1)*mics)';
end
