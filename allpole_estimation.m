function allpole_estimation(directory, mics, order, winsize)
%	allpole_estimation - find the modes of a multichannel signal
%		allpole_estimation(directory, mics, order, winsize)
%		parameter estimation on a directory of (possibly multichannel) soundfiles
%------------
%	arguments:
%		directory	 	: directory where the files are located
%		mics	: the number of spatially arranged microphones
%		order	: the order of the linear predictions
%					computational cost (and perhaps accuracy?) increases considerably with higher values
%		winsize	: the size of the covariance matrix's summation window
%					computational cost (and perhaps accuracy?) increases considerably with higher values
%		( <order> + <winsize> ) * <mics> must be less than or equal to the length( vec )

    origin = pwd;
    no_problem = 0;
	try
		cd(directory);
		names = ls
		num_names = size(names)(1);
        for i = 1:num_names
            fname = names(i, :);
            [vec(i, :), fs, bs] = wavread([directory , fname]);
		end
		no_problem = 1;
	catch
		cd(origin);
		err = lasterr();
		printf(err);
		printf("\n");
	end_try_catch
	cd(origin);
	if no_problem == 1
        for i = 1:num_names
            fname = names(i, :);
            [evec, eval] = modesolver(vec(i, :), mics, order, winsize);
            save("-append", "-ascii", [directory, "parameters"], "fname", "mics", "order", "winsize", "evec", "eval");
        end
    end
end
