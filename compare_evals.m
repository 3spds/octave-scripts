function compare_evals(eval_1, eval_2)
%	compare_evals - plot the eigenvalues of two analyses
%		compare_evals(eval_1, eval_2)
%		plots complex poles on z-plane
%------------
%	arguments:
%		e_val_1		:	analysis eigenvalues (as diagonal matrix)
%		e_val_2		:	analysis eigenvalues (as diagonal matrix)

polar(angle(diag(eval_1)), abs(diag(eval_1)), 'x');
hold on;
polar(angle(diag(eval_2)), abs(diag(eval_2)), 'x1');
thetas = [0:0.0001:2*pi];
polar(thetas, ones(length(thetas), 1));
hold off;

end
