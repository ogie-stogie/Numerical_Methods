%Jacobi Iterative Method
function [xM,errorFinal] = GaussSeidelMethod(A,b,x0,M)
%initialize variables
j=1;
k=1;
x=zeros(size(b));
%Methods
while k<=M
    x(1)= (1/A(1,1))*(-sum(A(1,2:size(A))*x(2:size(A)))+b(1));
    for i=2:size(A)
        x(i)= (1/A(i,i))*(-sum(A(i,1:i-1)*x(1:i-1))-sum(A(i,i+1:size(A))*x(i+1:size(A)))+b(i));
    end
    x0=x;
    error(k)=norm(A*x0-b,Inf);
    k=k+1;
end

%Results
p=polyfit(1:M,log(error),1);
k=exp(p(1));
C=exp(p(2));
semilogy(error);
title("Gauss Seidel Method Error by Iteration");
xlabel("Number of Iterations");
ylabel("Error");
xM=x0;
errorFinal=error(M);
fprintf("error(n) is approximately %.4f*%.4f^n\n",C,k);