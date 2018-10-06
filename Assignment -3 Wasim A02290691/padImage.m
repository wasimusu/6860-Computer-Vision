function paddedImage = padImage(image, mask)
   [row, col, ~] = size(image);
   % Assume grayscale image
   stepSize = length(mask)-1;

   % Zero pad the image
   paddedImage = zeros(row+stepSize/2,col+stepSize/2);
   paddedImage(stepSize/2:row-1+stepSize/2, stepSize/2:col-1+stepSize/2) = image;
    
   imshow(paddedImage);
end

