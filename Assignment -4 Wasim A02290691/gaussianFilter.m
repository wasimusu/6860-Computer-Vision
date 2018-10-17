function [filteredImage, H] = gaussianFilter(image)

% Thresholds
sigmaU = 75;
sigmaV = 25;

% Apply filter
[row, col] = size(image);
H = zeros(row, col);
cu = row/2;
cv = col/2;

% Compute butterworth filter
for u = 1 : row
    for v = 1 :col
        H(u,v) = exp(-(u - cu)^2/(2*sigmaU^2)- (v-cv)^2/(2*sigmaV^2));
    end
end

% Apply filter to the image
filteredImage = applyFilter(image, H);
end
