function [Q, R] = Householder(A)
[nl nc] = size(A);
Q = eye(nl);
%parcurgem pe coloana matricea A
for j = 1:nc
  vj = zeros(nl, 1);
  % completam de la j + 2 pana la nl cu elemnte de pe coloana j a matricei A
  vj((j + 1) : nl) = A((j + 1) : nl, j);
  %calculam sifma j
  sigma_j = sign(A(j, j)) * norm(A(j : nl, j));
  % calculam elemntul j din vj 
  vj(j) = A(j, j) + sigma_j;
  %calculam reflectorul Householder
  Hj = eye(nl) - 2 * vj * vj' / (vj' * vj);
  %eliminam elemntele de sub pivot
  A = Hj * A;
  Q = Hj * Q;
endfor
Q = Q';
R = A;
endfunction