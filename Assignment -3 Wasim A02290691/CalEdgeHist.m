function edgeHist = CalEdgeHist(image, bin)
    bin;
    
    % mask for sobel in X and Y direction
    maskX = [-1 -2 -1; 0 0 0; 1 2 1];
    maskY = maskX';

    % compute sobel edge in X and Y direction
    sobelX = AverageFiltering(image, maskX);    
    sobelY = AverageFiltering(image, maskY);
    
    imshow(sobelX+sobelY);
    threshold = 0.5
    sobelX = imbinarize(sobelX,threshold);
    sobelY = imbinarize(sobelY,threshold);
    sobel = sobelX + sobelY;
     figure;imshow(sobel);title('sobel edge');
%     figure;title('Binarize');

    % add X and Y for a complete view
    % sobel = sobelX + sobelY;

    % Compute gradients
    gradients = atan(sobelY ./ sobelX);
    gradients = gradients(:);
    gradients(1:10)
    imhist(gradients);
    imshow(sobelX);
    figure;imshow(gradients);
    edgeHist = sobelX;
end
