function [vec, lambda, R] = modesynth_single(winsize, magscale, magshift)
%	MODESYNTH_SINGLE - modal synthesis
%		[vec, lambdas, F, R] = MODESYNTH_SINGLE(winsize, magscale, magshift)
%		synthesizes randomized multichannel modal behavior
%------------
%	returns:
%		vec		: a vector of length <winsize> * <mics>
%		lambdas	: a vector of kb lambdas
%		F		: a "forcing function" matrix of kb rows and winsize cols
%------------
%	arguments:
%		vec	 	: input vector. "unwrapped" from the matrix of inputs
%					time moves from left to right, in blocks of size <mics>
%		mics	: the number of spatially arranged microphones
%		order	: number of modes / number of mics
%		winsize	: length of output vectors

%	lambdas is a vector of kb lambdas. should be in complex conjugate pairs, and lie within the unit circle.
[x, y] = pol2cart(rand(1)*pi, rand(1)*magscale + magshift);
lambda = x+y*1i;

%	R is the forcing function, which is a single vector of length winsize.
R = rand(1, winsize)*2-1;

%	X is a matrix with kb rows and winsize cols that contains the response of each of the the modal filters to F
X = zeros(1, winsize);

for j=1:winsize
    if(j>1)
        X(j) = lambda*X(j-1) + R(j);
    else
        X(j) = R(j);
end
vec = X;
end
