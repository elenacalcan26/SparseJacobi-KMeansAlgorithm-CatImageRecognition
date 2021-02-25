function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  %cream calea catre cele 2 directoare
  path_cats = strcat(path_to_dataset, "cats/");
  path_not_cats = strcat(path_to_dataset, "not_cats/");
  % extragem imaginile din directoare
  cats_images = getImgNames(path_cats);
  not_cats_images = getImgNames(path_not_cats);
  n = length(cats_images(:, 1)) + length(not_cats_images(:, 1));
  m = count_bins * 3;
  X = zeros(n, m);
  y = zeros(n, 1);
  n_cats = length(cats_images(:, 1));
  n_not_cats = length(not_cats_images(:, 1));
  %verificam daca tipul histogramei este RGB
  if strcmp(histogram, "RGB") == 1
    % parcurgem pozele cu pisici
    for i = 1:n_cats
      %cream calea spre imagine
      img = cats_images(i, :);
      path_to_image = strcat(path_cats, img);
      %adaugam rezultatul functiei in matricea X
      X(i, :) = rgbHistogram(path_to_image, count_bins);
      %adugam eticheta corespunzatoare imaginii
      y(i, 1) = 1;
    endfor
    %parcurgem pozele fara pisici
    for i = 1:n_not_cats
      % creare cale catre imagine
      img = not_cats_images(i, :);
      path_to_image = strcat(path_not_cats, img);
      %adugam rezultatul functiei in matricea X
      X(i + n_cats, :) = rgbHistogram(path_to_image, count_bins);
      %adaugam eticheta corespunzatoare imaginii
      y(i + n_cats, 1) = -1;
    endfor
  endif
  %verificam daca histograma e de tip HSV
  if strcmp(histogram, "HSV") == 1
    for i = 1:n_cats
      img = cats_images(i, :);
      path_to_image = strcat(path_cats, img);
      X(i, :) = hsvHistogram(path_to_image, count_bins);
      y(i, 1) = 1;
    endfor
    for i =1:n_not_cats
      img = not_cats_images(i, :);
      path_to_image = strcat(path_not_cats, img);
      X(i + n_cats, :) = hsvHistogram(path_to_image, count_bins);
      y(i + n_cats, 1) = -1;
    endfor
  endif
endfunction
