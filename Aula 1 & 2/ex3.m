clear all
close all
clc

ex = [1 0];
ey = [0 1];
b1 = [ex;ey];   % Base original

M = [1,1;1,-1];
b2 = b1 * M;    % Coordenadas da nova base

c_b1 = [2 -5];
c_b2 = c_b1 * inv(M);

c2 = c_b2 * b2;
c1 = c_b1 * b1;