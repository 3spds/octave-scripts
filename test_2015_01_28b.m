%   test 01/28/2015:
%   test 1:
%    z-plane interpolation - plot power as function of angle
%    input - directory of impulse responses (ircam.16)
%    output - directory of complex interpolated impulse responses
%        will this preserve power?
%        what is the granularity?
%-------
%   test 2:
%    time-domain interpolation - minimize interference bt adjacents

%   test 1: measure power of each column
magIndex = 1;
for ir = outIrs
    mags(magIndex) = (mean(real(ir).^2))^(1/2);
    magIndex = magIndex + 1;
end
%   plot
plotAngles = 0:359/granularity;
plotAngles = 2*pi * plotAngles/360;
polar(plotAngles, mags);
%    outIrs(:, thetaIndex) = convInterp()

plot(mags);
