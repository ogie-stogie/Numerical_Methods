function [xk,error] = conjugateGradient(A,x0,U,b)
xk=x0;
error(1)=norm(A*xk-b);
for i=2:size(A)+1
    xk=xk-((A*xk-b)'*U(:,i-1))*U(:,i-1) / ((A*U(:,i-1))'*U(:,i-1));
    error(i)=norm(A*xk-b);
end
end