function output = corr_sweep(a, b, len);
%	CORR SWEEP - correlate delayed versions of a with b
%		output = corr_sweep(a, b, len);
%		output vector will contain correlations between delayed versions of a and (stationary) b.
%------------
%	returns:
%		output  : the correlation vector
%------------
%	arguments:
%       a       : first vector (will be shifted)
%       b       : second vector (will be stationary)
%		len	 	: maximum length of the delay

shifts = lozenge(a, len);
for index = (1:len);
    output(index) = corr(shifts(index, :), [b, zeros(1, len+1)]);
end
output = [corr(a, b), output];
