% Define the range of r values
m = 20; % number of iterations through p
alpha1_start = 0; alpha1_end = 1;
r = linspace(alpha1_start,alpha1_end,m);

% Define the initial condition
y0 = zeros(8,1); % initial conditions
y0(7)=10^(-5); %easy to change variables in this way,"Kd"
y0(8)=0.0659; %"A"

% Define the time span and options for ode45
tspan = [0, 1000];

% Initialize arrays to store the last local max/min
xmax = zeros(length(r), 1);
xmin = zeros(length(r), 1);

% Loop through each value of r and solve the differential equation
for i = 1:length(r)
    [t, Y] = ode45(@(t, y) rhs(t, y,r(i)), tspan, y0);
    [pks, locs] = findpeaks(Y(:,1),'MinPeakProminence',1e-1);
    if ~isempty(locs)
        xmax(i) = pks(end);
    end
    [pks, locs] = findpeaks(0-Y(:,1),'MinPeakProminence',1e-1);
    if ~isempty(locs)
        xmin(i) = 0 - pks(end);
    end
end

% Remove any zeros in the arrays
xmax(xmax == 0) = NaN;
xmin(xmin == 0) = NaN;

% Plot the bifurcation diagram
figure (1);
subplot(2,1,1);
plot(r, xmax, '-x', 'MarkerSize', 10,'LineWidth',2);
hold on;
plot(r, xmin, '-x', 'MarkerSize', 10,'LineWidth',2);
xlabel('r');
ylabel('x');
title('Bifurcation Diagram');
legend('Last Local Max', 'Last Local Min');