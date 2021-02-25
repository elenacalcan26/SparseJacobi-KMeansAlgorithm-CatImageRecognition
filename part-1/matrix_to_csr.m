function [values, colind, rowptr] = matrix_to_csr(A)
  %retin numarul de linii din matrice
  n = size(A);
  values = [];
  colind = [];
  rowptr = [];
  %parcurg matricea A
  for i = 1:n
    for j = 1:n
      %construiesc cei 3 vectori
      if A(i, j) != 0
        values = [values, A(i, j)];
        colind = [colind, j];
        %verifica daca e primul elemnt din matrice
        if length(rowptr) < i
          rowptr = [rowptr, length(values)];
        endif
      endif
    endfor
  endfor
  %retin numarul de numere nenule, ea fiind egala cu lungimea vectorului values
  nz = length(values);
  rowptr = [rowptr, nz + 1];
endfunction