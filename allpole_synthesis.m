function out_vec = allpole_synthesis(input, lambdas, amps)
%	allpole_synthesis - applies an all-pole filterbank to a forcing function
%	out_vec = allpole_synthesis(input, lambdas, amps)
%-------------------------------------------------
%	returns
%		out_vec - output vector
%-------------------------------------------------
%	arguments
%       input - input vector, ie "forcing function"
%           zero-pad for homogenous response
%		lambdas - a row-vector of eigenfrequencies
%			for simulations of real objects, these will be in complex-conjugate pairs
%       amps - amplitudes of poles
%           for simulations of real objects, these will be in complex-conjugate pairs, matching the lambdas

num_modes = length(lambdas);
num_samps = length(input);

X = zeros(num_samps, num_modes);
out_vec = zeros(num_samps, 1);

for k=1:num_modes
    for i=1:num_samps
        if(i>1)
            X(i, k) = input(i) + lambdas(k)*X(i-1, k);
        else
            X(i, k) = input(i);
        endif
        X(i, k) = X(i, k)*amps(k);
    end
end

for i=1:num_samps
    for k=1:num_modes
        out_vec(i) = out_vec(i) + X(i, k);
    end
end
