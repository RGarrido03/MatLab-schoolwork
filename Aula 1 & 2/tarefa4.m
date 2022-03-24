clear all
close all
clc

x=0:0.1:24; % 0.0, 0.1, 0.2, etc., até 24
A=2; lambda=4; v=1;
dt=0.1; tmax=10;


%% Maneira 1
for t=0:dt: tmax
 y1=A*sin(2*pi*(x-v*t)/lambda);
 y2=A*sin(2*pi*(x+v*t)/lambda);
 plot(x,y1,"b",x,y2,'m','linewidth',3)
 axis([0,24,-4,4])
 xlabel('x'); ylabel('y')
 drawnow
 pause(0.2)
end


%% Maneira 2
for t=0:dt: tmax
 y1=A*sin(2*pi*(x-v*t)/lambda);
 y2=A*sin(2*pi*(x+v*t)/lambda);
 plot(x,y1,"b",'linewidth',3)
 hold on
 plot(x,y2,'m','LineWidth',3)
 axis([0,24,-4,4])
 xlabel('x'); ylabel('y')
 drawnow
 pause(0.2)
 hold off
end


%% Alínea ii) - Sobreposição das ondas
for t=0:dt: tmax
 y1=A*sin(2*pi*(x-v*t)/lambda);
 y2=A*sin(2*pi*(x+v*t)/lambda);
 y3 = y1 + y2;
 plot(x,y3,"b",'linewidth',3)
 axis([0,24,-4,4])
 xlabel('x'); ylabel('y')
 drawnow
 pause(0.2)
end