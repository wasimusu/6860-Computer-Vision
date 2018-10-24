% WASIM AKRAM KHAN -- Assignment 3
% A02290691

image = imread('City.jpg');
se = strel('square', 3);
imA = imdilate(image, se);
imB = imerode(image, se);
g = imA - imB;
figure; imshow(g); title('Dilated image minus eroded image');
pause;
% -----  Finish Solving Problem 1  -----%

% Read wirebond
image = imread('Wirebond.tif');

% Erode using varied size of square strel to get desired images
se1 = strel('square', 14);
d1 = imerode(image, se1);

se2 = strel('square', 6);
d2 = imerode(image, se2);

se3 = strel('square', 39);
d3 = imerode(image, se3);

figure; 
subplot(2,2,1); imshow(image); title('Input Image');
subplot(2,2,2); imshow(d1); title('Desired Image 1');
subplot(2,2,3); imshow(d2); title('Desired Image 2');
subplot(2,2,4); imshow(d3); title('Desired Image 3');
pause;
% -----  Finish Solving Problem 3  -----%

% Read Shapes
image = imread('Shapes.tif');

% Erode and dilate or vice versa using varied size of square strel to get desired images
se1 = strel('square', 20);
d1 = imerode(image, se1);
d11 = imdilate(d1, se1);

se2 = strel('square', 20);
d2 = imdilate(image, se2);
d2 = imerode(d2, se2);

se2 = strel('square', 20);
d3 = imerode(d2, se2);
d3 = imdilate(d3, se2);

figure; 
subplot(2,2,1); imshow(image); title('Input Image');
subplot(2,2,2); imshow(d11); title('Desired Image 1');
subplot(2,2,3); imshow(d2); title('Desired Image 2');
subplot(2,2,4); imshow(d3); title('Desired Image 3');
pause;
% -----  Finish Solving Problem 4  -----%

close all
