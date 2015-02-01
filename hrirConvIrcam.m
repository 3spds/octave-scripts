function ret = hrirConvIrcam(angle, inPath, outPath)
    [inVec, FS, BPS] = wavread(inPath);
    outVec = [0; 0];
    fInVec = fft(inVec);
    impulsePathL = ["/home/joe/Documents/space~/svn_drop/impulses/ircam.16/L_IRC_1002_C_R0195_T", angle, "_P000.wav"];
    impulsePathR = ["/home/joe/Documents/space~/svn_drop/impulses/ircam.16/R_IRC_1002_C_R0195_T", angle, "_P000.wav"];
    ret = impulsePathL;
    impulseL = wavread(impulsePathL);
    impulseR = wavread(impulsePathR);
    fImpulseL = fft(impulseL, length(inVec));
    fImpulseR = fft(impulseR, length(inVec));
    out = [ifft((fInVec.*fImpulseL))' ; ifft((fInVec.*fImpulseR))'];
    maximum = max(max(out(1, :)), max(out(2, :)));
    out = out ./ maximum;
    wavwrite(out', FS, BPS, outPath);
end
