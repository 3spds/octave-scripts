%   test 01/28/2015 min phase:
%   preliminary processing -
%       interpolate dataset

granularity = 1; % granularity (degrees)
numIRs = 24;
angleOffset = 360 / numIRs;

irPathHead = "/home/joe/Documents/space~/svn_drop/impulses/ircam.16/L_IRC_1002_C_R0195_T";
irPathTail = "_P000.wav";
outIrs = [];

for thetaIndex = 1:numIRs
%   process thetaIndex into 3 char string w/ leading zeros...
    theta = thetaIndex * angleOffset;
    thetaStringA = intTo3Char(mod(theta, 360));
    thetaStringB = intTo3Char(mod(theta + angleOffset, 360));
%   load adjacent irs
    pathFirA = [irPathHead, thetaStringA, irPathTail];
    pathFirB = [irPathHead, thetaStringB, irPathTail];
    [firA, FS, BPS] = wavread(pathFirA);
    [firB, FS, BPS] = wavread(pathFirB);
%   for a given granularity, interpolate irs
    for xFadeIndex = 1:(angleOffset / granularity)
        xFade = xFadeIndex/angleOffset;
        outIrsColIndex = (xFadeIndex)+ ((thetaIndex-1)*angleOffset);
        outIrsCol = firInterp(firB, firA, xFade, 1);
        outIrsCol = fft(outIrsCol);
        outIrsCol = mps(outIrsCol);
        outIrsCol = ifft(outIrsCol, 64);
        outIrs(:, outIrsColIndex) = outIrsCol;
        xThetaString = intTo3Char(mod(theta-1 + (granularity*xFadeIndex), 360));
        wavwrite(outIrsCol, FS, BPS, ["/home/joe/Documents/space~/svn_drop/impulses/ircam.16.interp1/L_IRC_1002_C_R0195_T", xThetaString, irPathTail]);
    end
end
%test_2015_01_28b
