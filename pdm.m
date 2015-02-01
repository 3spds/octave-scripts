function dist = pdm(u, v);

%	Poincare Disc Model - find a distance in hyperbolic space
%	dist = pdm(u, v)
%-------------------------------------------------
%	returns
%		dist - distance between points u and v
%-------------------------------------------------
%	arguments
%		u - point u
%		v - point v

invar = 2 * (abs(u - v)^2) / ((1- abs(u)^2) * (1- abs(v)^2));
dist = acosh(1+invar);
