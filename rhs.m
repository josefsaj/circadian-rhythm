function dydt = rhs(t,y,alpha1)

dydt = zeros(8,1);

% Without L(t)

% Stable equilibrium solution
% alpha1 = 0.1;
% A = 0.0659;
% Kd = 1e-5;
% beta1 = 0.4631;
% alpha2 = 0.4631;
% beta2 = 0.4631;
% alpha3 = 0.4631;
% beta3 = 0.4631;
% alpha4 = 0.4631;
% beta4 = 0.4631;
% alpha5 = 0.4631;
% beta5 = 0.4631;
% alpha6 = 0.4631;
% beta6 = 1;

% Stable limit cycle
% alpha1 = 1;
% A = 0.0659;
% Kd = 1e-5;
% beta1 = 0.4631;
% alpha2 = 0.4631;
% beta2 = 0.4631;   %% 3D plot variables( plot 3), m effect PC , 3 columns 
% alpha3 = 0.4631;
% beta3 = 0.4631;
% alpha4 = 0.4631;
% beta4 = 0.4631;
% alpha5 = 0.4631;
% beta5 = 0.4631;
% alpha6 = 0.4631;
% beta6 = 1;

% Aperiodic Oscillations
% Bruh

% parameters

A = 0.0659;
Kd = 1e-5;
beta1 = 0.4631;
alpha2 = 0.4631;
beta2 = 0.4631;
alpha3 = 0.4631;
beta3 = 0.4631;
alpha4 = 0.4631;
beta4 = 0.4631;
alpha5 = 0.4631;
beta5 = 0.4631;
alpha6 = 0.4631;
beta6 = 1;


% odesh
dydt(1) = alpha1*f(y(6),A,Kd) - beta1*y(1);
dydt(2) = alpha2*y(1) - beta2*y(2);
dydt(3) = alpha3*y(2) - beta3*y(3);
dydt(4) = alpha4*y(3) - beta4*y(4);
dydt(5) = alpha5*y(4) - beta5*y(5);
dydt(6) = alpha6*y(5) - beta6*y(6);

end