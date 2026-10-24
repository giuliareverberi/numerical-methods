function [Q,R]=gram_schmidt_modificato(A)
[m,n]=size(A);
Q = zeros(m, n);
R = zeros(n, n);
for j=1:n
    v = A(:,j);
    for i=1:j-1
        R(i,j)=Q(:,i)'*v;
        v = v - R(i,j)*Q(:,i);
    end
    R(j,j)=norm(v);
    if R(j,j)==0
        error('norma 0!')
    end
    Q(:,j)=v/R(j,j);
end
if not (norm(Q'*Q - eye(n)) < 0.0000001 & norm(Q*R - A) < 0.0000001)
    error('fail :(')
end
