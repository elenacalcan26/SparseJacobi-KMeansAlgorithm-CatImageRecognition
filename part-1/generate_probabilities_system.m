function [A, b] = generate_probabilities_system(rows)
 M = zeros(rows);
  %construiesc diagrama
  % cu i parcurg coloanele si cu j liniile la construirea labirintului
  M(1,1) = 1;
  for j = 2:rows
    M(j, 1) = M(j-1, 1) + j - 1;
  endfor
  for i = 2:rows
    M(i, i) = M(i-1, i-1) + i;
    for j = i+1:rows
      M(j, i) = M(j-1, i) + j - 1;
    endfor
  endfor
  n = M(rows, rows); 
  A = zeros(n);
  b = zeros(n, 1);
  % parcurg labirintul
  for l = 1:rows
    for c = 1:l
      p = 0; % numar probabilitatile
      %conditii parcurgere labirint
      if l == c
        if l + 1 <= rows
          p++;
          A(M(l + 1, c), M(l, c)) = -1;
         else 
          p++;
         endif
       if c + 1 <= rows || c + 1 > rows
         p++;
       endif
      if c - 1 == 0
        p++;
      else
        p++;
        A(M(l, c-1), M(l, c)) = -1;
      endif
      if l + 1 <= rows && c + 1 <= rows
        p++;
        A(M(l+1, c+1), M(l, c)) = -1;
      endif
      if l - 1 > 0 && c - 1 > 0
        p++;
        A(M(l-1, c-1), M(l, c)) = -1;
      endif
    else if l != c
      if l - 1 > 0
        p++;
        A(M(l - 1, c), M(l, c)) = -1;
      endif
      if l + 1 <= rows
        p++;
        A(M(l + 1, c), M(l, c)) = -1;
      else 
        p++;
       endif
       if c + 1 <= rows
          p++;
          A(M(l, c+1), M(l, c)) = -1;
        else
          p++;
       endif
       if c - 1 > 0
         p++;
         A(M(l, c-1), M(l, c)) = -1;
       else 
         p++;
       endif
       if l + 1 <= rows && c + 1 <= rows
         p++;
         A(M(l+1, c+1), M(l, c)) = -1;
       endif
       if l - 1 > 0 && c - 1 > 0
         p++;
         A(M(l-1, c-1), M(l, c)) = -1;
       endif
      endif
      endif
      %construiec vectorul b
      if l == rows       
       b(M(l, c), 1) = 1;
      endif
      A(M(l, c), M(l, c)) = p;
   endfor
  endfor
endfunction