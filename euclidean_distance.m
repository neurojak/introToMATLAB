function [distance] = euclidean_distance(point_1, point_2)
% this function computes the euclidean distance between 2 points. Each
% point should be an array of at least 2 dimensions. The output is the
% euclidean distance between these points

% check to make sure our points have at least 2 dimensions
if (numel(point_1) < 2) || (numel(point_2) < 2);
    % abort and tell the user why it didn't work
    error('YAARRRRR, YOUR POINT SHOULD HAVE AT LEAST 2 DIMENSIONS');
end

% also check to make sure the input arrays are 1xN in size
size_point_1 = size(point_1);
size_point_2 = size(point_2);
if (sum(size_point_1(size_point_1==1)) ~= 1) || (sum(size_point_2(size_point_2==1)) ~= 1);
    % pirate voices make hours of debugging go by smoother
    error('YAAAARRR, YOUR POINTS ARE FUNNY SHAPED!!');
end

% compute the distance
distance = sqrt( sum( (point_1-point_2).^2 ) );

end
