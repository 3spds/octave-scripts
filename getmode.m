function mode = getmode(e_vec, mics, nmode)
%	getmode - return a single mode as a spatial matrix, with its lambda
%		[mode, lambda] = getmode(e_vec, mics, mode)
%------------
%	returns:
%		mode	: a single eigenvector, unwrapped in space
%					will be a matrix with <order> columns and <mics> rows
%					for real signals, this matrix will be complex
%------------
%	arguments:
%		e_vec	 : the eigenvectors. should be a full rank matrix, kb squared
%					for real data, these will come in complex conjugate pairs
%		mics	: the number of spatially arranged microphones
%		nmode	: which mode to return



flat_mode = e_vec(:, nmode)';
len = length(flat_mode);

for i=1:mics
	mode(i, :) = flat_mode(i:mics:len);
end

mode = mode';

end
