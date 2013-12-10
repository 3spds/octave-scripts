%	big tester
%	runs through many iterations of run_modetest, sweeping params
%
%	12/09/13
%
base = "/media/joe/Milarepa/Quall_Docs/miller/experiments/experiment05/";

logfile = "log";
mics = 4;
smodes = 4;
amodes = 6;
winsize = 10;

for i=1:10
	rlo = (i-1) / 10;
	rhi = rlo+0.1;
	name = [num2str(fix(i/10)), num2str(mod(i, 10))];
	fname = [base, "trial", name];
	[vec, lambdas, e_val, e_vec, F] = run_modetest(mics, smodes, amodes, winsize, rlo, rhi, fname);
	save("-append", [base, logfile], "fname", "mics", "smodes", "amodes", "winsize", "rlo", "rhi");
end

base = "/media/joe/Milarepa/Quall_Docs/miller/experiments/experiment06/";

logfile = "log";
mics = 4;
smodes = 4;
amodes = 6;
winsize = 100;

for i=1:10
	rlo = (i-1) / 10;
	rhi = rlo+0.1;
	name = [num2str(fix(i/10)), num2str(mod(i, 10))];
	fname = [base, "trial", name];
	[vec, lambdas, e_val, e_vec, F] = run_modetest(mics, smodes, amodes, winsize, rlo, rhi, fname);
	save("-append", [base, logfile], "fname", "mics", "smodes", "amodes", "winsize", "rlo", "rhi");
end

base = "/media/joe/Milarepa/Quall_Docs/miller/experiments/experiment07/";

logfile = "log";
mics = 4;
smodes = 4;
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

base = "/media/joe/Milarepa/Quall_Docs/miller/experiments/experiment08/";

logfile = "log";
mics = 4;
smodes = 4;
amodes = 6;
winsize = 10000;

for i=1:10
	rlo = (i-1) / 10;
	rhi = rlo+0.1;
	name = [num2str(fix(i/10)), num2str(mod(i, 10))];
	fname = [base, "trial", name];
	[vec, lambdas, e_val, e_vec, F] = run_modetest(mics, smodes, amodes, winsize, rlo, rhi, fname);
	save("-append", [base, logfile], "fname", "mics", "smodes", "amodes", "winsize", "rlo", "rhi");
end

base = "/media/joe/Milarepa/Quall_Docs/miller/experiments/experiment09/";

logfile = "log";
mics = 4;
smodes = 6;
amodes = 4;
winsize = 10;

for i=1:10
	rlo = (i-1) / 10;
	rhi = rlo+0.1;
	name = [num2str(fix(i/10)), num2str(mod(i, 10))];
	fname = [base, "trial", name];
	[vec, lambdas, e_val, e_vec, F] = run_modetest(mics, smodes, amodes, winsize, rlo, rhi, fname);
	save("-append", [base, logfile], "fname", "mics", "smodes", "amodes", "winsize", "rlo", "rhi");
end

base = "/media/joe/Milarepa/Quall_Docs/miller/experiments/experiment10/";

logfile = "log";
mics = 4;
smodes = 6;
amodes = 4;
winsize = 100;

for i=1:10
	rlo = (i-1) / 10;
	rhi = rlo+0.1;
	name = [num2str(fix(i/10)), num2str(mod(i, 10))];
	fname = [base, "trial", name];
	[vec, lambdas, e_val, e_vec, F] = run_modetest(mics, smodes, amodes, winsize, rlo, rhi, fname);
	save("-append", [base, logfile], "fname", "mics", "smodes", "amodes", "winsize", "rlo", "rhi");
end

base = "/media/joe/Milarepa/Quall_Docs/miller/experiments/experiment11/";

logfile = "log";
mics = 4;
smodes = 6;
amodes = 4;
winsize = 1000;

for i=1:10
	rlo = (i-1) / 10;
	rhi = rlo+0.1;
	name = [num2str(fix(i/10)), num2str(mod(i, 10))];
	fname = [base, "trial", name];
	[vec, lambdas, e_val, e_vec, F] = run_modetest(mics, smodes, amodes, winsize, rlo, rhi, fname);
	save("-append", [base, logfile], "fname", "mics", "smodes", "amodes", "winsize", "rlo", "rhi");
end

base = "/media/joe/Milarepa/Quall_Docs/miller/experiments/experiment12/";

logfile = "log";
mics = 4;
smodes = 6;
amodes = 4;
winsize = 10000;

for i=1:10
	rlo = (i-1) / 10;
	rhi = rlo+0.1;
	name = [num2str(fix(i/10)), num2str(mod(i, 10))];
	fname = [base, "trial", name];
	[vec, lambdas, e_val, e_vec, F] = run_modetest(mics, smodes, amodes, winsize, rlo, rhi, fname);
	save("-append", [base, logfile], "fname", "mics", "smodes", "amodes", "winsize", "rlo", "rhi");
end
