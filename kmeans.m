function means = kmeans(input, dim, nmeans, iter);
%	KMEANS - k-means algorithm
%		means = kmeans(input, dim, nmeans, iter);
%		finds cluster means of data vector.
%------------
%	returns:
%		means	: a matrix of <dim>-dimensional row vectors. the centers of the clusters found.
%------------
%	arguments:
%		input 	: input row vector. "unwrapped" from the matrix of inputs
%					time moves from left to right, in blocks of size <mics>
%		dim 	: the number dimensions for each vector
%		nmeans	: number of clusters to find
%		iter	: maximum number of iterations
len = length(input);
nvec = len / dim;
input = wrap(input, dim);
means = rand(nmeans, dim);
for x = input;
%   STOPPED HERE...
end
