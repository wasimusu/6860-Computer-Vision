A = imread('Ball.tif');
[centers, radii, M] = imfindcircles(A,[10 20]); % Neglect the really small dots
% radii = sort(radii);
% % let go of the first and last few circles
% radii = radii(5:length(radii)-5);
% median_radius = median(radii);
% area = median_radius * median_radius *(22/7);
% lSize = (area * 0.9);
% uSize = (area * 1.1);


x = zeros(1, ceil(length(radii)/2));
y = zeros(1, ceil(length(radii)/2));
for i = 1:2:length(radii)
    x(i) = centers(i);
    y(i) = centers(i+1);
%     disp([i, x(i), y(i)]);
end

Ocount = 0;
l = length(centers);
disp(l);
disp(length(x));
for i = 1: l-1
    r1 = radii(i); 
    x1 = x(i);
    y1 = y(i);
    overlapping = false;
    for j = 1 : l-1           
        x2 = x(j);
        y2 = y(j);
        r2 = radii(j);
        d = (((x2 - x1)^2) + (y2 - y1)^2)^0.5;
        if d < (r1 + r2)
            overlapping = true;
            break;
        end
    end
    if overlapping == false
        Ocount = Ocount + 1;
        overlapping = true;
        disp([x1, y1, r1, x2, y2, r2]);
        disp(["Non overlapping circles", Ocount]);
    else
        disp(["overlapping circles", Ocount]);
    end
end

disp(["Overlapping circles count ", Ocount]);