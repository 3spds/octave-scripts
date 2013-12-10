%	modetester.m
%	tests modesolver
%	12/3

mics = 4;
order = 8;
kb = mics * order;
winsize = 100;

%	Z is a vector of length kb that describes how the excitation function couples with the modes
Z = rand(kb/2, 1)*2-1;
Z = [Z; Z];

%	W is a matrix with kb rows and b cols that describes how the modes couple with the mics
W = rand(kb/2, mics)*2-1;
W = [W; W];

%	lambdas is a vector of kb lambdas. should be in complex conjugate pairs, and lie within the unit circle.
[x, y] = pol2cart(rand(1, kb/2)*pi, rand(1, kb/2));
lambdas = [x+y*1i, x-y*1i];

%	R is the forcing function, which is a single vector of length winsize.
R = rand(1, winsize)*2-1;

%	F is a matrix with kb rows and winsize cols, whose rows contain combinations of R with Z
F = Z*R;

%	X is a matrix with kb rows and winsize cols that contains the response of each of the the modal filters to F
X = zeros(kb, winsize);
for l=1:kb
	for j=1:winsize
		if(j>1)
			X(l,j) = lambdas(l)*X(l,j-1) + F(l,j);
		else
			X(l,j) = F(l,j);
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
