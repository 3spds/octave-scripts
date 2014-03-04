function output = lozenge(vec, size)

vec2 = zeros(size, length(vec)+size+1);
for i = 1:size
    vec2(i, :) = [zeros(1, i), vec, zeros(1, size-i+1)];
endfor
output = vec2;
endfunction
