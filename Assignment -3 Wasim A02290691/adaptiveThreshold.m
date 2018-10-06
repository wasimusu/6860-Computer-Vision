%function [cleanImage] = adaptiveThreshold(image)
function [cleanImage]= adaptiveThreshold(image, step)
cleanImage = double(image);
startR = 001;
[row, col] = size(image);
for r = 1:step:row
    startC = 001;
    for c = 1:step:col               
%         disp([startR, startC]);
        % Get roi, find threshold, binarize
        roi = image(startR:min(startR+step,row), startC:min(startC+step, col));
        thresh = adaptthresh(roi,0.99,'ForegroundPolarity','bright');
        bw = imbinarize(roi, thresh);
        cleanImage(startR:min(startR+step,row), startC:min(startC+step, col))=bw;

        % imshow(cleanImage);title('ROI');
        % pause;
        startC = startC + step;
        if startC > col
            break
        end
    end
    startR = startR+step;
    
end

% imshow(cleanImage);
% pause;
% close all;

end
