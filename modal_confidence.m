function confidence = modal_confidence(vec, mics, order, winsize, alpha);
[resid_split, evec_n, eval] = modal_residuals_split(vec, mics, order, winsize, alpha);
confidence = mean(abs(real(resid_split))').^2;
confidence = confidence / max(confidence);
