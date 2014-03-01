function A = adjacency(data, nn)

% Compute k-nearest neighbors graph for an adjacency matrix
% data - N x 2 set of X-Y coordinates for N neurons, where N = number of neurons
% nn - integer (k) - number of nearest neighbors
%
% Returns a sparse NxN adjacency matrix specifiying undirected k-nearest
% neighbors graph
%
% Example: 
%       A = adjacency(X,6) 
%           each point specified by coordinates in X are connected to its 6
%           nearest neighbors.

n = size(data,1);  
A = sparse(n,n);
g = 100;
for i1=1:g:n    
    i2 = i1+g-1;
    if (i2> n) 
      i2=n;
    end;
    XX= data(i1:i2,:);  
    dt = L2_distance(XX',data');
    [Z,I] = sort ( dt,2);
    for i=i1:i2
      for j=2:nn+1
        A(i,I(i-i1+1,j))= Z(i-i1+1,j); 
        A(I(i-i1+1,j),i)= Z(i-i1+1,j); 
      end;    
    end
end;

A = A > 0;
