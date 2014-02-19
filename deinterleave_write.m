function deinterleave_write(directory, svec, mics)
%	deinterleave_write - load all wav files in a directory and interleave
%		deinterleave_write(directory, svec, mics)
%		the opposite of load_interleave
%			takes a row vector with blocks of size <mics> and unfolds it into
%			an output matrix with <length> / <mics> rows and <mics> columns
%------------
%	arguments:
%		directory	: the target directory (octave will overwrite files if needed)
%		svec		: the row vector with <mics> * <blocks> frames
%		mics		: the number of channels

len = length(svec);
svec = svec - mean(svec);
svec = svec / max(abs(svec));

try
	for i=1:mics
		name = i;
		name = [num2str(fix(i / 10)), num2str(mod(i, 10))];
		name = [directory, name, '.wav'];
		wavwrite(svec(i:mics:len)', 48000, 16, name);
	end
catch
	err = lasterr;
	printf(err);
	printf("\n");
end_try_catch

end
