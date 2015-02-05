order = 2;
mics = 1;
omega = pi/8; %angular frequency
lambda = pol2cart(omega, 1) * [1; 1i];
lambdas = diag([lambda, conj(lambda)]); %evals
%x = %input
%S = %evecs
%U = inv(S)* x; %state vector
F = 0;
U = pol2cart(omega, 1) * [1; 1i];
U = diag([U, conj(U)]);
A = rand(length(lambdas)*2); %structure coefficients

u = [diag(real(U)); diag(imag(U))];
h = A * u;

H = [h(1), h(2)+1i*h(3); h(2)-1i*h(3), h(4)];

U1 = exp(1i * H ) * U + F;
