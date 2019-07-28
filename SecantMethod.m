%Secant Method
%eq1 must be in the format//
% @(x) eq1  i.e. @(x) 2*x^2+1
function answer = SecantMethod(eq1,xo,x1,imax,precision,xref)
%variables
syms x;
%use the following to substitute in values//
%subs(diff_eq1,x,5);
i=0;
j=1;
error = 10000000;

%Methods
while(error>precision && i<imax)
    xf = x1 - eq1(x1)*(x1-xo)/(eq1(x1)-eq1(xo));
    e(i+1) = abs(xf-xref);
    error=e(i+1);
    xo=x1;
    x1=xf;
    i=i+1;
end

while (j<i-1)
    en(j)=log(e(j));
    en1(j)=log(e(j+1));
    j=j+1;
end

%Results
p=polyfit(en,en1,1);
fprintf('e(n+1) = %2.5f*e(n)^%2.5f\nConverged in %d iterations',exp(p(2)),p(1),i) 
answer = vpa(xf);
semilogy(e);
title("Secant Method Error by Iteration");
xlabel("Number of Iterations");
ylabel("Error");
