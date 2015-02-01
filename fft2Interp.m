outIrs = fft2(outIrs);
pad = zeros(512, (numIRs * interp )- numIRs);
outIrsInterp = [outIrs(:, 1:12), pad, outIrs(:, 13:24)];
outIrsInterp = real(ifft2(outIrsInterp));
%outIrs = ifft2(fft2(real(outIrs), 512, numInterpIrs));

% normalize
%outIrsInterp = outIrsInterp ./ max(max(abs(outIrsInterp)));
outIrsInterp = outIrsInterp * interp;
