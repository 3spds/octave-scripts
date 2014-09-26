function modeplot_lin(lambdas, e_val, lines)
%	MODEPLOT - plot the eigenvalues of the analysis vs synthesis
%		MODEPLOT(lambdas, eval)
%		plots complex poles of synthesized versus analyzed modes on z-plane
%------------
%	arguments:
%		lambdas		:	synthesis eigenvalues
%		e_val		:	analysis eigenvalues
%       lines       :   draw lines? 0 / 1
%	plot the unit circle for reference


%	plot the synthesis eigenvalues
polar(angle(lambdas), abs(lambdas), "o1");
hold on;
if lines
    polar(angle(diag(lambdas)), abs(diag(lambdas)), "-1");
endif

%	plot the analysis eigenvalues
polar(angle(diag(e_val)), abs(diag(e_val)), "x3");
if lines
polar(angle(e_val), abs(e_val), "-3");
endif

thetas = [0:0.0001:2*pi];
polar(thetas, ones(length(thetas), 1), ".g");

hold off;

end
