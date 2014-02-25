function f = inverse_filter(c, eval)

len = length(c);
f = c(:, 2:len) - c(:, 1:(len-1)) .* (diag(eval)*ones(1,(len-1)));
