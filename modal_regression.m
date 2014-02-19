function c_n = modal_regression(u1, e_vecs, e_vals, mics, order)
%	modal_regression - find the modes of a multichannel signal
%		[e_vec, e_val, expect] = MODESOLVER(vec, mics, order, winsize)
%		models the multichannel signal as the result of linear transformation T on previous input vectors
%------------
%	returns:
%		e_vec	: eigenvectors of transformation matrix T
%					these should correspond to each mode's spatial expression at each microphone
%					for real signals, this matrix will be complex
%		e_val	: eigenvalues of transformation matrix T
%					these should correspond to the complex amplitudes of each mode
%------------
%	arguments:
%		vec	 	: input vector. "unwrapped" from the matrix of inputs
%					time moves from left to right, in blocks of size <mics>
%		mics	: the number of spatially arranged microphones
%		order	: the order of the linear predictions
%					computational cost (and perhaps accuracy?) increases considerably with higher values
%		winsize	: the size of the covariance matrix's summation window
%					computational cost (and perhaps accuracy?) increases considerably with higher values
%		( <order> + <winsize> ) * <mics> must be less than or equal to the length( vec )
len = length(u1);
c_n = zeros(order*mics, len);
i = 0;
for i=0:(len-order)
    c_n(1:order*mics, i+order) = inv(e_vecs) * u1(i+1:mics:order*mics+i)';
end
