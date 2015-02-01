%   test 01/28/2015:
%   preliminary processing -
%       write dataset columns to wav files

numIRs = 24;
interp = 15;
angleOffset = 360 / numIRs;
numInterpIrs = numIRs * interp;
granularity = 360 / numInterpIrs;

irPathHead = "/home/joe/Documents/space~/svn_drop/impulses/ircam.16/L_IRC_1002_C_R0195_T";
irPathTail = "_P000.wav";
outIrs = [];

for thetaIndex = 1:numIRs
%   process thetaIndex into 3 char string w/ leading zeros...
    theta = thetaIndex * angleOffset;
    thetaStringA = intTo3Char(mod(theta, 360));
%   load adjacent irs
    pathFirA = [irPathHead, thetaStringA, irPathTail];
    [firA, FS, BPS] = wavread(pathFirA);
    outIrs(:, thetaIndex) = firA;
end
outIrs = fft2(outIrs);
pad = zeros(512, (numIRs * interp )- numIRs);
outIrsInterp = [outIrs(:, 1:12), pad, outIrs(:, 13:24)];
outIrsInterp = real(ifft2(outIrsInterp));
%outIrs = ifft2(fft2(real(outIrs), 512, numInterpIrs));

% normalize
%outIrsInterp = outIrsInterp ./ max(max(abs(outIrsInterp)));
outIrsInterp = outIrsInterp * 15;

for thetaIndex = 1:(numInterpIrs)
    xThetaString = intTo3Char(thetaIndex-1);
%    wavwrite(outIrsInterp(:, thetaIndex), FS, BPS, ["/home/joe/Documents/space~/svn_drop/impulses/ircam.16.interp.fourier/L_IRC_1002_C_R0195_T", xThetaString, irPathTail]);
end

%outIrs = fft2(outIrs);


