%function [cleanImage] = adaptiveThreshold(image)
function []= adaptiveThreshold()

image1 = imread('text.gif');
image2 = imread('Text1.gif');

image3 = imread('text2.jpg');
image3 = rgb2gray(image3);

T = adaptthresh(image1,0.999,'ForegroundPolarity','bright');
bw = imbinarize(image1, T);
figure;imshow(bw);
T = adaptthresh(image2,0.999,'ForegroundPolarity','bright');
bw = imbinarize(image2, T);
figure;imshow(bw);
level = graythresh(image3);
T = im2bw(image3,level);
%T = adaptthresh(image3,0.999,'ForegroundPolarity','bright');
%bw = imbinarize(image3, T);
figure;imshow(T);
pause;
close all;

end
