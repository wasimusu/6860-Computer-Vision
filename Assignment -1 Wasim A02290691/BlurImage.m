% WASIM AKRAM KHAN -- Assignment 1

function [blurImage] = BlurImage(origImage)
% deal with color and gray scale images
% assuming rows and columns are divisible by 4

% Find the number of rows, cols and channels in image
[row, col, ch] = size(origImage);

% Copy image, loop over and replace elements with box average
blurImage = origImage;
for channel = 1:ch
    for r = 1:2:row-1
        for c = 1:2:col-1
            blurImage(r:r+1, c:c+1, channel) = mean(mean(origImage(r:r+1, c:c+1, channel)));
        end
    end
end
end

