function output = wrap(svec, mics)

len = length(svec);
output = zeros(mics, len/mics);
for i=1:mics
    output(i, :) = svec(i:mics:len);
end
output = output;
