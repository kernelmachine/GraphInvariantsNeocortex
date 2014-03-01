
function [stdang] = flowmap(coord,adjMatrix,pia)
    % compute flowmap of functional topology adjMatrix
    % coord: N x 2 array of coordinates of neurons
    % adjMatrix: functional topology 
    % pia: 2 x 1 array, orientation of pia 
    %
    % REQUIRES DOWNLOAD OF L2_DISTANCE
    % (http://web.mit.edu/cocosci/isomap/code/L2_distance.m)
    
    ang = angles(coord,pia);
    D = L2_distance(coord',coord',1);
    agl = ang(adjMatrix);
    [x,y] = pol2cart(agl,D(adjMatrix));
    stdang = circ_var(agl);
    scatter(x,y,'r','filled');
    axis off;
end

function [angleInRadians] = angles(coord,pia)
    % compute angle of cell coordinates relative to pia
    
    as = vectorAngle(pia, [1 0]');
    rotxy = rotation(coord,[0 0], as,'radians');
    deltaX = bsxfun(@minus,rotxy(:,1),rotxy(:,1)');
    deltaY = bsxfun(@minus,rotxy(:,2),rotxy(:,2)');     
    angleInRadians = atan2(deltaY,deltaX);
end

function [M] = vectorAngle(X1,X2)
    % compute angle between coordinates of two vectors
    
    ns1 = sqrt(sum(X1 .* X1, 1));
    ns2 = sqrt(sum(X2 .* X2, 1));
    ns1(ns1 == 0) = 1;  
    ns2(ns2 == 0) = 1;
    M = bsxfun(@times, X1' * X2, 1 ./ ns1');
    M = bsxfun(@times, M, 1 ./ ns2);
    M = real(acos(M));
    
end
    
