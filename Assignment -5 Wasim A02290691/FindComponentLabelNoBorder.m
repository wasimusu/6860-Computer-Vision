function [output, blobCount] = FindComponentLabelNoBorder(image, removeOverlaps)
[row, col] = size(image);

% In case we want to remove borders
noBorder = true;
borderPos = [1:row, 1:row:row*row, row:row:row*row-1, row*row-row:row*row];

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
        onBorder = false;
        if (pixelI == 1 && pixelO == 0)
            % Check if the pixel is on the border
            if ~onBorder
                if (( r == 1))
                    onBorder = true;
                    disp([r,c])
                end
            end
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

            blobDim = [blobDim, length(pos)];
            % Let's find another blob
            dilationImage = zeros(size(image));            
        end
    end
end

% Delete Border blobs
deleted = 0;
for r = 1:row
    for c = 1:col
        pixel = output(r, c);
        if (pixel ~= 0 ) && (r == 1 || r == row || c == 1 || c == col)
            pos = find(output == pixel);
            output(pos) = 0;
            deleted = deleted + 1;
        end
    end
end

% Readjust after deleting border blobs
newCount = 1;
for i = 1:blobCount
    pos = find(output == i);
    if length(pos) == 0
        disp("Empty sequence");
    else
        output(pos) = newCount;
        newCount = newCount + 1;
    end
end
blobCount = blobCount - deleted;

figure; imshow(uint8(output*10)); title('LabelledImage');

% Remove everything that's not the median size
if removeOverlaps
    % Find the median size of blobs that are not connected to the border
    blobDim = sort(blobDim(1:min([10, blobCount])));
    
    mm = median(blobDim);
    disp(mm)
    lSize = (mm*0.6);
    uSize = (mm*1.1);
    temp = zeros(size(image));

    newCount = 1;
    area = 0;
    for i = 1: blobCount
        pos = (find(output==i));
        len = length(pos);
        if (len >= lSize) && (len <= uSize)
            area = area + len;
            temp(pos) = newCount;
            newCount = newCount + 1;
        end    
    end
    blobCount = newCount;
    output = temp;
disp(["Area : " + area / blobCount]);
end

output = output * (255 / blobCount);
figure; imshow(uint8(output)); title('LabelledImage');
end
