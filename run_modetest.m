function [vec, lambdas, e_val, e_vec, F] = run_modetest(mics, smodes, amodes, winsize, rlo, rhi, directory)
%	run_modetest - find and plot the modes of a multichannel signal
%		run_modetest(mics, smodes, amodes, winsize)
%		tests analysis / resynthesis
%------------
%	returns:
%------------
%	arguments:
%		mics		: the number of spatially arranged microphones
%		smodes		: the number of modes to synthesize
%		amodes		: the order of the linear predictions
%		winsize		: the size of the covariance matrix's summation window
%		rlo			: the lowest the magnitudes of lambda can be
%		rhi			: the highest " 	"		"	"		"	"
%		directory	: where to save the multichannel wave file
if directory(length(directory)) != "/"
	directory = [directory, "/"];
end
if exist(directory) != 7
	printf("making directory %s...\n", directory);
	mkdir(directory);
else
	printf("found directory %s...\n", directory);
end
	printf("synthesizing...\n");
	magshift = rlo;
	magscale = rhi - rlo;
	[vec, lambdas, F] = modesynth(mics, smodes, winsize, magscale, magshift);
	printf("analyzing...\n");
	[e_vec, e_val] = modesolver(vec, mics, amodes, winsize-amodes-1);
	if exist([directory, "sounds/"]) == 7
		printf("found sounds subfolder...\n");
	else
		mkdir([directory, "sounds/"]);
		printf("made sounds subfolder...\n");
	end
	printf("wav file...\n");
	deinterleave_write([directory, "sounds/"], vec, mics);
	if exist([directory, "figures/"]) == 7
		printf("found plot subfolder...\n");
	else
		mkdir([directory, "figures/"]);
		printf("made plot subfolder...\n");
	end
	subplot(1, 1, 1);
	printf("plotting poles...\n");
	modeplot(lambdas, e_val);
	printf("save plot...\n");
	print("-dpng", [directory, "figures/poles.png"]);
	printf("plotting surfaces...\n");
	for i=1:amodes*mics
		modeplot_surface(e_vec, mics, i);
		num = [ num2str(fix(i/10)), num2str(mod(i, 10))];
		print("-dpng", [directory, "figures/mode", num, ".png"]);
	end
	subplot(1, 1, 1);
	if exist([directory, "data/"]) != 7
		mkdir([directory, "data/"]);
		printf("made data subfolder...\n");
	else
		printf("writing data...\n");
		csvwrite([directory, "data/input_evals.csv"], lambdas);
		csvwrite([directory, "data/output_evals.csv"], diag(e_val));
		csvwrite([directory, "data/input_evec.csv"], e_vec);
		csvwrite([directory, "data/forcing_fn.csv"], F);
		save("-ascii", [directory, "data/test_arguments.csv"],
			"mics","smodes","amodes","winsize","rlo","rhi"
		);

	end
end
