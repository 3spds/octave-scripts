function [e_vec, e_val] = modesolver_rbf(vec, mics, order, winsize, gamma)
%	MODESOLVER w/ RADIAL BASIS FUNCTIONS - find the modes of a multichannel signal
%		[e_vec, e_val] = MODESOLVER_RBF(vec, mics, order, winsize, gamma)
%		models the multichannel signal as the result of nonlinear transformation T on previous input vectors
%       uses kernel methods to compute nonlinear transform into infinite-dimensional feature space
%       performs linear prediction in nonlinear feature space
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
%		order	: the order of the nonlinear predictions
%					computational cost (and perhaps accuracy?) increases considerably with higher values
%		winsize	: the size of the covariance matrix's summation window
%					computational cost (and perhaps accuracy?) increases considerably with higher values
%		<winsize> + <order> * <mics> must be less than or equal to the length( vec )
%       gamma   : the "squeeze" parameter on the gaussians.

	N = length(vec);

%	find the average from each mic and remove it
	for i = 1:mics
		vec([i:mics:N]) = vec([i:mics:N]) - mean(vec([i:mics:N]));
	end
%	covariance matrix
%	for i = 0:((order+1)*mics)-1
%		for j = 0:((order+1)*mics)-1
%			C(i+1,j+1) = vec([(N - j - (winsize - 1) * mics):mics: (N - j)]) * vec([(N - i - (winsize - 1) * mics):mics: (N - i)])';
%		end
%	end
	C = rbfm(gamma, vec);
	%STOPPED HERE - 9/4/2014


%	find pseudoinverse of first kb mics
	cinv = pinv(C([1:order*mics], [1:order*mics]));
%	find prediction matrix that best constructs final data block from all previous vectors
	predictor = (cinv * C([1:order*mics], [order*mics+1:(order+1)*mics]))';
%	construct the companion matrix
	matrix = [zeros((order-1)*mics, mics), eye((order-1)*mics)];
	matrix = [matrix; predictor];
%	diagonalize
	[e_vec, e_val] = eig(matrix);
end
