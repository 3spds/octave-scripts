%% make h1, a sampled sinusoidal vector, with 8192 points, at freq pi/8...
ang = pi/8;
[x, y] = pol2cart(ang, 1);
lambda = x+(1i*y);
winsize = 64;
h1 = lambda.^(0:winsize-1);

%% h2 has inverted phase...
h2 = lambda.^(winsize/16:winsize+winsize/16-1);

h = [h1;h2];
H = fft2(h);

%% xfade is an angle from 0 - pi, describing the crossfade weights
xfade = pi;

[xfx, xfy] = pol2cart(xfade, 1);
xfc = xfx + (xfy*1i);

%% k is a 2d row vector with complex conjugate entries of xfade
k = [xfc, conj(xfc)];

output = real(ifft(H'*k'))/2;

plot(output);
