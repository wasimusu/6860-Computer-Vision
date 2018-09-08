% WASIM AKRAM KHAN -- Assignment 1

function [blurImage] = BlurImage(origImage)
% deal with color and gray scale images
% assuming rows and columns are divisible by 4

% Find the number of rows, cols and channels in image
[row, col, ch] = size(origImage);

% Copy image, loop over and replace elements with box average
blurImage = origImage;
for channel = 1:ch
    for r = 1:2:row-2
        for c = 1:2:col-2
            blurImage(r:r+2, c:c+2, channel) = mean(mean(origImage(r:r+2, c:c+2, channel)));
        end
    end
end
end

