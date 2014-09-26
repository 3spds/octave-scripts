function out = poles2pwr(poles, len)
%	poles2pwr - convert a vector of complex poles into a power spectrum of size <len>
%		out = poles2pwr(poles, len)
%
%------------
%	returns:
%		out 	: normalized power spectrum of impulse response. a column vector.
%------------
%	arguments:
%		poles	: poles of the filter. should be complex conjugate pairs for a real impulse response. a row vector.
%		len 	: the fft window size
%

order = length(poles);
out = abs(fft((poles' .^ (1:len))' * (ones(order, 1)*(2/order)))).^2;
out = out ./ max(out);
