function modeplot(lambdas, e_val)
%	MODEPLOT - plot the eigenvalues of the analysis vs synthesis
%		MODEPLOT(lambdas, eval)
%		plots complex poles of synthesized versus analyzed modes on z-plane
%------------
%	arguments:
%		lambdas		:	synthesis eigenvalues
%		e_val		:	analysis eigenvalues

%	plot the synthesis eigenvalues
polar(angle(lambdas), abs(lambdas), "x1");
hold on;

%	plot the analysis eigenvalues
polar(angle(diag(e_val)), abs(diag(e_val)), 'x');

%	plot the unit circle for reference
thetas = [0:0.0001:2*pi];
polar(thetas, ones(length(thetas), 1));

hold off;

end
