function answer = t_func( a, b )

	a = wavread(a);
	b = wavread(b);
	A = fft(a, length(a)*2);
	B = fft(b, length(b)*2);
	answer = A ./ B;

endfunction
