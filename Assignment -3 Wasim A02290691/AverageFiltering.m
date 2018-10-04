function [filteredImage] = AverageFiltering(image, mask)
       
    % filteredImage is the container for output image
    filteredImage = image;
   % Check if the mask is valid 
   [rowMask, colMask] = size(mask);
   if rowMask ~= colMask
        disp('Invalid mask');
   else
       disp('Good mask');
   end
   
   % Assume grayscale image
   stepSize = length(mask)-1;
   [row, col] = size(image);

   % Zero pad the image
   zeroPaddedImage = zeros(row+stepSize/2,col+stepSize/2);
   zeroPaddedImage(stepSize/2:row-1+stepSize/2, stepSize/2:col-1+stepSize/2) = image;
   image = zeroPaddedImage;
   
   % Convert data types
   image = double(image);
   filteredImage = double(filteredImage);
   mask = double(mask);
   for i = 1:row-stepSize/2
       for j = 1:col-stepSize/2
           filteredImage(i,j) = sum(sum(image(i:i+stepSize, j:j+stepSize).*mask));
       end
   end
   filteredImage = uint8(filteredImage);
    
end
