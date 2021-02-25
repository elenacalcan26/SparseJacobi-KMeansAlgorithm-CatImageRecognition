function [w] = learn(X, y)
   %il cream pe x tilda
   X = [X, ones(size(X)(1), 1)];
   %il factoriam pe X
   [Q R] = Householder(X);
   %calculam valoare lui w
   w = SST(R, Q' * y);
end
