nangle = 1;
numangles = 2;
numradii = 10;
rstep = 1/numradii;
numtrials = 10;
winsize = 10000;
epsi = 0.1;

c_sum = 0;
r_sum = 0;
i_sum = 0;

c_vec = 0;
r_vec = 0;
i_vec = 0;

c_mat = zeros(numradii, numangles);
r_mat = zeros(numradii, numangles);
i_mat = zeros(numradii, numangles);

for angle = [0, pi/2];
    nradii = 1;
    for radius = (0:rstep:1-rstep);
        for trial = (1:numtrials);
            [c_err, r_err, i_err] = wiggle_test(winsize, angle, radius, epsi);
            c_sum = c_sum + c_err;
            r_sum = r_sum + r_err;
            i_sum = i_sum + i_err;
        end
        c_vec(nradii) = c_sum;
        r_vec(nradii) = r_sum;
        i_vec(nradii) = i_sum;
        nradii = nradii + 1;
    end
    c_mat(:, nangle) = c_vec';
    r_mat(:, nangle) = r_vec';
    i_mat(:, nangle) = i_vec';
    nangle = nangle + 1;
end
