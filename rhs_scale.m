function dydt = rhs_scale(t,y)

dydt = zeros(5,1); %three variables and two parameters

% parameters
A=y(4);
Kd=y(5);

% odes
dydt(1) = f_scale(y(3),A,Kd) -y(1);
dydt(2) = y(1) - y(2);
dydt(3) = y(2) - y(3);

end