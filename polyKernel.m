function output = polyKernel(a, b, polyOrder)
%	POLYKERNEL - compute an inner product in polynomial space
%		output = polyKernel(a, b, polyOrder)
%           finds (1 + a' * b)^polyOrder
%           use this for kernel regression, svm, etc...
%           computes an inner product between <a> & <b>, in polynomial space of order <polyOrder>
%------------
%	returns:
%		output  : a scalar value. to construct a full covariance matrix, iterate over many values of a & b
%------------
%	arguments:
%       a       : a scalar value of x
%       b       : a scalar value of x
%		polyOrder : the order of the nonlinear feature transform.
%                       higher values will risk overfit, but could help deal with nonlinearities
%                       lower values will reduce vc dimension, but will reduce the order of nonlinearities

output = (1 + a' * b)^polyOrder;
