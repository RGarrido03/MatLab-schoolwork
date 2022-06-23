function animacao(L,dt,t0,tcol,x1_0,v1_0,w,phi_0,Lm,A_0)
for t = 0:dt:tcol
    x1 = x1_0 + v1_0*(t-t0);
    if x1 < 0
        return
    end
    x2 = A_0*cos(w*(t-t0)+phi_0)+L-Lm;
    plot(x1,0,'r.','MarkerSize',40)
    hold on
    quiver(x1,0,v1_0,0,0)
    axis([0,L+0.5,-0.5,0.5])

    plot(x2,0,'b.','MarkerSize',40)
    hold on
    plot([x2,L],[0,0],'b-','LineWidth',3)
    plot([0,L],[-0.025,-0.025],'k-',[L,L],[-0.025,0.1],'k-',[L,L+0.5],[0.1,0.1],'k-')
end
end