clear all
close all
clc

a = [1,1];
b = [1,-1];
c = [2,-5];
aT = a'; % Transposta

norm_a = norm(a);
norm_b = norm(b);
norm_c = norm(c);

norma_a_2 = sqrt(a * a')
norma_a_2 = sqrt(sum(a.*a)) % O .* faz a multiplicação elemento a elemento