% solve odes
A=0.0659;
Kd=10^(-6);
y0 = [0,0,0,A,Kd]; % initial conditions
[T,Y] = ode45(@rhs_scale,[0,30],y0);

figure;
mrna = Y(:,1);
cprotein = Y(:,2);
nucleus = Y(:,3);
plot(T,mrna,T,cprotein,T,nucleus); %repressor as time
legend("mran","cytoplasmic protein","nucleus");