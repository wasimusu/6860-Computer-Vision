function [scaledImage, P] = Scaling(inputImage, range)
    % Max and min intensity of input image
    oldMax = max(max(inputImage));
    oldMin = min(min(inputImage));

    % Max and min intensity of desired image
    newMax = max(range);
    newMin = min(range);

    % Check if the intensity range is fine
    if (max(range) > 255) || (min(range) < 0)
        disp('Transfer Parameters invalid');
    end

    % Scale the image
    slope = (newMax-newMin)/(oldMax - oldMin);
    scaledImage = (inputImage - oldMin)*slope + newMin;

    % Just passing on the transfer Params
    uniqueA = unique(inputImage(:));    
    P = (uniqueA - oldMin)*slope + newMin;
end
