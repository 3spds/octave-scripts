function output = firInterp(firA, firB, xFade)
%	FIR INTERPOLATION - compute an interpolation b/t FIR filters using a phase-vocoder
%		output = firInterp(firA, firB, xFade)
%           use this for filtering problems
%           impulse responses should be of the same order!!
%------------
%	returns:
%		output  : (col vector) an interpolation between FIRa & FIRb
%------------
%	arguments:
%       firA    : (col vector) a FIR
%       firB    : (col vector) a FIR
%       xFade   : (scalar) a crossfade value from 0 (all FIRa) to 1 (all FIRb)
%

len = length(firA);

FIRa = fft(firA);
FIRb = fft(firB);

output = pol2cart((xFade*angle(FIRa) + (1-xFade)*angle(FIRb)) , (xFade*abs(FIRa) + (1-xFade)*abs(FIRb)));
output = output(:, 1) + (1i*output(:, 2));
output = real(ifft(output));
