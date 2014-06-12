%plot effects of rotation vector on magnitude of 2d convolution

numrep = 128;
array = 0;
for xfade = 0:pi/numrep:pi
    output = conv2d(xfade, pi/16, 0, pi/16, pi);
    output = mean(output.*conj(output));
    array = [array; output];
end
array = array(2:end);
