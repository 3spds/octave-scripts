%   regularization test for deconvolution
%       tests tfunc regularized acyclic deconvolution routine
%
%
%	08/13/14
%
mics = 1;
order = 4;
winsize = 1000;
mscale = 0.1;
mshift = 0.9;

directory = "/media/joe/Milarepa/experiments/2014_08_13/b/";

index = 0;

[vec, lambdas, f, z, w, r] = modesynth(mics, order, winsize, mscale, mshift);
for alpha = 10.^(0:0.1:2);
    VEC = fft(vec, length(output));
    %   regularized acyclic deconvolution
    output = tfunc(r, vec, alpha);
    plot(abs(VEC./max(abs(VEC))).^2, "color", "b");
    hold on;
    plot((abs(output)./max(abs(output))).^2, "color", "r");
    hold off;
    index = index + 1;
    print("-dpng", [directory, "transfer_function", num2str(index), ".png"]);
end
