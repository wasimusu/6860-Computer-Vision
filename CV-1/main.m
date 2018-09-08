% WASIM AKRAM KHAN -- Assignment 1

A = imread('peppers.bmp');
figure;
imshow(A);
title('RGB Original Image');
%---Finish Solving Problem 1---%
pause;

% convert rgb image to gray
B = rgb2gray(A);
TB = B'; % transpose the image

% Left right flip
FB = fliplr(B);

% Change lower half and upper half of the image
HB = B;
[row, col] = size(B);
HB(1:(row/2), 1:col) = B(row/2+1:row, 1:col);
HB(row/2+1:row, 1:col) = B(1:row/2, 1:col);
figure;
subplot(2,2,1); imshow(B); title('B');
subplot(2,2,2); imshow(TB); title('TB');
subplot(2,2,3); imshow(HB); title('HB');
subplot(2,2,4); imshow(FB); title('FB');
% ---Finish Solving Problem 2 ---%
pause;

% Compute stats using matlab functions
maxM = max(B(:));
minM = min(B(:));
meanM = mean(B(:));
medianM = median(B(:));

% Stats computed using self defined function
[maxF, minF, meanF, medianF] = FindInfo(B);

% Checking if both stats are same. 
if maxF == maxM && minF == minM && meanF == meanM && medianF == medianM
    disp('The code passed the tests');
    disp([maxM, maxF]);
    disp([minM, minF]);
    disp([meanM, meanF]);
    disp([medianM, medianF]);    
else
    disp('Your computation is wrong.');
end
% ---Finish Solving Problem 3 ---%
pause

% Normalize image B
C = double(B);
C = C / double(maxM);
imshow(C); % Normalized image does not look any different than the original
title('Normalized Grayscale Image');
figure  % Displays a different figure rather than replacing the previous figure

% Process first and third quadrants
D = C;
[row, col] = size(D);
D(1:row, 1*(col/4)+1:2*(col/4)) =  D(1:row, 1*(col/4)+1:2*(col/4)) .^ 1.25;
D(1:row, 3*(col/4)+1:4*(col/4)) = D(1:row, 3*(col/4)+1:4*(col/4)) .^0.75;
figure;
imshow(D);
title('Processed Grayscale Image');
imwrite(D, 'Wasim_D.jpg');
% ---Finish Solving Problem 4 ---%
pause;

% Perform Thresholding
% First Method
bw1 = C;
threshold = 0.3;
bw1(bw1>threshold)=1;
bw1(bw1<=threshold)=0;

% Second Method
bw2 = C;
pos1 = find(bw2>threshold);
pos2 = find(bw2<=threshold);
bw2(pos1) = 1;
bw2(pos2) = 0;

% Using matlab's function to binarize image
bw3 = imbinarize(C,0.3);

% Comparision with matlab's function
if bw1 == bw3 & bw2 == bw3
    disp('Both of my methods worked');
elseif bw1 == bw3 & bw2 ~= bw3
    disp('My method 1 worked but not my method 2');    
elseif bw1 ~= bw3 & bw2 == bw3
    disp('My method 2 worked but not my method 1');
else 
    disp('Both of my methods did not work');
end

% Displaying the results
figure;
subplot(1,3,1); imshow(bw1); title('bw1');
subplot(1,3,3);imshow(bw3); title('bw3');
subplot(1,3,2);imshow(bw2); title('bw2');
% ---Finish Solving Problem 5 ---%
pause;

% Call the BlurImage function on different images and plot them
BA = BlurImage(A);
BB = BlurImage(B);
subplot(2,2,1); imshow(A); title('Original RGB Image');
subplot(2,2,2); imshow(B); title('Original Grayscale Image');
subplot(2,2,3); imshow(BA); title('Blurred RGB Image');
subplot(2,2,4); imshow(BB); title('Blurred Grayscale Image');
% ---Finish Solving Problem 6 ---%
pause;

% close all the figures at the end
close all;
clear;
% ---Finish Solving Problem 7 ---%
