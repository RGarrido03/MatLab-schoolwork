%% Código retirado do e-learning
% Ver o código da aula prática mais abaixo. Eu nem sei porque é que a professora nos mandou copiar este código ‍️������������‍♂️
clear all
close all
clc

f=figure(1);
%get(f)
set(f,'Position', [550 159 560 420]);
%x=0.5*rand(1,N);
%y=0.5*rand(1,N)+0.5;
aa=imread('Maxwells-demon.bmp');
% [ax,ay]=size(aa);
% bb=aa(1:20:ax,1:20:ay);
% aa=bb;
[ax,ay]=size(aa);

ax=ax+10; ay=ay+10;
[j,i]=find(aa(:,:)==0);
N=length(i);
%x=0.5*i'/ay; y=1-0.5*j'/ax;
x=i'/ay; y=1-j'/ax;


iverm=find(y>0.5);
iazul=find(y<=0.5);
r=[x;y];
M=[2 0; 0 1/2];
T=repmat([-1;1/2],1,N);
niter=20;
fprintf(1,'Transformação do padeiro\n')
for n=1:niter
          
      plot(r(1,iverm),r(2,iverm),'r.')
      axis equal
      axis([0,1,0,1])  
     hold on
     plot(r(1,iazul),r(2,iazul),'b.')
   
    drawnow
    hold off
    i1=find(r(1,:)>=0.5);
    r=M*r;
    r(:,i1)=r(:,i1)+T(:,i1);
    pause(1)
end
% Transformação inversa
Minv=inv(M);
Tinv=zeros(1,N); Tinv(1,:)=T(2,:); Tinv(2,:)=T(1,:);
fprintf(1,'Transformacao Inversa\n')
for n=1:niter+1
         plot(r(1,iverm),r(2,iverm),'r.') 
         axis equal
         axis([0,1,0,1])
       
    hold on
  
    plot(r(1,iazul),r(2,iazul),'b.')
 
    
    drawnow
    hold off
    i1=find(r(2,:)>=0.5);
    r=Minv*r;
    r(:,i1)=r(:,i1)+Tinv(:,i1);
    pause(1)
end


%% Código da aula prática
clear all
close all
clc

N = 1000;
r = rand(2,N);
iverm = find(r(2,:)>=0.5); % Encontra os índices que são >= 0.5
iazul = find(r(2,:)<0.5); % Encontra os índices que são < 0.5

M = [2 0;0 0.5]; T = [-1;0.5];

niter = 20;
for i=1:niter
    plot(r(1,iverm), r(2,iverm), 'r.')
    hold on
    plot(r(1,iazul), r(2,iazul), 'b.')
    drawnow
    hold off
    ii = find(r(1,:)>=0.5);
    r = M * r;
    r(:,ii) = r(:,ii) + T;
    pause(0.1)
end

% b)
M_inv = inv([2,0;0 0.5]);
T_inv = [0.5;-1];
for i=1:niter+1
    plot(r(1,iverm), r(2,iverm), 'r.')
    hold on
    plot(r(1,iazul), r(2,iazul), 'b.')
    drawnow
    hold off
    ii = find(r(2,:)>=0.5);
    r = M_inv * r;
    r(:,ii) = r(:,ii) + T_inv;
    pause(0.1)
end

for i=1:niter+1
    plot(r(1,iverm), r(2,iverm), 'r.')
    hold on
    plot(r(1,iazul), r(2,iazul), 'b.')
    drawnow
    hold off
    ii = find(r(2,:)>=0.5);
    r = M_inv * r;
    r(:,ii) = r(:,ii) + T_inv;
    pause(0.1)
end

% c)
r = rand(2,1);
niter = 100;
rt = zeros(2,niter+1);
rt(:,1) = r;

figure(3)
for i=1:niter
    plot(rt(1,1:i), rt(2,1:i), 'r.',r(1,:),r(2,:),"bx")
    drawnow
    ii = find(r(1,:)>=0.5);
    r = M * r;
    r(:,ii) = r(:,ii) + T;
    rt(:,i+1) = r;
    pause(0.1)
end