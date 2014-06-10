%	big tester
%	runs through many iterations of run_modetest, sweeping params
%
%	12/17/13
%
base = "/media/joe/Milarepa/residual_test/";


numrep = 1000;
for index=1:10;
    mscale = index / 20;
    mshift = 1-mscale;
    directory = [base, "trial_", num2str(index)];
    if exist(directory) != 7
        printf("making directory %s...\n", directory);
        mkdir(directory);
    end
    sum = 0;
    for rep=1:numrep
        output = modal_residual_test(1, 4, 10000, mscale, mshift, directory, rep);
        sum = abs(sum) + abs(output);
    end
    avg = sum / numrep;
    save("-text", [directory, "/avg.txt"], "avg", "mshift");
end
