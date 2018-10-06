% WASIM AKRAM KHAN -- Assignment 3
% A02290691
image = imread('circuit.jpg');

% standard and weighted masks
weightedMask = [1,2,1;2,4,2;1,2,1]/16;
standardMask = ones(5);
standardMask = standardMask / sum(sum(standardMask));

avgFiltered1 = AverageFiltering(image, weightedMask);
avgFiltered2 = AverageFiltering(image, standardMask);

subplot(1,3,1); imshow(image); title('Average Filter Input');
subplot(1,3,2); imshow(avgFiltered1); title('Weighted Mask');
subplot(1,3,3); imshow(avgFiltered2); title('Standard Mask');
pause;
disp('Weighted Mask preserves edge information, standard mask does not');
disp("That's why I believe standard masks are used less compared to weighted masks like Gaussian");
% % -----Finish Solving Problem I-1 -----%


circuit = imread('circuit.jpg');
weightedMask = [1,2,1;2,4,2;1,2,1];
standardMask = ones(5);
medFilter1 = MedianFiltering(circuit, weightedMask);
medFilter2 = MedianFiltering(circuit, standardMask);
figure;
subplot(1,3,1); imshow(circuit); title('Median Filter Input');
subplot(1,3,2); imshow(medFilter1); title('Weighted Mask');
subplot(1,3,3); imshow(medFilter2); title('Standard Mask');
pause;
% % -----Finish Solving Problem I-2 -----%

image = imread('moon.jpg');
mask = [1 1 1; 1 -8 1; 1 1 1];
%mask = fspecial('laplacian');
edge = imfilter(image, mask);
figure;imshow(edge);
[edgeScaled, key] = Scaling(edge, [0 255]);
%edgeScaled = imadjust(edge, [0 1], [0 1]);
sharpImage = image - uint8(edgeScaled);
figure;
subplot(2,2,1); imshow(image);title('original image');
subplot(2,2,2); imshow(edge); title('Edge');
subplot(2,2,3); imshow(edgeScaled); title('Scaled edge');
subplot(2,2,4); imshow(sharpImage);title('Sharp Image');
pause;
% % -----Finish Solving Problem I-3 -----%

image = imread('rice.jpg');
% [~, threshold] = edge(image, 'sobel');
% edgeImage = edge(image, 'sobel', threshold);
threshold = 0.5;
edgeImage = sobelEdge(image, threshold);
subplot(1,2,2); imshow(edgeImage); title('Sobel edge');
subplot(1,2,1); imshow(image);title('original image');
disp("I treated this problem as a thresholding problem.");
disp("I determined the threhosld by computing the histogram of the image and selecting the value which clearly divides the histogram into two parts - black and white");
disp("Still I think it takes a lot of hit and trials to find sharp edges");
pause
% %-----Finish Solving Problem II-1 -----%

image = imread('rice.jpg');
[sobel,histGrad] = CalEdgeHist(image, 18);
figure;
subplot(1,3,1); imshow(image); title('Rice');
subplot(1,3,2); imshow(sobel);title('Edge');
subplot(1,3,3);bar(histGrad); title('Histgoram of gradients');
pause;
% %-----Finish Solving Problem II-2 -----%

image = imread('text.gif');
cleanImage = adaptiveThreshold(image, 100);
subplot(1,2,1); imshow(image);title('Original 1');
subplot(1,2,2); imshow(cleanImage);title('Cleaned 1');
pause;

image = imread('text1.gif');
cleanImage = adaptiveThreshold(image, 100);
figure;
subplot(1,2,1); imshow(image);title('Original 2');
subplot(1,2,2); imshow(cleanImage);title('Cleaned 2');
pause;

image = imread('text2.jpg');
image = rgb2gray(image);
cleanImage = adaptiveThreshold(image, 100);
figure;
subplot(1,2,1); imshow(image);title('Original 3');
subplot(1,2,2); imshow(cleanImage);title('Cleaned 3');
pause;

disp('I believe cleaning image with text is a trade-off problem with trade-off between information loss and clean image.');
disp('Either you get clean images with information loss or your get less clean images with less information loss');
disp('I used adaptive thresholding dividing images into variable size grid (m*n) and threshold on each of the grid');
% %-----Finish Solving Problem III -----%

close all;