function [sobel,edgeHist] = CalEdgeHist(image, bin)    
    % mask for sobel in X and Y direction
    maskX = [-1 -2 -1; 0 0 0; 1 2 1];
    maskY = maskX';

    % compute sobel edge in X and Y direction
    sobelX = double(FindSobelEdge(image, maskX));    
    sobelY = double(FindSobelEdge(image, maskY));
    
    % Compute gradients
    gradients = double(sobelX ./ sobelY);
    gradients(isnan(gradients))=[];
    gradients = atan(gradients);

%     gradients = gradients(:);
%     bar(imhist(gradients, bin));
%     figure;imshow(gradients);
    
    edgeHist = imhist(gradients,bin);
    sobel = sobelX + sobelY;
end
