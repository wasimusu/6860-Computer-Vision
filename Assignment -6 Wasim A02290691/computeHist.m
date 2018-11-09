function [hist] = computeHist(image, hBin, sBin, vBin)

%   Change the image color space
    image = rgb2hsv(image);

%   Compute image size
    [row, col, ~] = size(image);
    imageSize = row*col;

%   Compute histogram of the three channels    
    hI = image(:, :, 1)*hBin;
    sI = image(:, :, 2)*sBin;
    vI = image(:, :, 3)*vBin;
        
%   merge the histogram of three channels into one
    hist = zeros(hBin, sBin, vBin);
    for r = 1:row
        for c = 1:col
            ih = min(ceil(hI(r, c))+1, hBin);
            is = min(ceil(sI(r, c))+1, sBin);
            iv = min(ceil(vI(r, c))+1, vBin);
%             disp([ih, is, iv]);
            hist(ih, is, iv) = hist(ih, is, iv) + 1;
        end
    end    
    
    hist = hist/imageSize;
    hist = hist(:);
end