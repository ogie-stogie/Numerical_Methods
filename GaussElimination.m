%Gauss Elimination (No Pivoting)
function answer = GaussElimination(A,b)
%initialize variables
j=1;

%Methods
tic;
while j<=length(A)
    i=j;
    while i<length(A)
        b(i+1) = b(i+1) - (A(i+1,j)*b(1))/A(j,j);
        A(i+1,j:length(A)) = A(i+1,j:length(A)) - (A(i+1,j)*A(j,j:length(A)))/A(j,j);
        i=i+1;
    end
    j=j+1;
end
toc;
Approximate_Operations = (2/3)*length(A)^3
%Results
answer=A^-1*b;
