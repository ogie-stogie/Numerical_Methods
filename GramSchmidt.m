function [U] = GramSchmidt(A)
I = eye(size(A));
U=I;
for i=2:size(A)
    for j=1:i-1
        e=I(:,i);
        U(:,i)= e - ( (A*e)'*U(:,j)) * U(:,j)/((A*U(:,j))'*U(:,j) ); 
    end
    
end