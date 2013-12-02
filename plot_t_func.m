function answer = plot_t_func( a, b )

	answer = t_func(a, b);
	plot(abs(answer((length(answer)/2):length(answer))));
	print -dpng freq.png;
	plot(angle(answer((length(answer)/2):length(answer))));
	print -dpng phase.png;

endfunction
