function [centroids] = clustering_pc(points, NC)
 N = length(points(:, 1)); % extragem nr de puncte
 % construim matricea de clustere
 cluster = reshape(1:N, NC, N/NC);
 % construim matricea de centroizi
 centroids = zeros(NC, length(points(1, :)));
 for i = 1:NC
   for j = 1:length(cluster(1, :))
     for k = 1:length(points(1, :))
      centroids(i, k) = centroids(i, k) + points(cluster(i, j), k);
     endfor
   endfor
 endfor
  % facem media aritmetica
  centroids = centroids / length(cluster(1, :));
   %presupun un numar maxim de iteratii
  iter = 200;
  %repet algoritmul pentru un numar maxim de iteratii
  for i = 1:iter
    cluster_totals = zeros(NC, length(points(1, :)));
    cluster_size = zeros(NC, 1);
    % pentru fiecare punct caut cel mai apropiat centroid
    for j = 1:length(points(:, 1))
      min_dist = realmax;
      point_to = 0; %indica pozitia centroidului corespunzator
      for k = 1:NC
        % este folosita distanta euclidiana
        dist = sqrt(sum((points(j, :) - centroids(k, :)) .^2));
        if dist < min_dist
          min_dist = dist;
          point_to = k;
        endif
      endfor
      assig(j) = point_to;
      cluster_totals(point_to, :) = cluster_totals(point_to, :) + points(j, :);
      cluster_size(point_to)++;
    endfor
    new_centroids = zeros(NC, length(points(1, :)));
    for j = 1:NC
      new_centroids(j, :) = cluster_totals(j, :) / cluster_size(j);
    endfor
    diff = sum(sum(abs(new_centroids - centroids)));
    %am facut convergenta inainte sa atingem numarul de iteratii
    if diff < eps
      break;
    endif
    centroids = new_centroids;
  endfor
endfunction