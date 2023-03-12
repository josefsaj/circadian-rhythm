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

% plot results
figure;
subplot(2,1,1);
plot(alpha1_vec,x_vec(1,:),'-x','LineWidth',2);
xlabel('$p$','FontSize',18,'Interpreter','latex');
ylabel('$y_1$','FontSize',18,'Interpreter','latex');
ax = gca; ax.FontSize = 18;

subplot(2,1,2);
plot(alpha1_vec,max(real(lambda)),'-x','LineWidth',2);
xlabel('$p$','FontSize',18,'Interpreter','latex');
ylabel('$\max(Re(\lambda))$','FontSize',18,'Interpreter','latex');
ax = gca; ax.FontSize = 18;

