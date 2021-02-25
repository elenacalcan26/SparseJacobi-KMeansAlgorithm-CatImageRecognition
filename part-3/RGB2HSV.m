function [H S V] = RGB2HSV(R, G, B)
R1 = double(R)/255;
G1 = double(G)/255;
B1 = double(B)/255;
c_max = max(max(R1, G1), B1);
c_min = min(min(R1, G1), B1);
delta = c_max - c_min;
H = zeros(size(R));
S = zeros(size(R));
H((c_max==R1 & delta != 0))=60*(mod( (G1((c_max==R1 & delta != 0))-B1((c_max==R1 & delta != 0)))./delta((c_max==R1 & delta != 0)),6));
H(c_max==G1 & delta != 0)=60*((B1(c_max==G1 & delta != 0)-R1(c_max==G1 & delta != 0))./delta(c_max==G1 & delta != 0)+2);
H(c_max==B1 & delta != 0)=60*((R1(c_max==B1 & delta != 0)-G1(c_max==B1 & delta != 0))./delta(c_max==B1 & delta != 0)+4);
H = H / 360;
S(c_max!=0)=delta(c_max!=0)./c_max(c_max!=0);
V = c_max;
endfunction
