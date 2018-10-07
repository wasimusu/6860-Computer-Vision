function [edge] = sobelEdge(image, threshold)
    % mask for sobel in X and Y direction
    maskX = [-1 -2 -1; 0 0 0; 1 2 1];
    maskY = maskX';
    
    image = imgaussfilt(image, 0.5);
    % compute sobel edge in X and Y direction
    sobelX = FindSobelEdge(image, maskX);    
    sobelY = FindSobelEdge(image, maskY);

    % Add X and Y directions of gradients
    sobel = abs(sobelX) + abs(sobelY);

    % Change the data type of sobel
    sobel = uint8(sobel);
    edge = imbinarize(sobel, threshold);  % 0.6 is optimal
end