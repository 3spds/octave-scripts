%   8/28/14
%       residual estimation error measurement
%

mics = 1;
order = 4;
winsize = 10000;
mscale = 0.001;
mshift = 0.999;
alpha = 0;
directory = "/media/joe/Milarepa/experiments/2014_08_29/d/";
trial = 6;

err = 0;

for mshift = (0.999:0.1:0.999);
    [vec, lambdas, f, z, w, r] = modesynth(mics, order, winsize, mscale, mshift);
    %lengthr = length(r)
    for index = (0:11);
        r = rand(1, winsize)*2-1;
        vec = modal_filter(lambdas, z, w, r);
     %   lengthvec = length(vec)
        alpha = (10.^(index/2)) - 1;
        [resid, evec, eval] = modal_residuals(vec, mics, order, winsize, alpha);
        R = fft(r(length(r)-length(resid)+1:end));
        R = R(1:length(R)/2);
        RESID = fft(resid);
        RESID = RESID(1:length(RESID)/2);
        subplot(2, 1, 1);
        plot((abs(R)./max(abs(R))).^2, "color", "r");
        hold on;
        plot((abs(RESID)./max(abs(RESID))).^2, "color", "b");
        hold off;
        subplot(2, 1, 2);
%        print("-dpng", [directory, num2str(trial), "/power_spectrum_", num2str(index), ".png"]);
        modeplot_lin(lambdas, eval, 1);
%        print("-dpng", [directory, num2str(trial), "/poles_", num2str(index), ".png"]);
        err(trial, index+1) = (1-abs(corr(resid, r(1, 1+order:end-1))))^2;
        print("-dpng", [directory, num2str(trial), "/resid_eigs_", num2str(index), ".png"]);
        save("-text", [directory, "data", num2str(index), ".txt"], "lambdas", "r", "resid", "eval", "evec", "order", "mics", "winsize", "alpha");
    end
    subplot(1, 1, 1);
    plot(err(trial, :));
    print("-dpng", [directory, "err", "/err_", num2str(trial), ".png"]);
    trial = trial + 1;
end
