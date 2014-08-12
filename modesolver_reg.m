function [e_vec, e_val] = modesolver_reg(vec, mics, order, winsize, alpha)
%	MODESOLVER w/ REGULARIZATION - find the modes of a multichannel signal
%		[e_vec, e_val] = MODESOLVER_REG(vec, mics, order, winsize)
%		models the multichannel signal as the result of linear transformation T on previous input vectors
%       uses regularization to improve out-of-sample performance
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
%       alpha   : the regularization parameter. the regularizer will be alpha * eye

	N = length(vec);

%	find the average from each mic and remove it
	for i = 1:mics
		vec([i:mics:N]) = vec([i:mics:N]) - mean(vec([i:mics:N]));
	end
%	covariance matrix
	for i = 1:(order+1)*mics
		for j = 1:(order+1)*mics
			C(i,j) = vec([(N - j - (winsize - 1) * mics):mics: (N - j)]) * vec([(N - i - (winsize - 1) * mics):mics: (N - i)])';
		end
	end
%	find pseudoinverse of first kb mics
	cinv = pinv(C([1:order*mics], [1:order*mics]) + (alpha * eye(order*mics)));
%	find prediction matrix that best constructs final data block from all previous vectors
	predictor = (cinv * C([1:order*mics], [order*mics+1:(order+1)*mics]))';
%	construct the companion matrix
	matrix = [zeros((order-1)*mics, mics), eye((order-1)*mics)];
	matrix = [matrix; predictor];
%	diagonalize
	[e_vec, e_val] = eig(matrix);
end
