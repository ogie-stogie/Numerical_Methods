%Solves for value of y(xq) through linear interpolation of two data points
function answer = LinearInterpolation(x1,y1,x2,y2,xq)
m = (y2-y1)/(x2-x1);
syms b;
b=solve(y1==m*x1+b,b);
answer=vpa(m*xq+b);