%LU Factorization (No Permutation Matrix)
function LUFactorization(A,b)
%initialize variables
j=1;
L=eye(size(A));
%Methods
switch nargin
    case 2
        while j<=length(A)
            i=j;
            while i<length(A)
                L(i+1,j) = A(i+1,j)/A(j,j);
                b(i+1) = b(i+1) - (A(i+1,j)*b(1))/A(j,j);
                A(i+1,j:length(A)) = A(i+1,j:length(A)) - (A(i+1,j)*A(j,j:length(A)))/A(j,j);
                i=i+1;
            end
            j=j+1;
        end
        %Results
        L
        U=A
        A^-1*b;
    
    case 1
        while j<=length(A)
            i=j;
            while i<length(A)
                L(i+1,j) = A(i+1,j)/A(j,j);
                A(i+1,j:length(A)) = A(i+1,j:length(A)) - (A(i+1,j)*A(j,j:length(A)))/A(j,j);
                i=i+1;
            end
            j=j+1;
        end
        %Results
        L
        U=A
        A=L*U
    otherwise
        disp("Incorrect number of inputs")
end
