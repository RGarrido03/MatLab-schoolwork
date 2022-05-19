function [v1col,x1col,tcol,col,A,phi] = colisao(t0,v1_0,x1_0,A,phi,w,L,Lm,d0)
t1 = 0;
t2 = 0;
tcol = 0;
x1col = 0;
v1col = 0;
x2col = 0;
v2col = 0;

%% Método grosseiro
for t = 0.01:0.01:200
    distancia = dist2(x1_0,v1_0,t,t0,A,w,phi,L,Lm,d0);
    if distancia > 0
        t1 = t;
    else
        t2 = t;
        break
    end
end

if t2 == 0
    col = false;
    return
else
    col = true;
end

%% Método da bisseção
while (t2-t1)<0.000001
    t = 0.5*(t1+t2);
    distancia = dist2(x1_0,v1_0,t,t0,A,w,phi,L,Lm,d0);

    if distancia < 0
        t2 = t;
    else
        t1 = t;
    end
end
tcol = t;

%% Determinar a posição
x1col = x1_0 + v1_0*(tcol-t0);
x2col = x1col + d0;
v1col = -w*A*sin(w*(tcol-t0)+phi);
v2col = v1col;

A = sqrt((v2col^2/w^2)+(x2col-L+Lm)^2);
phi = acos((x2col-L+Lm)/A);

if v2col > 0
    phi = 2*pi - phi;
end
end