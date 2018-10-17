function [H, filteredImage] = butterworthFilter(image, d0, n)

% Apply filter
[row, col] = size(image);
H = zeros(row, col);
cu = row/2;
cv = col/2;

% Compute butterworth filter
for u = 1 : row
    for v = 1 :col
        D = sqrt((u - cu)^2+ (v-cv)^2);
        H(u,v) = 1/ (1 + (d0/D)^(2*n));
    end
end

% The output is real part of the image
filteredImage = applyFilter(image, H);
end
