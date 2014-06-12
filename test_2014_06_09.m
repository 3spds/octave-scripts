%% make h1, a sampled sinusoidal vector, with 8192 points, at freq pi/8...
ang1 = pi/8;
ang2 = pi/16;
[x1, y1] = pol2cart(ang1, 1);
[x2, y2] = pol2cart(ang2, 1);
lambda1 = x1+(1i*y1);
lambda2 = x2+(1i*y2);
winsize = 64;
h1 = lambda1.^(0:winsize-1);

%% h2 has inverted phase...
%h2 = lambda.^(winsize/8:winsize+winsize/8-1);

%% h2 has a different frequency...
h2 = lambda2.^(0:winsize-1);

h = [h1;h2];
%H = [fft(h1); fft(h2)];
H = fft2(h);

%% xfade is an angle from 0 - pi, describing the crossfade weights
xfade = pi;

[xfx, xfy] = pol2cart(xfade, 1);
xfc = xfx + (xfy*1i);

%% k is a 2d row vector with complex conjugate entries of xfade
k = [xfc, 1-xfc];

output = real(ifft(H'*k'))/2;

plot(output);
