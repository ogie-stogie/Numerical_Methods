function [xk,errors,spectrumJw] = SORmethod(A,omega,b,x0,K)
D = diag(diag(A));
L = -tril(A,-1);
U = -triu(A,1);
J_omega = inv(D-omega*L)*((1-omega)*D + omega*U);

for i=1:K
    x = J_omega*x0 + omega*inv(D-omega*L)*b;
    errors(i) = norm(A*x-b);
    x0=x;
end
xk = x0;
spectrumJw = max(eig(J_omega));
plot(0:K-1,errors)
xlabel("Iterations");
ylabel("Error");
title(["Error over iterations for omega =", num2str(omega)]);
end