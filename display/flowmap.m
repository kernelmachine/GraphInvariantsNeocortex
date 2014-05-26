
function [stdang] = flowmap(coord,adjMatrix,pia)
    % compute flowmap of functional topology adjMatrix
    % coord: N x 2 array of coordinates of neurons
    % adjMatrix: functional topology 
    % pia: 2 x 1 array, orientation of pia 
    %
    % REQUIRES DOWNLOAD OF L2_DISTANCE and ROTATION
    % (http://web.mit.edu/cocosci/isomap/code/L2_distance.m)
    % (http://www.mathworks.com/matlabcentral/fileexchange/4257-coordinate-rotation/content/rotation.m)
    
    ang = angles(coord,pia);
    D = L2_distance(coord',coord',1);
    agl = ang(adjMatrix);
    [x,y] = pol2cart(agl,D(adjMatrix));
    stdang = circ_var(agl);
    
    scatter(x,y,'r','filled');  % use compass(x,y) to display data in arrow format
    
    axis off;
end

function [angleInRadians] = angles(coord,pia)
    % compute angle of cell coordinates relative to pia
    
    as = vectorAngle(pia, [0 1; 0 0]');
    rotxy = rotation(coord,[0 0], as,'radians');
    deltaX = bsxfun(@minus,rotxy(:,1),rotxy(:,1)');
    deltaY = bsxfun(@minus,rotxy(:,2),rotxy(:,2)');     
    angleInRadians = atan2(deltaY,deltaX);
end

function [M] = vectorAngle(X1,X2)
   % compute angle between coordinates of two lines
    
   angle1 = atan2(X1(1,2) - X1(2,2), X1(1,1) - X1(2,1));
   angle2 = atan2(X2(1,2) - X2(2,2), X2(1,1) - X2(2,1));
   M = angle1 - angle2;
    
end
    
