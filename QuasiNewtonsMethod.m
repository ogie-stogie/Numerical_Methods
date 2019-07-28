%Quasi Newton's Method (Broyden) to Solve #3
%eq1 must be in the format//
% @(x) eq1  i.e. @(x) 2*x^2+1
function answer = QuasiNewtonsMethod(eq1,eq2,xo,yo,imax,precision)
%variables
syms x y;
%use the following to substitute in values//
%subs(diff_eq1,x,5);
A=zeros(2,2);
A(0,0)=diff(eq1,x)
A(0,1)=diff(eq1,y);
A(1,0)=diff(eq2,x);
A(1,1)=diff(eq2,y);
subs(A,[x y],[xo yo])