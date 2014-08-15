function output = tfunc(x, y, alpha)
%	transfer function - acyclic deconvolution with regularization
%	output = tfunc(x, y, epsilon)
%-------------------------------------------------
%	returns
%		output - a regularized complex row vector, length = max(length(x), length(y)) * 2
%-------------------------------------------------
%	arguments
%		x - a row-vector, real valued, time domain signal representing the input
%		y - a row vector, real valued, time domain signal representing the output
%		alpha - the magnitude of the regularizer vector epsilon

len = max(length(x), length(y)) * 2;

X = fft(x, len);
Y = fft(y, len);

epsilon = (alpha^2)*ones(1, len);

output = Y.*X ./ (abs(X).^2 + epsilon);
