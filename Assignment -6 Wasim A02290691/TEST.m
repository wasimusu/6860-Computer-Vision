function [] = TEST()

% Read wirebond
image = imread('SmallSquares.tif');
imageC = imcomplement(image);

se = [ 1 0 0; 1 0 0; 1 1 1];
seC = [0 1 0; 0 1 1; 0 0 0];

d1 = imerode(image, seC);
d2 = imerode(imageC, se);

corners = d1 & d2;
disp(sum(corners(:)));

figure; imshow(corners); title('Corners')
figure; imshow(d1); title('d1');
figure; imshow(d2); title('d2');
end
