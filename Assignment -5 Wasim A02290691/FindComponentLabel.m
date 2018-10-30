function [output, blobCount] = FindComponentLabel(image, removeOverlaps, removeBorder)

    % Some useful paramters of connected components    
    [row, col] = size(image);
    se = strel('square', 3);  % Using 8 connectivity
    blobCount = 0;
    blobDim = []; % Store dimensions of blob
    
    % Read wirebond and initialize containers for output and intermediate
    % images
    dilationImage = zeros(size(image)); % When a point is found, that point is dilated on this image
    prevDilatedImage = dilationImage; % Used to compare changes in dilation
    output = dilationImage; % Contains labelled circles / blobs

    for r = 1:col
        for c = 1:row
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
                blobCount = blobCount + 1;
                output(pos) = blobCount;
                blobDim = [blobDim, length(pos)];
                % disp(blobCount)            

                % Let's find another blob
                dilationImage = zeros(size(image));            
            end
        end
    end

    if removeBorder
        % Delete Border blobs
        deleted = 0;
        for r = 1:row
            for c = 1:col
                pixel = output(r, c);
                % If this pixel is on the border, find its connected
                % components and set them to 0
                if (pixel ~= 0 ) && (r == 1 || r == row || c == 1 || c == col)
                    output(output == pixel) = 0;
                    deleted = deleted + 1;
                end
            end
        end

        % Readjust after deleting border blobs
        newCount = 1;
        for i = 1:blobCount
            pos = find(output == i);
            if isempty(pos)
                disp("Empty sequence");
            else
                output(pos) = newCount;
                newCount = newCount + 1;
            end
        end
        blobCount = blobCount - deleted;
    end

    % Remove everything that's not the median size
    if removeOverlaps
        % Find the median size of blobs that are not connected to the border
        % This is not a really generic way to do things.
        % You could have just one circle that is not overlapping and all
        % the rest of the circles could be overlapping. Or none of the
        % circles could be overlapping but all of them except one is around
        % the border and is thus incomlete. So neither max, min, mode,
        % median work if you want to compute area of circle in a general
        % way. The question states that circles are same size, but they are
        % not. They won't be same size if a picture was taken for the coins
        % / circles.

        [~, radii, ~] = imfindcircles(image,[5 50]); % Neglect the really small dots
        radii = sort(radii);
        % let go of the first and last few circles
        radii = radii(5:length(radii)-5);
        median_radius = median(radii);
        area = median_radius * median_radius *(22/7);
        lSize = (area * 0.9);
        uSize = (area * 1.1);
        
        temp = zeros(size(image));

        newCount = 0;
        area = [];
        for i = 1: blobCount
            pos = (find(output==i));
            len = length(pos);
            if (len >= lSize) && (len <= uSize)
                area = [area,  len];
                newCount = newCount + 1;
                temp(pos) = newCount;
            end    
        end
        blobCount = newCount;
        output = temp;
        disp(area);
        disp(["Area : " + mean(area)]);
        disp(["Blobs : ", blobCount]);
    end
    
    output = output * (255 / (blobCount));
    output = uint8(output);
    % figure; imshow(output); title('LabelledImage');
end
