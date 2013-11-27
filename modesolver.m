function [e_vec, e_val] = modesolver(vec, mics, order, winsize)
%	MODESOLVER - find the modes of a multichannel signal
%		[e_vec, e_val] = MODESOLVER(vec, mics, order, winsize)
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

	N = length(vec);

	for i = 1:(order+1)*mics
		for j = 1:(order+1)*mics
%			vec([(N - j - (winsize - 1) * mics):mics: (N - j)]) * vec([(N - i - (winsize - 1) * mics):mics: (N - i)])'
			C(i,j) = vec([(N - j - (winsize - 1) * mics):mics: (N - j)]) * vec([(N - i - (winsize - 1) * mics):mics: (N - i)])';
		end
	end
	cinv = pinv(C([1:order*mics], [1:order*mics]));
	predictor = (cinv * C([1:order*mics], [order*mics+1:(order+1)*mics]))';
	matrix = [zeros((order-1)*mics, mics), eye((order-1)*mics)];
	matrix = [matrix; predictor];
	[e_vec, e_val] = eig(matrix);
end
