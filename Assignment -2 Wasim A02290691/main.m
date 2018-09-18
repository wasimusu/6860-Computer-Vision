image = imread('pepper.jpg');
gray = rgb2gray(image);

range = [0,255];
[selfScaledFood, params] = Scaling(gray, range);
imshow(selfScaledFood); title('self scaled food');

%-----Finish Solving Problem 1 -----%

matScaledFood = imadjust(image);
figure;
subplot(1,2,1); imshow(matScaledFood); title('Adjusted using matlab');
subplot(1,2,2); imshow(selfScaledFood); title('Adjusted using self defined function');
%-----Finish Solving Problem 2 -----%

figure;
CalHist(selfScaledFood, true);
CalHist(selfScaledFood, false);
CalHist(matScaledFood, true);
CalHist(matScaledFood, false);
%-----Finish Solving Problem 3 -----%

matEnhancedImage = histeq(gray);
myEnhancedImage = HistEqualization(gray);
figure;
subplot(1,2,1); imshow(matEnhancedImage); title('Histogram Equalization using matlab');
subplot(1,2,2); imshow(myEnhancedImage); title('Histogram Equalization using self defined function');

disp("The problems are easier, Matlab is not. Matlab someday thought to hall proprietary things like starting index from 1 or using % as comments. It does not really want to go mix in the crowd.");
%-----Finish Solving Problem 5 -----%
