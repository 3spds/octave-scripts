function vec = modal_filter(lambdas, Z, W, R)
%	modal_filter - applies a multichannel all-pole filterbank to a mono forcing function
%	vec = modal_filter(lambdas, Z, W, R)
%-------------------------------------------------
%	returns
%		vec - multichannel output vector
%-------------------------------------------------
%	arguments
%		lambdas - a row-vector of eigenfrequencies
%			for simulations of real objects, these will be in complex-conjugate pairs
%		Z - column vector length(lambdas) * channels
%			how the excitation function R couples with the modes
%		W - matrix with < length(lambdas) * channels > rows and < channels > columns
%			describes how the modes couple to the channels
%		R - forcing function, row vector of any length
%			this will get scaled by values in Z to give excitation vectors for the modes in each channel

F = Z*R;

kb = size(W)(1);
mics = size(W)(2);
winsize = length(R);

%	X is a matrix with kb rows and winsize cols that contains the response of each of the the modal filters to F
X = zeros(kb, winsize);
for l=1:kb
	for j=1:winsize
		if(j>1)
			X(l,j) = lambdas(l)*X(l,j-1) + F(l,j);
		else
			X(l,j) = F(l,j);
        endif
	end
end
%	bigX is a matrix with b rows and winsize cols that contains the measurement signals
bigX = zeros(mics, winsize);
for l=1:mics
	for j=1:winsize
		for k=1:kb
			bigX(l,j) = bigX(l,j) + W(k,l)*X(k,j);
		end
	end
end

vec = zeros(1, winsize*mics);
for i=1:mics
	for j=1:winsize
		vec((j*mics)+i) = real(bigX(i,j));
	end
end
end
