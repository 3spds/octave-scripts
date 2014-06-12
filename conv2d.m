function output = conv2d(xfade, freq1, phas1, freq2, phas2)
%% make h1, a sampled sinusoidal vector, with 8192 points, at freq pi/8...
%freq1 = pi/8;
%freq2 = pi/16;
[x1, y1] = pol2cart(freq1, 1);
[xo1, yo1] = pol2cart(phas1, 1);
[x2, y2] = pol2cart(freq2, 1);
[xo2, yo2] = pol2cart(phas2, 1);
lambda1 = x1+(1i*y1);
iphase1 = xo1+(1i*yo1);
lambda2 = x2+(1i*y2);
iphase2 = xo2+(1i*yo2);

winsize = 64;
h1 = iphase1*lambda1.^(0:winsize-1);

%% h2 has inverted phase...
%h2 = lambda.^(winsize/8:winsize+winsize/8-1);

%% h2 has a different frequency...
h2 = iphase2*lambda2.^(0:winsize-1);

h = [h1;-1*h2];
%H = [fft(h1); fft(h2)];
H = fft2(h);

%% xfade is an angle from 0 - pi, describing the crossfade weights
%xfade = pi;

[xfx, xfy] = pol2cart(xfade, 1);
xfc = xfx + (xfy*1i);

% k is the "steering" vector. (what happens when this changes over time?)
%k = [xfc, 1-xfc];
k = [xfx, xfy];

output = ifft2(H'*k')/2;
%output = [real(output), imag(output)];
