function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  % aplicare metoda Jacobi in aflarea lui x
  prev_x = zeros(size(c)); % este x0
  while 1
   %calculam x de la pasul curent
   x = csr_multiplication(G_values, G_colind, G_rowptr, prev_x);
    x = x + c;
    %verificam daca eroarea e mai mica decat toleranta
    if norm(x - prev_x) < tol
      return;
    endif
    %vechiul x devine x
    prev_x = x;
   endwhile
endfunction