%	big tester
%	runs through many iterations of run_modetest, sweeping params
%
%	12/17/13
%
base = "/media/joe/Milarepa/Quall_Docs/miller/experiments/new_exp2/01/";

logfile = "log";
mics = 4;
smodes = 6;
amodes = 6;
winsize = 1000;

for i=1:10
	rlo = (i-1) / 10;
	rhi = rlo+0.1;
	name = [num2str(fix(i/10)), num2str(mod(i, 10))];
	fname = [base, "trial", name];
	[vec, lambdas, e_val, e_vec, F] = run_modetest(mics, smodes, amodes, winsize, rlo, rhi, fname);
	save("-append", [base, logfile], "fname", "mics", "smodes", "amodes", "winsize", "rlo", "rhi");
end

base = "/media/joe/Milarepa/Quall_Docs/miller/experiments/new_exp2/02/";

logfile = "log";
mics = 4;
smodes = 6;
amodes = 6;
winsize = 1000;

for i=1:10
	rlo = (i-1) / 10;
	rhi = rlo+0.1;
	name = [num2str(fix(i/10)), num2str(mod(i, 10))];
	fname = [base, "trial", name];
	[vec, lambdas, e_val, e_vec, F] = run_modetest(mics, smodes, amodes, winsize, rlo, rhi, fname);
	save("-append", [base, logfile], "fname", "mics", "smodes", "amodes", "winsize", "rlo", "rhi");
end

base = "/media/joe/Milarepa/Quall_Docs/miller/experiments/new_exp2/03/";

logfile = "log";
mics = 4;
smodes = 7;
amodes = 6;
winsize = 1000;

for i=1:10
	rlo = (i-1) / 10;
	rhi = rlo+0.1;
	name = [num2str(fix(i/10)), num2str(mod(i, 10))];
	fname = [base, "trial", name];
	[vec, lambdas, e_val, e_vec, F] = run_modetest(mics, smodes, amodes, winsize, rlo, rhi, fname);
	save("-append", [base, logfile], "fname", "mics", "smodes", "amodes", "winsize", "rlo", "rhi");
end

base = "/media/joe/Milarepa/Quall_Docs/miller/experiments/new_exp2/03/";

logfile = "log";
mics = 4;
smodes = 7;
amodes = 6;
winsize = 1000;

for i=1:10
	rlo = (i-1) / 10;
	rhi = rlo+0.1;
	name = [num2str(fix(i/10)), num2str(mod(i, 10))];
	fname = [base, "trial", name];
	[vec, lambdas, e_val, e_vec, F] = run_modetest(mics, smodes, amodes, winsize, rlo, rhi, fname);
	save("-append", [base, logfile], "fname", "mics", "smodes", "amodes", "winsize", "rlo", "rhi");
end
