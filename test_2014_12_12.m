winsize = 1000;
lambda = pol2cart(0.8, 0.25*pi);
lambda = lambda(1) + (1i*lambda(2));
Sigma_e = 0;
Sigma_eps = 0.1;
F = lambda;
A = 1;

[y, r] = modesynth_single_norand(winsize, lambda);

x = inv(A)*y(1);
P = inv(A)*Sigma_eps*inv(A');

for k = 1:winsize
    [x(end+1), P(end+1), K(k)] = kfilt(x(end), P(end), y(k), A, F, Sigma_e, Sigma_eps);
end

%   remove initial guesses for x & P
x = x(2:end);
P = P(2:end);
