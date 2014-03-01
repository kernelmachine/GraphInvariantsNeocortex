% compute laplacian 

function L = lap(adj)
    D = diag(sum(adj'));
    L =  D - adj;