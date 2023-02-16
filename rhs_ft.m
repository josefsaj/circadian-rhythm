function dydt = rhs_ft(t,y)

dydt = zeros(9,1);

% With L(t)
% Stable equilibrium solution
% alpha1 = 0.62;
% A = 0.0000005;
% Kd = 1e-7;
% beta1 = 0.62;
% alpha2 = 0.62;
% beta2 = 0.62;   %% 3D plot variables( plot 3), m effect PC , 3 columns 
% alpha3 = 0.62;
% beta3 = 0.62;
% alpha4 = 0.62;
% beta4 = 0.62;
% alpha5 = 0.62;
% beta5 = 0.62;
% alpha6 = 0.62;
% beta6 = 0.62;

% Stable limit cycle
% alpha1 = 0.62;
% A = y(9);
% Kd = y(7);
% beta1 = 0.62;
% alpha2 = 0.62;
% beta2 = 0.62;   %% 3D plot variables( plot 3), m effect PC , 3 columns 
% alpha3 = 0.62;
% beta3 = 0.62;
% alpha4 = 0.62;
% beta4 = 0.62;
% alpha5 = 0.62;
% beta5 = 0.62;
% alpha6 = 0.62;
% beta6 = 0.62;

% Aperiodic Oscillations
% Tis impossible

% parameters
alpha1 = 0.62;
A = 0.0000005;
Kd = 1e-7;
beta1 = 0.62;
alpha2 = 0.62;
beta2 = 0.62;   %% 3D plot variables( plot 3), m effect PC , 3 columns 
alpha3 = 0.62;
beta3 = 0.62;
alpha4 = 0.62;
beta4 = 0.62;
alpha5 = 0.62;
beta5 = 0.62;
alpha6 = 0.62;
beta6 = 0.62;


% odesh
dydt(1) = alpha1*ft(t,y(9))*f(y(6),A,Kd) - beta1*y(1);
dydt(2) = alpha2*y(1) - beta2*y(2);
dydt(3) = alpha3*y(2) - beta3*y(3);
dydt(4) = alpha4*y(3) - beta4*y(4);
dydt(5) = alpha5*y(4) - beta5*y(5);
dydt(6) = alpha6*y(5) - beta6*y(6);

end