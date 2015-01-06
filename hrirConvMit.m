function ret = hrirConvMit(angle, inPath, outPath)
    [inVec, FS, BPS] = wavread(inPath);
    outVec = [0; 0];
    fInVec = fft(inVec);
    angleR = mod(str2num(angle) - 180, 360);
    angleRstr = num2str(angleR);
    if(angleR < 100)
        angleRstr = ["0", angleRstr];
    end
    if(angleR < 10)
        angleRstr = ["0", angleRstr];
    end
    impulsePathL = ["/home/joe/Documents/space~/svn_drop/impulses/mit/L0e", angle, "a.dat.raw.wav"];
    impulsePathR = ["/home/joe/Documents/space~/svn_drop/impulses/mit/L0e", angleRstr, "a.dat.raw.wav"];
    impulseL = wavread(impulsePathL);
    impulseR = wavread(impulsePathR);
    fImpulseL = fft(impulseL, length(inVec));
    fImpulseR = fft(impulseR, length(inVec));
    out = [ifft((fInVec.*fImpulseL))' ; ifft((fInVec.*fImpulseR))'];
    maximum = max(max(out(1, :)), max(out(2, :)));
    out = out ./ maximum;
    wavwrite(out', FS, BPS, outPath);
end
