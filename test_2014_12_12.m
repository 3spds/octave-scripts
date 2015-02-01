winsize = 10000;
lambda = pol2cart(0.25*pi, 0.8);
lambda = lambda(1) + (1i*lambda(2));
Sigma_e = 0.1;
Sigma_eps = 0.1;
F = lambda;
A = 1;

[y_clean, r] = modesynth_single_norand(winsize, lambda);
noise = pol2cart(pi*randn(winsize, 1), Sigma_e) * [1, 1i]';
y = y_clean + noise';

x = inv(A)*y(1);
P = inv(A)*Sigma_e*inv(A');

for k = 1:winsize
    [x(end+1), P(end+1), K(k)] = kfilt(x(end), P(end), y(k), A, F, Sigma_e, Sigma_eps);
end

%   remove initial guesses for x & P
x = x(2:end);
P = P(2:end);
