image = imread('ball.bmp');

% Change color space and take h element
hsv_image = rgb2hsv(image);
h = hsv_image(:, :, 1);
i = hsv_image(:, :, 3);

% Just looked at the histogram. It has four peaks. Tried out repeatedly the
% threshold values between all peaks. 0.1 worked the best for the thresh
% between first two peaks.
% figure; imhist(h);pause;
bw = imbinarize(h, 0.115);
% Do morphological operations to remove tiny specks and fill tiny gaps in
% the ball
str = strel('square', 5);
bw = imerode(bw, str);

str = strel('square', 3);
bw = imdilate(bw, str);
bw = imerode(bw, str);
bw = imdilate(bw, str);
bw = imerode(bw, str);
bw = imdilate(bw, str);
bw = imdilate(bw, str);
bw = imdilate(bw, str);
bw = imdilate(bw, str);
bw = imerode(bw, str);
bw = imerode(bw, str);
bw = imdilate(bw, str);
bw = imdilate(bw, str);

size(h)
size(bw)
output = and(h, bw);
imshow(bw); title('Ball');

% Do another thresholding to detect the shadow.
shadow = imbinarize(i, 0.38);
shadow = imerode(shadow, str);

% Complement image into 
shadow = imcomplement(shadow);
shadow = imclearborder(shadow);

% Do a series of morphological operations
shadow = imerode(shadow, str);
shadow = imerode(shadow, str);
shadow = imdilate(shadow, str);
shadow = imdilate(shadow, str);

shadow = shadow & image(:, :, 1);
figure; imshow(shadow); title('Shadow');

% figure; imshow(bw);
% figure; imshow(i);
% figure; imshow(shadow);