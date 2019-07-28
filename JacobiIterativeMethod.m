%Jacobi Iterative Method
function [xM,errorFinal] = JacobiIterativeMethod(A,b,x0,M)
%initialize variables
j=1;
k=1;
x=zeros(size(b));
%Methods
while k<=M
    for i=1:size(A)
        x(i) = (1/A(i,i))*(sum(-A(i,1:size(A))*x0(1:size(A)))+A(i,i)*x0(i)+b(i));
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
title("Jacobi Iteration Method Error by Iteration");
xlabel("Number of Iterations");
ylabel("Error");
xM=x0;
errorFinal=error(M);
fprintf("error(n) is approximately %.4f*%.4f^n\n",C,k);