function output = polyKernelMatrix(x, polyOrder)
%	POLYNOMIAL KERNEL MATRIX - compute an inner product in polynomial space
%		output = polyKernelMatrix(x, polyOrder)
%           finds output(n, m) = (1 + xm' * xn) ^polyOrder
%               for every xi in vector x
%           use this for kernel regression, svm, etc...
%------------
%	returns:
%		output  : a full covariance matrix, found by iterating polyKernel over all elements of x
%------------
%	arguments:
%		x           : a vector corresponding to the 'inputs' to the system
%		polyOrder   : the order of the nonlinear feature transform.
%                       higher values will risk overfit, but could help deal with nonlinearities
%                       lower values will reduce vc dimension, but will reduce the order of nonlinearities

len = length(x);
for n = (1:len)
    for m = (1:len);
        output(n, m) = polyKernel(x(n), x(m), polyOrder);
    end
end
end
