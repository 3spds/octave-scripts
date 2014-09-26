function sum_matrix = sum_pairs(size)
%	SUM PAIRS - produce a matrix which sums adjacent pairs of vectors
%		sum_matrix = SUM_PAIRS(size)
%		output matrix will be size*2 rows by size columns.
%       when multiplied on the left by a matrix of row vectors, this matrix combines adjacent pairs of columns
%       make sure <size> is the number of output column vectors, ie _half_ the number of columns in the matrix to be summed
%------------
%	returns:
%		sum_matrix  : the matrix
%------------
%	arguments:
%		size	 	: the number of pairs to sum. output is size*2 rows by size columns.

eye_mat = eye(size);
for index = (1:(size))
    for jndex = (1:2);
        sum_matrix(jndex+((index-1)*2), :) = eye_mat(index, :);
    end
end
sum_matrix;
