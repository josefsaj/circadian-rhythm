%the function f(P,A,Kd) present in the inital 
%differential equation in the system
function out = f(P,A,Kd)

out = (A-P-Kd+sqrt((A-P-Kd)^2+4*Kd*A))/(2*A);

end