%Cholesky Decomposition
function CholeskyDecomposition(A)
A0=A;
L = eye(size(A));
i = 2;
j = 1;
n=1;

while j<=size(A)-1
    M = eye(size(A));
    while i<=size(A)
        M(i,j) = -A(i,j)/A(i,i);
        i=i+1;
    end
    A=M*A*M';
    Marray{n}={M};
    cell2mat(Marray{n});
    n=n+1;
    j=j+1;
    i=j+1;

end

n=size(A)-1;
n=n(1);
while n>0
    L=L*cell2mat(Marray{n});
    n=n-1;
end

D=L*A0*L';
C=L^-1*D^(1/2)
CT=C'
A=C*C'
end