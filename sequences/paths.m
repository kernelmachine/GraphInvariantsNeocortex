function no = paths(A,n)
    [Q,D] = eig(double(A));
    no = sum(sum(triu(real(Q) * real(D^n) * real(Q')))) + sum(sum(tril(real(Q) * real(D^n) * real(Q'))));

