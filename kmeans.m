function means = kmeans(vec, dim, nmeans, iter);
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
len = length(vec);
nvec = len / dim;
input = wrap(vec, dim)';
means = rand(nmeans, dim);
%means = [0; 0.5; 1];
b = zeros(len, nmeans);

for iter_index = (1:iter);
    for point_index = (1:nvec);
         for mean_index = (1:nmeans);
%                input(point_index, :) - means(mean_index, :)
%                min(abs(input(point_index, :) - means))
%                abs(input(point_index, :) - means(mean_index, :))

            for b_index = (1:dim);
%                ((point_index-1)*dim)+b_index
                %b(((point_index-1)*dim)+b_index, mean_index) =
                b(((point_index-1)*dim)+b_index, mean_index) = (abs(input(point_index, :) - (means(mean_index, :)) == min(abs(input(point_index, :) - means))))(b_index);
            end
%            (((
%            b(((point_index-1)*dim)+1, mean_index) = (abs(input(point_index, :) - means(mean_index, :)) == min(abs(input(point_index, :) - means)))
%            b = (abs(input(point_index, :) - means(mean_index, :)) == min(abs(input(point_index, :) - means)))
         end
%        for input(
%        mean_index = 1;
%        for m = means;
%            if( abs(x - m) = min(abs(x - means)))
%                labels(point_index, mean_index) = 1;
%            else
%                labels(point_index, mean_index) = 0;
%            end
%            mean_index = mean_index + 1;
%        end
%        point_index = point_index + 1;
%    end
%    mean_index = 1;
%    for m = means;
%        means(mean_index) = sum(labels(:, mean_index) *
%        mean_index = mean_index + 1;
    end
    for mean_index = (1:nmeans);
        means(mean_index, :) = sum(b(:, mean_index) .* input) / sum(b(:, mean_index));
        if(sum(b(:, mean_index)) < 2)
            means(mean_index, :) = rand(1, dim);
        end
    end
end

