% Oscillatory Enzyme Reactions
% simple numerical continuation of equilibria
clear; 
close all;  % clear all variables and close all figures


% continuation in p
n=8;
m = 20; % number of iterations through p
alpha1_start = 0; 
alpha1_end = 1;
alpha1_vec = linspace(alpha1_start,alpha1_end,m); % Creates a vector of m equally spaced values of alpha1 between alpha1_start and alpha1_end.

x_vec = zeros(n,m);               % Initializes a matrix of size n x m to store the solutions at each value of alpha1.
lambda = zeros(n,m);              % Initializes a matrix of size n x m to store the eigenvalues of the Jacobian at each value of alpha1.
peak=zeros(m);                    %  Initializes an array of size m to store the peak values.
mins=zeros(m);                    % Initializes an array of size m to store the minimum values.

% initial guess
x0 = ones(n,1);

% loop through values of p
for i=1:m
    alpha1 = alpha1_vec(i);
    [x,fval,exitflag,output,jacobian] = fsolve(@(y) rhs(0,y,alpha1), x0);
    x_vec(:,i) = x; % save equilibrium solution
    x0 = x; % set new x0 for next iteration
    lambda(:,i) = eig(jacobian); % Stores the eigenvalues of the Jacobian in the i-th column of lambda.
end

% find index of alpha_1
index = find(abs(alpha1_vec-0.1579) < 0.001);

% plot results
figure;
subplot(2,1,1);
plot(alpha1_vec(1:4),x_vec(1,1:4),'-bo','LineWidth',2);    %  Plots the first 4 values of alpha1 against the first component of the solution vector x
hold on;
plot(alpha1_vec(5:20),x_vec(1,5:20), ':bo', 'LineWidth', 2); %  Plots the remaining values of alpha1 against the first component of the solution vector x
xlabel('$p$','FontSize',18,'Interpreter','latex');
ylabel('$y_1$','FontSize',18,'Interpreter','latex');
ax = gca;
ax.FontSize = 18;
hold on;

subplot(2,1,2);
plot(alpha1_vec,max(real(lambda)),'-o','LineWidth',2);
xlabel('$alpha_1$','FontSize',18,'Interpreter','latex');
ylabel('$\max(Re(\lambda))$','FontSize',18,'Interpreter','latex');
ax = gca; ax.FontSize = 18;
hold on;
