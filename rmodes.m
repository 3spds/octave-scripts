function [e_vec, e_val, svec, fs, bs] = rmodes(directory, mics, order, winsize)
%	RMODES - solve modes of a directory
%		[e_vec, e_val, svec, fs, bs] = rmodes(directory)
%		if the directory contains files that are not mono wav's, you might have problems
%			you might also have problems if you try to use wav's of different sample rates
%				or if they contain different numbers of samples
%			the files will appear in alphabetical order
%			each filename should be the same length in chars (i recommend "01.wav" , "02.wav" , &c...)
%------------
%	returns:
%		e_vec	: eigenvectors of transformation matrix T
%		e_val	: eigenvalues of transformation matrix T
%		svec	: a row vector of samples that interleaves data from each channel
%		fs		: the sampling rate (a scalar)
%		bs		: bit-depth (a scalar)
%------------
%	arguments:
%		directory		: the directory you wish to decompose
%		mics	: the number of spatially arranged microphones
%		order	: the order of the linear predictions
%					computational cost (and perhaps accuracy?) increases considerably with higher values
%		winsize	: the size of the covariance matrix's summation window
%					computational cost (and perhaps accuracy?) increases considerably with higher values
%		( <order> + <winsize> ) * <mics> must be less than or equal to the length( vec )

	[svec, fs, bs] = load_interleave(directory);
	if( (order + winsize)*mics <= length(svec))
		[e_vec, e_val] = modesolver(svec, mics, order, winsize);
	else
		printf("( <order> + <winsize> ) * <mics> must be less than or equal to the length( vec )\n");
	endif
end
