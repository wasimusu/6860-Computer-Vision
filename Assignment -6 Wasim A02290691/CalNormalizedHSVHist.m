function [hist] = CalNormalizedHSVHist(image, hBin, sBin, vBin)

%   Change the image color space
    image = rgb2hsv(image);

%   Compute image size
    [row, col, ~] = size(image);
    imageSize = row*col;

%   Compute histogram of the three channels    
    histH = imhist(image(:, :, 1), hBin)/imageSize;
    histV = imhist(image(:, :, 2), sBin)/imageSize;
    histS = imhist(image(:, :, 3), vBin)/imageSize;
    
%   merge the histogram of three channels into one
    hist = zeros(1, hBin*sBin*vBin);
    index = 1;
    for h = 1:hBin
        for s = 1:sBin
            for v = 1:vBin
                hist(index) = histH(h)*histS(s)*histV(v);
                index = index + 1;
            end
        end
    end        
end