%%
function [lambda, x, k] = potenze(A, maxit)
    [n, m] = size(A);
    if n ~= m
        error('A deve essere quadrata');
    end
    x = ones(n, 1);
    x = x / norm(x); 
    lambda = 1;
    tol = 1e-6;
    k = 0;
    normA = norm(A); 
    while norm(A*x - lambda*x) > tol * normA && k < maxit
        y = A * x;         
        lambda = x' * y;   
        x = y / norm(y);   
        k = k + 1;         
    end
end

A = [4, -5; 2, 3];
[lambda, x, k] = potenze(A, 1000)

B = [0, 11, -5; -2, 17, -7; -4, 26, -10];
[lambda, x, k] = potenze(B, 432542)

C = [1, 0.5, -0.5, 0.2; 0.5, 12, 0.8, 1; -0.5, 0.8, -16, 1; 0.2, 1, 1, -4];
[lambda, x, k] = potenze(C, 1000)
%%
function [lambda, x, k] = potenze_inverse(A, maxit)
    [n, m] = size(A);
    if n ~= m
        error('A deve essere quadrata');
    end
    x = ones(n, 1);
    x = x / norm(x); 
    lambda = 1;
    tol = 1e-6;
    k = 0;
    normA = norm(A); 
    while norm(A*x - lambda*x) > tol * normA && k < maxit
        y = A \ x;
        lambda = 1 / (y' * x);
        x = y / norm(y);
        k = k + 1;
    end
end

B = [0, 11, -5; -2, 17, -7; -4, 26, -10];
[lambda, x, k] = potenze_inverse(B, 1000)
C = [1, 0.5, -0.5, 0.2; 0.5, 12, 0.8, 1; -0.5, 0.8, -16, 1; 0.2, 1, 1, -4];
[lambda, x, k] = potenze_inverse(C, 1000)

%%

function [omega] = q_r(A, maxit)
    [n, m] = size(A);
    if n ~= m
        error('A deve essere quadrata');
    end
    k = 0;
    omega = ones(n,1);
    while k < maxit
        [Q, R] = qr(A);
        A = R * Q;
        k = k + 1;
        omega = diag(A);
    end
end



B = [0, 11, -5; -2, 17, -7; -4, 26, -10];
[omega] = q_r(B, 10000)

%%

%si usano potenze, potenze inverse e potenze shiftate per trovare tutte le
%autocoppie










