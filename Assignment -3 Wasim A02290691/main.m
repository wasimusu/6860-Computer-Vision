% WASIM AKRAM KHAN -- Assignment 3
% A02290691
image = imread('circuit.jpg');

% % standard and weighted masks
% weightedMask = [1,2,1;2,4,2;1,2,1]/16;
% standardMask = ones(5);
% standardMask = standardMask / sum(sum(standardMask));
% 
% filteredImage1 = AverageFiltering(image, weightedMask);
% filteredImage2 = AverageFiltering(image, standardMask);
% subplot(1,3,1); imshow(image); title('Original Image');
% subplot(1,3,2); imshow(filteredImage1); title('Applied Weighted Mask');
% subplot(1,3,3); imshow(filteredImage2); title('Applied Standard Mask');
% %pause;
% disp('Weighted Mask preserves edge information, standard mask does not');
% disp("That's why I believe standard masks are used less compared to weighted masks like Gaussian");
% % % -----Finish Solving Problem I-1 -----%
% 
% 
% circuit = imread('circuit.jpg');
% weightedMask = [1,2,1;2,4,2;1,2,1];
% standardMask = ones(5);
% filteredImage1 = MedianFiltering(circuit, weightedMask);
% filteredImage2 = MedianFiltering(circuit, standardMask);
% subplot(1,3,1); imshow(circuit); title('Original Image');
% subplot(1,3,2); imshow(filteredImage1); title('Median Filter - Weighted Mask');
% subplot(1,3,3); imshow(filteredImage2); title('Median Filter - Standard Mask');
% %pause;
% % % -----Finish Solving Problem I-2 -----%

image = imread('rice.jpg');
[~, threshold] = edge(image, 'sobel');
edgeImage = edge(image, 'sobel', threshold);
imshow(edgeImage);
disp("I determined the threhosld by computing the histogram of the image and selecting the value which clearly divides the histogram into two parts - black and white");
disp("This is also known as Ostu's algorithm which is used to find thresholds in image");
pause
% % -----Finish Solving Problem II-1 -----%

close all;