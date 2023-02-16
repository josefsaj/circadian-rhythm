function out = f_scale(P,A,Kd)

out = 1/2*(1-P/A-Kd/A+sqrt((1-P/A-Kd/A)^2+4*Kd/A));

end