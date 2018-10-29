function [output] = FindComponentLabel()

% Read wirebond
image = imread('Ball.tif');
blank = zeros(size(image));
prevD = blank;
output = blank;

se = strel('disk', 3);
[row, col] = size(image);
disp([row, col])

count = 1;
for r = 1:row
    for c = 1:col
        pixelO = image(r, c);
        pixelB = output(r, c);        
        % Only when a pixel in blank is black and and pixel in input image 
        % is white
        if (pixelO == 1 && pixelB == 0)
            blank(r, c) = 1;
            while 1
                blank = imdilate(blank, se);
                blank = blank & image;
                if(blank == prevD)
                    break
                end
                prevD = blank;
            end
            pos = find(blank==1);
            output(pos) = count;
            blank = zeros(size(image));
            count = count + 1;
            disp(count)
        end
    end
end

output = output * (255 / count);
figure; imshow(uint8(output)); title('LabelledImage');

end
