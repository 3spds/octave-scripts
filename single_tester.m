base = "/media/joe/Milarepa/Quall_Docs/miller/experiments/experiment13/";

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
