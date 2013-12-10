function modeplot_surface(e_vec, mics, nmode)
%	MODEPLOT_SURFACE - plot a mode as a mesh
%		MODEPLOT_SURFACE(lambdas, eval)
%		plots a mesh of a mode's spatial behavior over time
%			creates a real and imaginary plot
%------------
%	arguments:
%		e_vec		:	eigenvector matrix
%		mics		:	number of mics
%		nmode		:	which mode to plot

mode = getmode(e_vec, mics, nmode);

subplot(2, 1, 1);
colormap(bone);
mesh(real(mode));
shading faceted;

subplot(2, 1, 2);
colormap(bone);
mesh(imag(mode));
shading faceted;

end
