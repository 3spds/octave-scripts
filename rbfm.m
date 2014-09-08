function output = rbfm(gamma, x)
%	RADIAL BASIS FUNCTION MATRIX - compute an inner product in rbf space
%		output = rbfm(gamma, x)
%           finds output(n, m) = exp(-gamma, ||xn - xm||^2)
%               for every xi in vector x
%           use this for kernel regression, svm, etc...
%------------
%	returns:
%		output  : a full covariance matrix, found by iterating rbfk over all elements of x
%------------
%	arguments:
%		gamma	: a scalar value representing the 'squeeze' factor.
%                   if gamma is small, gaussians are wide.
%                   if gamma is large, gaussians are thin.
%                   this should be related to the L-1 distance between points.
%		x       : a vector corresponding to the 'inputs' to the system
len = length(x);
for n = (1:len)
    for m = (1:len);
        output(n, m) = rbfk(gamma, x(n), x(m));
    end
end
end
