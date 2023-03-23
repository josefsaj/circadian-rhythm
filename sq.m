% +a is translation for time (shifting the time to the right)
function out = sq(t,a)
x = 0.5;
if mod(t-a, 24) < 12
    out = 1 + x;
else
    out = 1 - x;
end