% +a is translation for time (shifting the time to the right), (t-a) means shifts time to the left, everthing happens sooner, which is called a phased event
function out = sq(t,a)
x = 0.5;
if mod(t-a, 14) < 12
    out = 1 + x;
else
    out = 1 - x;
end
