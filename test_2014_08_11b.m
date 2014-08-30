%   regularization parameter tester
%       tests:
%           modesolver_reg
%           modal_filter
%
%	08/11/14
%

mics = 2;
order = 4;
winsize = 1000;
mscale = 0.1;
mshift = 0.9;

[vec, lambdas, f, z, w, r] = modesynth(mics, order, winsize, mscale, mshift);
index = 0;
base = "/media/joe/Milarepa/experiments/2014_08_11/reg_eigs/";
directory = [base, "d", "/"];
mkdir(directory);

for alpha=10.^((0:0.5:5)) - 1;
    index = index + 1;

    [evec, eval] = modesolver_reg(vec, mics, order, winsize-order-1, alpha);

    r1 = rand(1, winsize)*2-1;
    vec1 = modal_filter(lambdas, z, w, r1);
    [evec1, eval1] = modesolver_reg(vec1, mics, order, winsize-order-1, alpha);

    r2 = rand(1, winsize)*2-1;
    vec2 = modal_filter(lambdas, z, w, r2);
    [evec2, eval2] = modesolver_reg(vec2, mics, order, winsize-order-1, alpha);

    r3 = rand(1, winsize)*2-1;
    vec3 = modal_filter(lambdas, z, w, r3);
    [evec3, eval3] = modesolver_reg(vec3, mics, order, winsize-order-1, alpha);

    polar(angle([diag(eval), diag(eval1), diag(eval2), diag(eval3)]), abs([diag(eval), diag(eval1), diag(eval2), diag(eval3)]), "x");

    hold on;

    thetas = [0:0.0001:2*pi];
    polar(thetas, ones(length(thetas), 1));

    polar(angle(lambdas), abs(lambdas), "o");

    hold off;

%    print("-dpng", [directory, "eigs", num2str(index), ".png"]);

%    save("-text", [directory, "data", num2str(index), ".txt"], "lambdas", "r", "r1", "r2", "r3", "eval", "eval1", "eval2", "eval3", "evec", "evec1", "evec2", "evec3", "order", "mics", "winsize", "alpha");
end
