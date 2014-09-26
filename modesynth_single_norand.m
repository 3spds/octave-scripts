function [vec, R] = modesynth_single_norand(winsize, lambda)
%	MODESYNTH_SINGLE_NORAND - modal synthesis
%		[vec, F, R] = MODESYNTH_SINGLE_NORAND(winsize, lambda)
%		synthesizes randomized multichannel modal behavior
%------------
%	returns:
%		vec		: a vector of length <winsize> * <mics>
%		F		: a "forcing function" matrix of kb rows and winsize cols
%------------
%	arguments:
%		winsize	: length of output vectors
%       lambda  : a complex pole

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
