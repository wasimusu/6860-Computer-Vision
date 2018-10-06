function edgeHist = CalEdgeHist(image, bin)    
    % mask for sobel in X and Y direction
    maskX = [-1 -2 -1; 0 0 0; 1 2 1];
    maskY = maskX';

    % compute sobel edge in X and Y direction
    sobelX = double(AverageFiltering(image, maskX));    
    sobelY = double(AverageFiltering(image, maskY));
    
    % Compute gradients
    gradients = double(sobelX ./ sobelY);
    gradients(isnan(gradients))=0;
    gradients = atan(gradients);
%     gradients = gradients(:);
%     imhist(gradients);
%     figure;imshow(gradients);
    
    edgeHist = imhist(gradients,bin);
    
end
