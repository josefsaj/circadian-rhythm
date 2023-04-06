close all;
clear;
set(groot, 'defaultAxesLineWidth', 2.5)
set(groot, 'defaultAxesFontSize', 20)
set(groot, 'defaultTextFontSize', 20)
set(groot, 'defaultLineLineWidth', 2.5)
% solve odes without any light function 

y0 = zeros(8,1); % initial conditions
y0(7)=10^(-5); % easy to change variables in this way,"Kd"
y0(8)=0.0659; % "A"

[T,Y] = ode45(@(t,y) rhs(t,y,0.25),[0,72],y0);

figure('Name','Solutions to System of ODEs w/o Light Function');
y1 = Y(:,1);
y2 = Y(:,2);
y3 = Y(:,3);
y4 = Y(:,4);
y5 = Y(:,5);
y6 = Y(:,6);
plot(T,y1,T,y2,T,y3,T,y4,T,y5,T,y6); %repressor as time
legend("y_1","y_2","y_3","y_4","y_5","repressors");
xlabel('hours') 
ylabel('concentration') 


% solve odes with different values of activator A
y0 = zeros(8,1); % initial conditions
y0(8)=0.0659;
Alist=[10^(-5),10^(-4),10^(-3),10^(-2),10^(-1)];
figure('Name',['Solutions to y_1 with Different Values of ' ...
    'Activator A']);
for A = Alist
    y0(7)=A;
    [T,Y] = ode45(@(t,y) rhs(t,y,0.5),[0,72],y0);
    y1 = Y(:,1);
    plot(T,y1);
    hold on;
end
xlabel('hours') 
ylabel('concentration of y_1 (A)') 
legend("10^{-5}","10^{-4}","10^{-3}","10^{-2}","10^{-1}");

% solve odes with sinosudal light function
y0 = zeros(9,1); % initial conditions
y0(7)=10^(-5); % easy to change variables in this way,"Kd"
y0(8)=0.0659; % "A"
y0(9)=10; % the translation of the ft function

[T,Y] = ode45(@rhs_ft,[0,72],y0);

% graph of the solution y1 using the sinosudal light function
figure('Name','Solution of y_1 ODE with Sinosudal Light Function');
y1 = Y(:,1);
plot(T,y1); 
hold on;
light=ft(T,y0(9));
plot(T,light);
legend("y_1","light");
xlabel('hours');


% change the translation of the light function
y0(9)=30; % the translation of the ft function
[T,Y] = ode45(@rhs_ft,[0,72],y0);
figure('Name',['Solution of y_1 ODE with Right Shifted ' ...
    'Sinosudal Light Function']);
y1 = Y(:,1);
plot(T,y1); 
hold on;
light=ft(T,y0(9));
plot(T,light);
legend("y_1","light");
xlabel('hours');

% graph of the limit cycle
figure('Name','Solution of ODE Converging to Limit Cycle');
plot3(Y(:,1), Y(:,2), Y(:,3));

%{
y0 = ones(8,1); % initial conditions
[T,Y] = ode45(@(t,y) rhs(t,y,0.5),[0,70],y0);


figure(6);
plot(T,Y(:,1))
%}

% solve odes with square light function
y0 = zeros(9,1); % initial conditions
y0(7)=10^(-5); % easy to change variables in this way,"Kd"
y0(8)=0.0659; % "A"
y0(9)=0; % the translation of the ft function

options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);
[T,Y] = ode45(@rhs_sq,[0,20000],y0,options);
y0=Y(end,:);
[T,Y] = ode45(@rhs_sq,[0,2000],y0,options);

% graph of the solution y1 using the square light function
figure('Name','Solution of ODE with Square Light Function');
y1 = Y(1:1000,1);
T=T(1:1000);
plot(T,y1); 
hold on;
light = T;
for i = 1:length(T)
    light(i)=sq(T(i),y0(9));
end
plot(T,light);
legend("y_1","light");
xlabel('hours');
ylabel('value of y_1 and light');
figure(7);
plot3(Y(:,1), Y(:,2), Y(:,3));
