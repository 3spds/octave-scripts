b = [e.^(((0:44099)/44100)*1i*2*pi*200).*e.^(-1*(0:44099)*50/44100); e.^(((0:44099)/44100)*1i*2*pi*2000).*e.^(-1*(0:44099)*50/44100); e.^(((0:44099)/44100)*1i*2*pi*6000).*e.^(-1*(0:44099)*50/44100)];

a = wavread("/home/joe/Music/samples/zullo/kit_a/sd.wav");


a = [a, [a(end/2:end); a(1:end/2-1)], [a(round(end/3):end); a(1:round(end/3-1))]];
A = fftn(a, [44100, 3]);
B = fftn(b, [3, 44100]);
C = A.*B';
c = ifftn(C);
c_norm = real(c)/max(real(c)(:));
wavwrite(c_norm, fs, bps, "/home/joe/Music/projects/nDimConv.wav");
