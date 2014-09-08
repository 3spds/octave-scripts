function output = rbfk(gamma, xn, xm)
%	RADIAL BASIS FUNCTION KERNEL - compute an inner product in rbf space
%		output = rbfk(gamma, xn, xm)
%           finds exp(-gamma, ||xn - xm||^2)
%           use this for kernel regression, svm, etc...
%------------
%	returns:
%		output  : a scalar value. to construct a full covariance matrix, iterate over many values of xn & xm
%------------
%	arguments:
%		gamma	: a scalar value representing the 'squeeze' factor.
%                   if gamma is small, gaussians are wide.
%                   if gamma is large, gaussians are thin.
%                   this should be related to the L-1 distance between points.
%		xn  	: a scalar value of x corresponding to the output index
%		xm      : a scalar value of x corresponding to the weight index
output = exp( -1 * gamma * (abs(xn-xm))^2);
end
