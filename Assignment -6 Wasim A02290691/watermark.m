image = imread('lena.jpg');

% Watermark images
[sign1, output1] = embedSign(image, 30);
[sign2, output2] = embedSign(image, 90);

% Display the results
subplot(1, 3, 1); imshow(image); title('Original Image');
subplot(1, 3, 2); imshow(output1); title('Beta 30');
subplot(1, 3, 3); imshow(output2); title('Beta 90');

% recover the watermark
recovered_sign1 = extractSign(output1, 30);
recovered_sign2 = extractSign(output2, 90);

% count the similiarity of recovered watermark with existing watermark
r1 = (sign1 == recovered_sign1);
r2 = (sign2 == recovered_sign2);

% Compute the recovered bits percentage
[row, col] = size(sign1);
disp(["Recovered : ", 100*sum(r1(:))/(row*col)]);
disp(["Recovered : ", 100*sum(r2(:))/(row*col)]);

% Differences between watermarked and normal images
diff1 = image - output1;
diff2 = output2 - image;
diff1 = Scaling(diff1, [0 255]);
diff2 = Scaling(diff2, [0 255]);

figure;
subplot(1, 3, 1); imshow(image); title('Original Image'); 
subplot(1, 3, 2); imshow(output1); title('Watermark beta 30');
subplot(1, 3, 3); imshow(uint8(diff1)); title('Difference Beta 30');

figure;
subplot(1, 3, 1); imshow(image); title('Original Image'); 
subplot(1, 3, 2); imshow(output2); title('Watermark beta 90');
subplot(1, 3, 3); imshow(uint8(diff2)); title('Difference Beta 90');