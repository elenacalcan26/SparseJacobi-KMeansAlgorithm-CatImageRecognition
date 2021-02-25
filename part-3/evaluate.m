function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  %cream calea catre directoare
  path_cats = strcat(path_to_testset, "cats/");
  path_not_cats = strcat(path_to_testset, "not_cats/");
  %extragem imaginile din cele 2 directoare
  cats_images = getImgNames(path_cats);
  not_cats_images = getImgNames(path_not_cats);
  n_cats = length(cats_images(:, 1));
  n_not_cats = length(not_cats_images(:, 1));
  correct = 0;
  % verificam daca histograma e de tip RGB
  if strcmp(histogram, "RGB") == 1
    %parcurgem directoarele cu pisici
    for i = 1:n_cats
      %cream calea catre imagine
      path_to_image = strcat(path_cats, cats_images(i, :));
      % aflam histograma
      x = rgbHistogram(path_to_image, count_bins);
      x = x';
      x = [x; 1];
      % calculam y dupa formula
      y = w' * x;
      % verificam tipul imaginii
      if y >= 0
        y = 1;
      else
        y = -1;
      endif
      if y == 1
        % daca imaginea este clasificata corect,
        % numarul imaginilor etichetate corect creste
        correct++;
      endif
    endfor
  endif
    % parcurgem pozele fara pisici
    for i = 1:n_not_cats
      %cream calea catre imagine
      path_to_image = strcat(path_not_cats, not_cats_images(i, :));
      % aflam histograma
      x = rgbHistogram(path_to_image, count_bins);
      x = x';
      x = [x; 1];
      % calculam y dupa formula
      y = w' * x;
      % aflam ce tip de poza este
      if y >= 0
        y = 1;
      else 
        y = -1;
      endif
      if y == -1
        % numarul de imagini corecte creste daca imaginea este clasificata corect
        correct++;
      endif
    endfor
    % verifica daca e de tip HSV
    if strcmp(histogram, "HSV") == 1
      for i = 1:n_cats
      path_to_image = strcat(path_cats, cats_images(i, :));
      x = hsvHistogram(path_to_image, count_bins);
      x = x';
      x = [x; 1];
      y = w' * x;
      if y >= 0
        y = 1;
      else 
        y =-1;
      endif
      if y == 1
        correct++;
      endif
    endfor
    for i = 1:n_not_cats
      path_to_image = strcat(path_not_cats, not_cats_images(i, :));
      x = hsvHistogram(path_to_image, count_bins);
      x = x';
      x = [x; 1];
      y = w' * x;
      if y >= 0 
        y = 1;
      else
        y = -1;
      endif
      if y == -1
        correct++;
      endif      
    endfor
  endif
   % calculam procentajul 
   percentage = (correct / n_cats + n_not_cats) / 100;
endfunction
