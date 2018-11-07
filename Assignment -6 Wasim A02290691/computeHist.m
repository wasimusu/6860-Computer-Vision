function [hist] = computeHist(image, hBin, sBin, vBin)

    image = rgb2hsv(image);
    [row, col, ~] = size(image);
    imageSize = row*col;
    
    histH = imhist(image(:, :, 1), hBin)/imageSize;
    histV = imhist(image(:, :, 2), sBin)/imageSize;
    histS = imhist(image(:, :, 3), vBin)/imageSize;
    
%     figure; plot(histH);
%     figure; plot(histV);
%     figure; plot(histS);
%     figure;
    
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