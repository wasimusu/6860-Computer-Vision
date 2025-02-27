function [enhancedIm, parameters] = HistEqualization(inputImage)
    
    originalImage = inputImage;

    normalize = true; % just assume it is true
    enhancedIm  = inputImage;

    % flatten the 2D image
    inputImage = inputImage(:);

    % count each of the intensity levels
    count = double(zeros(1,256));
    inputImage = double(inputImage);
    for i = 1:length(inputImage)
        index = uint8(inputImage(i));
        count(index+1) = count(index+1) + 1;
    end
    
    % normalize the intensity count
    if normalize
        count = count / sum(count);
    end

    % accumulate the intesity count and multiply by the newMax
    for i = 2:256
        count(i) = count(i) + count(i-1);
    end

    % Multiply by the new Max level
    newMaxIntensity = 256;
    L = newMaxIntensity - 1;
    % count(1) = count(1)* L;    
    count = uint8(count * L);    

    % Do the mapping
    [row, col] = size(originalImage);
    for i = 1  : row
        for j = 1: col
            index = (enhancedIm(i,j));
            enhancedIm(i,j) = count(index+1);
        end
    end
    
    parameters = count;

end
