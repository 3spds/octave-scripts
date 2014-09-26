function error = resid_error(estimate, actual, order);
for index = (1:size(estimate)(1));
    error(index) = (1-abs(corr(estimate(index, :), actual(1, 1+order:end-1))))^2;
end
