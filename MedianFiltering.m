function [filteredImage] = MedianFiltering(image, mask)
       
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
   
%    % Convert data types
%    image = double(image);
%    filteredImage = double(filteredImage);
%    mask = mask(:); %convert mask into row vector
%    for i = 1:row-stepSize/2
%        for j = 1:col-stepSize/2            
%            % Get multiples of roi elements
%            roi = image(i:i+stepSize, j:j+stepSize);
%            roi = roi(:);
%            elements = zeros(1,stepSize+1);
%            for elementIndex = 1 : length(roi)
%                for maskIndex = 1 : length(mask)
%                    elements(elementIndex) = roi(elementIndex);
%                end
%            end
%            % Assign median element to the image
%            filteredImage(i,j) = median(elements);       
%        end
%    end
%    filteredImage = uint8(filteredImage);    
% end

   % Convert data types
   image = double(image);
   filteredImage = double(filteredImage);
   mask = mask(:); %convert mask into row vector
   for i = 1:row-stepSize/2
       for j = 1:col-stepSize/2            
           % Get multiples of roi elements
           roi = image(i:i+stepSize, j:j+stepSize);
           roi = roi(:);

           elements = zeros(1, sum(mask));
           j = 1;
           for i = 1 : length(roi)
               for k = 1 : mask(i)
                   elements(j) = roi(i);
                   j = j+1;
               end
           end
           % Assign median element to the image
           filteredImage(i,j) = median((elements));        
       end
   end
   imshow(filteredImage);
   filteredImage = uint8(filteredImage);
end
