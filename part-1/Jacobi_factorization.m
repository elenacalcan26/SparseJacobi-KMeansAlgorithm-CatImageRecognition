function [G_J, c_J] = Jacobi_factorization(A, b)
  %extragem diagonala
  N = diag(diag(A));
  P = N - A;
  %aflam Gj si cj cu ajutorul urmatoarelor relatii
  G_J = inv(N) * P;
  c_J = inv(N) * b;
endfunction
