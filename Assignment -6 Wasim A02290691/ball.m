image = imread('ball.bmp');

% Change color space and take h element
hsv_image = rgb2hsv(image);
h = hsv_image(:, :, 1);
i = hsv_image(:, :, 3);

% Just looked at the histogram. It has four peaks. Tried out repeatedly the
% threshold values between all peaks. 0.1 worked the best for the thresh
% between first two peaks.
% figure; imhist(h);

bw = imbinarize(h, 0.1);
str = strel('square', 3);
bw = imclose(bw, str);
bw = imclose(bw, str);
bw = imdilate(bw, str);
bw = imerode(bw, str);
bw = imopen(bw, str);
bw = imopen(bw, str);

shadow = imbinarize(i, 0.38);

figure; imshow(bw);
figure; imshow(i);
figure; imshow(shadow);