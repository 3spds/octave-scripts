function output = convInterp(pathInput, pathOutput, pathA, pathB, xFade)
%	CONVOLUTION W/ INTERPOLATION - compute an interpolation b/t FIR filters using a phase-vocoder
%		output = convInterp(pathInput, pathOutput, pathA, pathB, xFade)
%           use this for filtering problems
%           impulse responses should be of the same order!!
%------------
%	returns:
%		output  : (col vector) an interpolation between FIRa & FIRb
%------------
%	arguments:
%       pathInput : path to Input vector
%       pathInput : path to Output vector
%       pathA    : path to IR
%       pathB    : path to IR
%       xFade   : (scalar) a crossfade value from 0 (all FIRa) to 1 (all FIRb)

[firA, FS, BPS] = wavread(pathA);
firB = wavread(pathB);
input = wavread(pathInput);
fInput = fft(input);
len = length(fInput);
firC = firInterp(firA, firB, xFade);
fFirC = fft(firC, len);
fOutput = fInput .* fFirC;
output = ifft(fOutput);
wavwrite(output, FS, BPS, pathOutput);
