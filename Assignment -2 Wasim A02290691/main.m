image = imread('food.jpg');

range = [0,255];
[scaledFood, params] = Scaling(image, range);
imshow(scaledFood); title('self scaled food');
pause;
% -----Finish Solving Problem 1 -----%

oldMin = double(min(min(image))/255);
oldMax = double(max(max(image))/255);
matScaledFood = imadjust(image, [oldMin, oldMax],[0, 1]);
figure;
subplot(1,2,1); imshow(matScaledFood); title('Using matlab');
subplot(1,2,2); imshow(scaledFood); title('Using self-defined function');
pause;
% -----Finish Solving Problem 2 -----%

figure;
hist1 = CalHist(scaledFood, false);
hist1n = CalHist(scaledFood, true);
hist2 = CalHist(matScaledFood, false);
hist2n = CalHist(matScaledFood, true);
figure;
subplot(2,2,1); plot(hist1); title('Hist ScaledFood');
subplot(2,2,2); plot(hist1n); title('Hist ScaledFood Norm');
subplot(2,2,3); plot(hist2); title('Hist MatScaled');
subplot(2,2,4); plot(hist2n); title('Hist MatScaled Norm');
pause;
% -----Finish Solving Problem 3 -----%

M = 1000;

tic
equalizedFood = HistEqualization(image);
toc;
disp("Using self defined function for computing hist eq " + toc);
% -----Finish Solving Problem 4 -----%

matEnhancedImage = histeq(image);
disp("Using matlab's function for computing hist eq " + m2*M);

figure;
subplot(1,2,1); imshow(matEnhancedImage); title('Histogram Equalization using matlab');
subplot(1,2,2); imshow(equalizedFood); title('Histogram Equalization using self defined function');
pause;
% -----Finish Solving Problem 5 -----%

close all;