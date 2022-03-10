clear all
close all
clc


%% Para duas dimensões:
a = [1,1];
b = [1,-1];
c = [2,-5];

% Para os três vetores:
xinicial = [0;0;0];
yinicial = [0;0;0];
quiver(xinicial, yinicial, [a(1);b(1);c(1)], [a(2);b(2);c(2)], 0, "r")

axis equal % Colocar os eixos iguais
xlim([0 1])
ylim([-1 1])

produto_interno_ab = a * b';


%% Para três dimensões - ii)
a3 = [a,0];
b3 = [b,0];
c3 = [c,0];
xinicial = [0;0;0;0];
yinicial = [0;0;0;0];
zinicial = [0;0;0;0];
prod_ext = cross(a3,b3);

quiver3(xinicial, yinicial, zinicial, [a3(1);b3(1);c3(1);prod_ext(1)], [a3(2);b3(2);c3(2);prod_ext(2)], [a3(3);b3(3);c3(3);prod_ext(3)], 0, "r")
norma_prod_ext = norm(prod_ext);
