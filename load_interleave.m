function [svec, fs, bs] = load_interleave(directory)
%	LOAD_INTERLEAVE - load all wav files in a directory and interleave
%		[svec, fs] = LOAD_INTERLEAVE(directory)
%		if the directory contains files that are not mono wav's, you might have problems
%			you might also have problems if you try to use wav's of different sample rates
%				or if they contain different numbers of samples
%			the files will appear in alphabetical order
%			each filename should be the same length in chars (i recommend "01.wav" , "02.wav" , &c...)
%------------
%	returns:
%		svec	: a row vector of samples that interleaves data from each channel
%		fs		: the sampling rate (a scalar)
%		bs		: bit-depth (a scalar)
	origin = pwd;
	try
		cd(directory);
		names = ls;
		num_names = size(names)(1);
		for i = 1:num_names
			if(i == 1)
				[svec(i, :), fs, bs] = wavread([directory , names(i, :)]);
			else
				svec(i, :) = wavread([directory , names(i, :)]);
			endif
		end
	catch
		cd(origin);
		[svec, fs, bs] = [[-1,-1], -1, -1];
		err = lasterr();
		print(err);
		printf("\n");
	end_try_catch
	cd(origin);
	svec = svec(:)';
end
