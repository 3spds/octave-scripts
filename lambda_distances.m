function distances = lambda_distances(lambdas, eval);

for index = (1:length(lambdas));
    distances(index) = min(abs(diag(eval) - lambdas(index)))^2;
end
distances = mean(distances);
end
