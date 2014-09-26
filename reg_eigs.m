function [evec_reg, eval_reg] = reg_eigs(eval, evec, b, gamma, delta)
%	eigendecomposition regularization - hard thresholding and radial scaling for improved generalization
%       produces a sparse eigenvector basis and regularizes eigenvalues
%	[evec_reg, eval_reg] = reg_eigs(eval, evec, b, gamma, delta)
%-------------------------------------------------
%	returns
%       evec_reg -  a complex basis of column eigenvectors, describing the spatial distribution of modes
%                   for a real-valued input, these should be in complex-conjugate pairs
%                   eigenvectors corresponding to eigenvalues which do not meet the criteria specified by
%                   regularization parameters <b>, <gamma>, and <delta> will be set to zero.
%       eval_reg -  a complex diagonal matrix of eigenvalues, describing the modal frequencies
%                   for a real-valued input, these should be in complex-conjugate pairs
%                   eigenvalues which do not meet the criteria specified by regularization parameters <b>,
%                   <gamma>, and <delta> will be set to zero.
%-------------------------------------------------
%	arguments
%		eval    -   a diagonal matrix of eigenvalues
%		evec    -   a matrix of column eigenvectors
%		beta    -   radial scaling for eigenvalues. typically a value between 0 and 1. (try 0.9)
%					unilaterally whitens the filters by increasing damping. (only affects eigenvalues.)
%		gamma   -   minimum L-1 norm of the eigenvalues' imaginary components (try 0.1)
%					increasing this value kills more eigenvalues near DC and Nyquist
%       delta   -   minimum L-2 norm of the eigenvalues (try 0.4)
%                   effectively, a minimum squared radius.

mask = (abs(imag(eval)) > gamma) * (eval*abs(eval)^2 > delta);

eval_reg = eval * mask * b;

evec_reg = diag(mask)';
