% WASIM AKRAM KHAN -- Assignment 2
% A02290691
image = imread('food.jpg');

range = [0,255];
[scaledFood, params] = Scaling(image, range);
imshow(scaledFood); title('self scaled food');
figure; plot(params); title('Scaling Function : Displaying Slope'); xlabel('X'); ylabel('Y');
% The plot basically shows the scaled value for all the unique elements in
% the image. X and Y do not necessarily correspond in values.
pause;
% -----Finish Solving Problem 1 -----%

oldMin = double(min(min(image)))/255;
oldMax = double(max(max(image)))/255;
matScaledFood = imadjust(image, [oldMin, oldMax], [0.0, 1.0]);
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
subplot(2,2,3); plot(hist1); title('Hist ScaledFood');
subplot(2,2,1); plot(hist1n); title('Hist ScaledFood Norm');
subplot(2,2,4); plot(hist2); title('Hist MatScaled');
subplot(2,2,2); plot(hist2n); title('Hist MatScaled Norm');
pause;
% -----Finish Solving Problem 3 -----%

tic
[equalizedFood, t1] = HistEqualization(image);
toc;
disp("Using self defined function for computing hist eq " + toc);
% ----- Finish Solving Problem 4 -----%

tic;
[matEnhancedImage, t2] = histeq(image);
toc;
disp("Using matlab's function for computing hist eq " + toc);

figure;
subplot(1,2,1); imshow(matEnhancedImage); title('Equalization using matlab');
subplot(1,2,2); imshow(equalizedFood); title('Self defined function');
pause;

figure;
subplot(1,2,1); plot(t1); title('Equalization using matlab');
xlabel('Input Intensity'); ylabel('Output Intensity');
subplot(1,2,2); plot(t2*255); title('Equalization using self defined function');
xlabel('Input Intensity'); ylabel('Output Intensity');
pause;

disp('The Histogram equalization in Problem 4 and 5 return almost similar function');
disp('It is really annoying that Matlab has to be leared from Scratch regardless of whether you have programming experience or not. I really struggled with type cast conversions. Timing methods was a new thing for me. I also learnt that Matlab does a slight different implementation of imadjust, hist computation and histogram equalization because of which my method ');
% -----Finish Solving Problem 5 -----%

close all;