function [sobel] = sobelEdge(image, threshold)
    % mask for sobel in X and Y direction
    maskX = [-1 -2 -1; 0 0 0; 1 2 1];
    maskY = maskX';
    
    % compute sobel edge in X and Y direction
    sobelX = AverageFiltering(image, maskX);    
    sobelY = AverageFiltering(image, maskY);
    
%   threshold = 0.5;
    sobelX = imbinarize(sobelX,threshold);
    sobelY = imbinarize(sobelY,threshold);
    sobel = sobelX + sobelY;
    imshow(sobel);
    
    % Testing if adding the edge images first will yield better results
%     edgeImage = sobelX + sobelY;
%     sobelEdge = imbinarize(edgeImage, threshold);
%     imshow(sobel);title('Add edges');
%     figure;imshow(edgeImage);title('Add images');
%     figure;imshow(image);
end