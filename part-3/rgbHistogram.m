function [sol] = rgbHistogram(path_to_image, count_bins)
  %citesc matricea de pixeli
  image = imread(path_to_image);
	%extrag R G si B
  r = image(:, :, 1);
	g = image(:, :, 2);
	b = image(:, :, 3);
  % initialiare liste de culori
  r_count = zeros(1, count_bins);
  g_count = zeros(1, count_bins);
  b_count = zeros(1, count_bins);
	l = 256 / count_bins; % lungime interval
  % parcurgem intervalele
for i = 0 : (count_bins - 1)
  r_count(i + 1) = sum(sum((r >= (i * l) & r < ((i + 1) * l))));
	g_count(i + 1) = sum(sum((g >= (i * l) & g < ((i + 1) * l))));
	b_count(i + 1) = sum(sum((b >= (i * l) & b < ((i + 1) * l))));
 endfor
sol = [r_count g_count b_count];
endfunction
  
