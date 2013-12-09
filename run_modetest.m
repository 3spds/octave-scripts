function [vec, lambdas, e_val, e_vec, F] = run_modetest(mics, smodes, amodes, winsize, rlo, rhi)
%	run_modetest - find and plot the modes of a multichannel signal
%		run_modetest(mics, smodes, amodes, winsize)
%		tests analysis / resynthesis
%------------
%	returns:
%------------
%	arguments:
%		mics	: the number of spatially arranged microphones
%		smodes	: the number of modes to synthesize
%		amodes	: the order of the linear predictions
%		winsize	: the size of the covariance matrix's summation window
%		rlo		: the lowest the magnitudes of lambda can be
%		rhi		: the highest " 	"		"	"		"	"

printf("synthesizing...\n");
magshift = rlo;
magscale = rhi - rlo;
[vec, lambdas, F] = modesynth(mics, smodes, winsize, magscale, magshift);
printf("analyzing...\n");
[e_vec, e_val] = modesolver(vec, mics, amodes, winsize-amodes);
printf("plotting...\n");
modeplot(lambdas, e_val);

end
