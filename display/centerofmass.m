function [] = centerofmass(weights, layers, coord,vrtxSiz)

% Display projection of weights onto slice contours
% weights:  N x 1 array of centrality measure (degree, eigenvector
% centrality, etc.)
% layers:  N x 1 array of layers (if no layers, input empty matrix [])
% coord:  N x 2 coordinates of neuron centroids in slice
% vrtxSiz: integer of size of nodes in projection
%



figure;

% Map node weight to node size

minVwt=min(weights);
maxVwt=max(weights);
weights=vrtxSiz*(weights-minVwt)/(maxVwt-minVwt)+1;

% project weights onto slice contour
if isempty(layers)
    scatter(coord(:,1),coord(:,2),weights,'filled','MarkerFaceColor',[1,0.5,0.2]);
else
    scatter(coord(:,1),coord(:,2),weights,layers,'filled');
end

axis off;
