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
