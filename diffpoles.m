function out = diffpoles(polesA, polesB, len)
%	diffpoles - compare xfer functions of 2 allpole filters
%		out = diffpoles(polesA, polesB, len)
%
%------------
%	returns:
%		out 	: the mean squared error
%------------
%	arguments:
%		polesA	: poles of the first filter. should be complex conjugate pairs for a real impulse response. a row vector.
%		polesB	: poles of the second filter. should be complex conjugate pairs for a real impulse response. a row vector.
%		len 	: the fft window size. larger values are more expensive but more accurate
%

out = (sum(abs(poles2pwr(polesA, len) - poles2pwr(polesB, len)))/len)^2;
