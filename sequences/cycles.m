function no = cycles(A,n)

% Compute number of cycles of length n in graph specified by A. 

    [~,D] = eig(double(A));
    no = sum(diag(D^n));
