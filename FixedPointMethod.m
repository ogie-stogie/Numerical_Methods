%Fixed Point Method
%eq1 must be in the format//
% @(x) eq1  i.e. @(x) 2*x^2+1
function answer = FixedPointMethod(eq1,xo,imax,precision)
%variables
syms x;
%use the following to substitute in values//
%subs(diff_eq1,x,5);
i=0;
error = 10000000;

%Method
while (error>precision && i<imax)
    xf = eq1(xo);
    error=abs(xf-xo);
    xo=xf;
    i=i+1;
end
if (i==imax)
    disp("Did not converge!")
end
answer=xo;