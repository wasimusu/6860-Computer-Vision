image = imread('lena.jpg');

rng(1000);  % Fix the random number generator to generate same random values
sign = randi([0 1], row, col);

% Watermark images
output1 = embedSign(image, sign, 30);
output2 = embedSign(image, sign, 90);

% Display the results
subplot(1, 3, 1); imshow(image); title('Original Image');
subplot(1, 3, 2); imshow(output1); title('Beta 30');
subplot(1, 3, 3); imshow(output2); title('Beta 90');

% recover the watermark
recovered_sign1 = extractSign(output1, 30);
recovered_sign2 = extractSign(output2, 90);

% count the similiarity of recovered watermark with existing watermark
r1 = (sign == recovered_sign1);
r2 = (sign == recovered_sign2);
disp(sum(r1(:))/(row*col));
disp(sum(r2(:))/(row*col));
