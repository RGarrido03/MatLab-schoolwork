function [distancia] = dist2(x1_0,v1_0,t,t0,A,w,phi,L,Lm,d0)
x1 = x1_0 + v1_0*(t-t0);
x2 = A*cos(w*(t-t0)+phi)+L-Lm;
rb = d0/2;
distancia_x1 = x1+rb;
distancia_x2 = x2+rb;
distancia = distancia_x2 - distancia_x1;
end