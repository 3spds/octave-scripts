function modeplot_confidence(lambdas, z, w, eval, confidence);
modeplot_lin(lambdas, eval, 0);
zwconf = mean(abs(w'))'.*abs(z);
zwconf = zwconf / max(zwconf);
hold on;
for index = (1:length(lambdas));
    plot(real(lambdas(index)), imag(lambdas(index)), "or", "markersize", zwconf(index)*10)
end
for index = (1:length(diag(eval)));
    plot(real(diag(eval)(index)), imag(diag(eval)(index)), "ob", "markersize", confidence(index)*10)
end
hold off;
end
