%	big tester
%	runs through many iterations of run_modetest, sweeping params
%
%	06/12/14
%
base = "/media/joe/Milarepa/residual_test_order/";


numrep = 1000;
for index=1:4;
    order = index * 2;
    directory = [base, "trial_", num2str(index)];
    if exist(directory) != 7
        printf("making directory %s...\n", directory);
        mkdir(directory);
    end
    sum = 0;
    for rep=1:numrep
        if mod(rep,500)==0
            output = modal_residual_test(1, order, 10000, 0.5, 0.5, directory, rep);
        else
            output = modal_residual_test_np(1, order, 10000, 0.5, 0.5, directory, rep);
        end
        sum = abs(sum) + abs(output);
    end
    avg = sum / numrep;
    save("-text", [directory, "/avg.txt"], "avg", "order");
end
