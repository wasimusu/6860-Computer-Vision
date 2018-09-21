function [hist] = CalHist(inputImage, normalize)
    % Assuming a grayscale image

    bins = 256; % no of bins

    % flatten the 2D image
    inputImage = inputImage(:);
    inputImage = inputImage / (256/bins);
    
    count = zeros(1,bins);
    for i = 1:length(inputImage)
        index = uint8(inputImage(i));
        count(index+1) = count(index+1) + 1;
    end

    % Normalize if required
    if normalize
        count = count / length(inputImage);
    end
        
    %Plot the histogram
    xAxis = 1:256;
    plot(xAxis);
    size(count)
    
    hist = count;
end
