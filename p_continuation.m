% Oscillatory Enzyme Reactions
% simple numerical continuation of equilibria
clear; close all;


% continuation in p
n=8;
m = 20; % number of iterations through p
alpha1_start = 0; alpha1_end = 1;
alpha1_vec = linspace(alpha1_start,alpha1_end,m);

x_vec = zeros(n,m); % initialize matrix of solutions
lambda = zeros(n,m); % initialize matrix of eigenvalues
peak=zeros(m); % initialize array of peak
mins=zeros(m); % initialize array of mins 

% initial guess
x0 = ones(n,1);

% loop through values of p
for i=1:m
    alpha1 = alpha1_vec(i);
    [x,fval,exitflag,output,jacobian] = fsolve(@(y) rhs(0,y,alpha1), x0); 
    x_vec(:,i) = x; % save equilibrium solution 
    x0 = x; % set new x0 for next iteration 
    lambda(:,i) = eig(jacobian); % save eigenvalues of jacobian 
end

% find index of alpha_1
index = find(abs(alpha1_vec-0.1579) < 0.001);

% plot results
figure;
subplot(2,1,1);
plot(alpha1_vec(1:4),x_vec(1,1:4),'-bo','LineWidth',2);
hold on;
plot(alpha1_vec(5:20),x_vec(1,5:20), ':bo', 'LineWidth', 2);
xlabel('$alpha_1$','FontSize',18,'Interpreter','latex');
ylabel('$y_1$','FontSize',18,'Interpreter','latex');
ax = gca; ax.FontSize = 18;
legend("Stable Equilibrium","Unstable Equilibrium",'Interpreter','latex')
title('Bifurcation Diagram','Interpreter','latex');
hold on;

subplot(2,1,2);
plot(alpha1_vec,max(real(lambda)),'-o','LineWidth',2);
xlabel('$alpha_1$','FontSize',18,'Interpreter','latex');
ylabel('$\max(Re(\lambda))$','FontSize',18,'Interpreter','latex');
ax = gca; ax.FontSize = 18;
hold on;
