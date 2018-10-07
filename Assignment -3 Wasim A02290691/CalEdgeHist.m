function [sobel,hist] = CalEdgeHist(image, bin)    
    % mask for sobel in X and Y direction
    maskX = [-1 -2 -1; 0 0 0; 1 2 1];
    maskY = maskX';

    % compute sobel edge in X and Y direction
    sobelX = FindSobelEdge(image, maskX);    
    sobelY = FindSobelEdge(image, maskY);

    % Add X and Y directions of gradients
    sobel = abs(sobelX) + abs(sobelY);
    sobel = uint8(sobel);
    sobel = imbinarize(sobel, 0.65);  % 0.6 is optimal

    % Compute gradients
%     gradients = sobelY ./ sobelX;
%     gradients(isnan(gradients))=[];
%     gradients = atan(gradients);
    
    degrees = zeros(1, length(sobelX));
    radToDegree = 57.2958;
%     radToDegree = 1;
    sobelX = sobelX(:);
    sobelY = sobelY(:);
    for i = 1 : length(sobelX)
        y = sobelX(i);
        x = sobelY(i);        
        if x == 0 && y == 0
            % Do nothing
        else
            angle = atan(y/x)*radToDegree;
            if x >= 0 && y >= 0  % First Quad
                degrees(i) = angle;

            elseif x <= 0 && y >= 0  % Second Quad
                degrees(i) = 180 + angle;

            elseif x <= 0 && y <= 0  % Third Quad
                degrees(i) = 180 + angle;

%             else  x >= 0 && y <= 0 % Fourth Quad
            else % Fourth Quad
                degrees(i) = 360 + angle;
            end
        end
    end

    % build a histogram
    degrees = degrees / (360 / bin);
    hist = zeros(1, bin);
    for i = 1 : length(degrees)
        index = int8(floor(degrees(i)));
        hist(index+1) = hist(index+1) + 1;
    end
end
