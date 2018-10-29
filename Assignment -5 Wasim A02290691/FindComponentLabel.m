function [output, blobCount] = FindComponentLabel(image)
% removeOverlaps = false;
[row, col] = size(image);

% Read wirebond
dilationImage = zeros(size(image)); % When a point is found, that point is dilated on this image
prevDilatedImage = dilationImage; % Used to compare changes in dilation
output = dilationImage; % Contains labelled circles / blobs

se = strel('disk', 3); 

blobCount = 1;
blobDim = [];

for r = 1:row
    for c = 1:col
        pixelI = image(r, c);
        pixelO = output(r, c);        
        % Only when a pixel in blank is black and and pixel in input image 
        % is white.
        % else it has already been lablled
        if (pixelI == 1 && pixelO == 0)
            dilationImage(r, c) = 1;
            while 1
                dilationImage = imdilate(dilationImage, se);
                dilationImage = dilationImage & image;
                if(dilationImage == prevDilatedImage)
                    % No change is taking place and is worth breaking
                    break
                end
                prevDilatedImage = dilationImage;
            end
            pos = find(dilationImage==1);            
            
            output(pos) = blobCount;
            blobCount = blobCount + 1;
            disp(blobCount)            

            % Let's find another blob
            dilationImage = zeros(size(image));
            
        end
    end
end

output = output * (255 / blobCount);
figure; imshow(uint8(output)); title('LabelledImage');
end
