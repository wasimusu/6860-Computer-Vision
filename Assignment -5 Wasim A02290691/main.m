% WASIM AKRAM KHAN -- Assignment 3
% A02290691

image = imread('City.jpg');
se = strel('square', 3);
imA = imdilate(image, se);
imB = imerode(image, se);
g = imA - imB;
figure; imshow(g); title('Dilated image minus eroded image');
pause;
% -----  Finish Solving Problem I-1  -----%

% Read wirebond
image = imread('SmallSquares.tif');
imageC = imcomplement(image);

se = [ 1 0 0; 1 0 0; 1 1 1];
seC = [0 1 0; 0 1 1; 0 0 0];

d1 = imerode(image, seC);
d2 = imerode(imageC, se);

corners = d1 & d2;
disp(["Number of corners : ", sum(corners(:))]);

figure; imshow(corners); title('Corners')
pause;
% -----  Finish Solving Problem I-2  -----%

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
% -----  Finish Solving Problem I-3  -----%

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
% -----  Finish Solving Problem I-4  -----%

% Read wirebond
image = imread('Dowels.tif');

% Erode and dilate or vice versa using varied size of square strel to get desired images
se1 = strel('disk', 5);
% Open-close
d1 = imopen(image, se1);
d1 = imclose(d1, se1);
% Close-Open
d2 = imclose(d1, se1);
d2 = imopen(d2, se1);

figure; 
subplot(1, 3, 1); imshow(image); title('Input Image');
subplot(1, 3, 2); imshow(d1); title('Single Open Close Op');
subplot(1, 3, 3); imshow(d1); title('Single Close open Op');
pause;

d1 = image;
d2 = image;
for i = 2:5
    se = strel('disk', i);
    % Open Close
    d1 = imopen(d1, se);
    d1 = imclose(d1, se);
    % Close open
    d2 = imclose(d2, se);
    d2 = imopen(d2, se);
end

figure; 
subplot(1, 3, 1); imshow(image); title('Input Image');
subplot(1, 3, 2); imshow(d1); title('Series Open Close Op');
subplot(1, 3, 3); imshow(d1); title('Series Close Open Op');
pause;
% -----  Finish Solving Problem I-5  -----%

noBorder = false;
removeOverlap = false;
image = imread('Ball.tif');
[output, num_objects] = FindComponentLabel(image, removeOverlap, noBorder);
disp("Total number of connected particles : " + num_objects);
figure; imshow(output); title('Connected components - Self defined');
pause;
% -----  Finish Solving Problem II-1  -----%


% if appropriate result is not see in figure try running these probelms
% individually
% Finding connected components including those on border also
CC = bwconncomp(image);
labels = labelmatrix(CC);
num_objects = CC.NumObjects;
labels = labels * (255 / num_objects);
labels = uint8(labels);
disp("Total number of connected particles : " + num_objects);
figure; 
subplot(1, 2, 1); imshow(labels); title('Matlab');
subplot(1, 2, 2); imshow(output); title('Self Defined');
pause;
% -----  Finish Solving Problem II-2  -----%

noBorder = true;
removeOverlap = false;
[output, num_objects] = FindComponentLabel(image, removeOverlap, noBorder);
disp("Total number of connected particles : " + num_objects);
figure; imshow(output); title('Connected components excluding those on borders');
pause;
% -----  Finish Solving Problem II-3  -----%

% Finding connected components excluding those on border also
wbImage = imclearborder(image);
CC = bwconncomp(wbImage);
labels = labelmatrix(CC);
num_objects = CC.NumObjects;
labels = labels * (255 / num_objects);
labels = uint8(labels);
disp("Total number of connected particles : " + num_objects);
figure; 
subplot(1, 2, 1); imshow(labels); title('Matlab');
subplot(1, 2, 2); imshow(output); title('Self Defined');
pause;
% -----  Finish Solving Problem II-4  -----%

noBorder = true;
removeOverlap = true;
[output, num_objects] = FindComponentLabel(image, removeOverlap, noBorder);
disp("Total number of connected particles : " + num_objects);
figure; imshow(output); title('Nonoverlapping connected components');
pause;
% -----  Finish Solving Problem II-5  -----%

close all