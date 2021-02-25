function [cost] = compute_cost_pc(points, centroids)
  cost = 0;
  [n_centroids, c] = size(centroids);
  [n_points, c] = size(points);
  for i = 1:n_points
    dist_min = realmax;
    for j = 1:n_centroids
      %calculez distanta
      dist = norm(points(i, :) - centroids(j, :), 2);
      %compar distantele si aflu care e mai mica
      if dist < dist_min
        dist_min = dist;
       endif
      endfor
      %calculez costul
      cost = cost + dist_min;
    endfor
endfunction

