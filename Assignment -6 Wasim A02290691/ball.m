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

for k = 1:12
    bw = imdilate(bw, str);
end

for k = 1:12
    bw = imerode(bw, str);
end

% find centroid and mark it
stats = regionprops(imcomplement(bw));
centroid = stats.Centroid;
x = centroid(1);
y = centroid(2);
markedBall = insertMarker(image, [x y]);

% Display intermediate results
figure;
subplot(2, 2, 1); imshow(markedBall); title('Marked image in ball');
subplot(2, 2, 2); imshow(h); title('H channel');
subplot(2, 2, 3); bar(imhist(h, 50)); title('Ball after morphological operations');
subplot(2, 2, 4); imshow(bw); title('Ball after morphological operations');
pause;

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

% Find shadow and mark shadow
stats = regionprops(shadow);
centroid = stats.Centroid;
x = centroid(1);
y = centroid(2);
markedShadow = insertMarker(image,[x y]);

figure;
subplot(2, 2, 1); imshow(markedBall); title('Marked shadow in image');
subplot(2, 2, 2); imshow(i); title('I channel');
subplot(2, 2, 3); bar(imhist(i, 50)); title('Hist to determine threshold levels');
subplot(2, 2, 4); imshow(shadow); title('Shadow after morphological operations');
