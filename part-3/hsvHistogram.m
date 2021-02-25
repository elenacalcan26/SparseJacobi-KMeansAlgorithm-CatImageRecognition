function [sol] = hsvHistogram(path_to_image, count_bins)
 %citesc imaginea
 image = imread(path_to_image);
  %extrag RGB
  r = image(:, :, 1);
	g = image(:, :, 2);
	b = image(:, :, 3);
  %conversi din RGB in HSV
  [h s v] = RGB2HSV(r, g, b); 
  %initializare liste HSV
  h_count = zeros(1, count_bins);
	s_count = zeros(1, count_bins);
	v_count = zeros(1, count_bins);
  %lungime interval
  l = double(1.01 / count_bins);
  %parcurgem intervalul
 for i = 0 : (count_bins - 1)
		h_count(i + 1) = sum(sum((h >= (i * l) & h < ((i + 1) * l))));
		s_count(i + 1) = sum(sum((s >= (i * l) & s < ((i + 1) * l))));
		v_count(i + 1) = sum(sum((v >= (i * l) & v < ((i + 1) * l))));
endfor
  sol = [h_count s_count v_count];
end