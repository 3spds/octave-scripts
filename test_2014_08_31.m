%   8/31/14
%       residual estimation error measurement
%

mics = 1;
order = 4;
winsize = 10000;
mscale = 0.001;
mshift = 0.999;
alpha = 0;
directory = "/media/joe/Milarepa/experiments/2014_08_31/e/";
trial = 1;
index = 0;

err = 0;
sample_err = 0;
sample_size = 10;
new_err = 0;
sample_eval = 0;
new_eval = 0;

for mshift = (0.499:0.1:0.999);
    [vec, lambdas, f, z, w, r] = modesynth(mics, order, winsize, mscale, mshift);
    mkdir(directory, num2str(trial));
    %lengthr = length(r)
    for alpha = (0:10^-6:10^-5);
        polar(angle(lambdas), abs(lambdas), "o1");
        hold on;
        polar(angle(diag(lambdas)), abs(diag(lambdas)), "-1");
        for sample = (0:sample_size);
            r = rand(1, winsize)*2-1;
            vec = modal_filter(lambdas, z, w, r);
            %   lengthvec = length(vec)
            %   alpha = (10.^(index/2)) - 1;
            [resid, evec, eval] = modal_residuals(vec, mics, order, winsize, alpha);
%            R = fft(r(length(r)-length(resid)+1:end));
%            R = R(1:length(R)/2);
%            RESID = fft(resid);
%            RESID = RESID(1:length(RESID)/2);
%           subplot(2, 1, 1);
%           plot((abs(R)./max(abs(R))).^2, "color", "r");
%           hold on;
%           plot((abs(RESID)./max(abs(RESID))).^2, "color", "b");
%           hold off;
%           subplot(2, 1, 2);
%           print("-dpng", [directory, num2str(trial), "/power_spectrum_", num2str(index), ".png"]);
%           modeplot_lin(lambdas, eval, 1);
%           print("-dpng", [directory, num2str(trial), "/poles_", num2str(index), ".png"]);
            polar(angle(diag(eval)), abs(diag(eval)), ".3");
            sample_eval = sample_eval + eval;
            new_err = (1-abs(corr(resid, r(1, 1+order:end-1))))^2;
            sample_err = sample_err + new_err;
            save("-text", [directory, num2str(trial), "/data", num2str(index), "_", num2str(sample), ".txt"], "lambdas", "r", "resid", "eval", "evec", "order", "mics", "winsize", "alpha", "new_err");
        end
        sample_eval = sample_eval / sample_size;
        thetas = [0:0.0001:2*pi];
        hold on;
        polar(thetas, ones(length(thetas), 1));
        print("-dpng", [directory, num2str(trial), "/poles_", num2str(index), ".png"]);
        hold off;
        err(trial, index+1) = sample_err / sample_size;
        index = index + 1;
%        print("-dpng", [directory, num2str(trial), "/resid_eigs_", num2str(index), ".png"]);
    end
    plot(err(trial, :));
    print("-dpng", [directory, num2str(trial), "/err", ".png"]);
    trial = trial + 1;
    index = 0;
end
