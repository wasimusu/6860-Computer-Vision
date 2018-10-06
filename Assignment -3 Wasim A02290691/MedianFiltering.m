function [medianFiltered] = MedianFiltering(image, mask)
       
    % filteredImage is the container for output image
   medianFiltered = double(image);

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
   image = padImage(image, mask);
   
   % Convert data types
   image = double(image);

   mask = mask(:); %convert mask into row vector
   for i = 1:row-stepSize/2
       for j = 1:col-stepSize/2            
           % Get multiples of roi elements
           roi = image(i:i+stepSize, j:j+stepSize);

           % Assign median element to the image
           medianFiltered(i,j) = computeMedian(roi, mask);       
       end
   end
   medianFiltered = uint8(medianFiltered);    
end