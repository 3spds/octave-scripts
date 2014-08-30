function evec_n = norm_evec(evec)
%	eigendecomposition regularization - hard thresholding and radial scaling for improved generalization
%       produces a sparse eigenvector basis and regularizes eigenvalues
%	evec_n = norm_evec(evec)
%-------------------------------------------------
%	returns
%       evec_n -  a complex diagonal matrix of eigenvalues, describing the modal frequencies
%                   for a real-valued input, these should be in complex-conjugate pairs
%                   these will be normalized such that their last component is 1 + 0i
%-------------------------------------------------
%	arguments
%		evec   -  a complex diagonal matrix of eigenvalues, describing the modal frequencies
%                   for a real-valued input, these should be in complex-conjugate pairs

enorm = ones(length(evec), 1) * evec(end, :);
evec_n = evec ./ enorm;
