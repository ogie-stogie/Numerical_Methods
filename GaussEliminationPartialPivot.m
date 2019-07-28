%Gauss Elimination (Pivoting)
function answer = GaussEliminationPartialPivot(A,b)
%initialize variables
j=1;

%Methods
while j<=length(A)
    i=j;
    while i<length(A)
        b(i+1) = b(i+1) - (A(i+1,j)*b(1))/A(j,j);
        A(i+1,j:length(A)) = A(i+1,j:length(A)) - (A(i+1,j)*A(j,j:length(A)))/A(j,j);
        i=i+1;
    end
    j=j+1;
    n=j;
    while n<length(A)
        if abs(A(n,n)) < abs(A(n,n+1))
            swapA=A(n,:);
            A(n,:)=A(n+1,:);
            A(n+1,:)=swapA;
            swapb=b(n,:);
            b(n,:)=b(n+1,:);
            b(n+1,:)=swapb;
        end
        n=n+1;
    end
end
%Results
A
b
answer=A^-1*b;
