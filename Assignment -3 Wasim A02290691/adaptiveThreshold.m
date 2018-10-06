%function [cleanImage] = adaptiveThreshold(image)
function []= adaptiveThreshold()

% image1 = imread('text.gif');
% image2 = imread('Text1.gif');
% 
image3 = imread('text2.jpg');
image3 = rgb2gray(image3);

% image1 = histeq(image1);
% T = adaptthresh(image1,0.999,'ForegroundPolarity','bright');
% bw = imbinarize(image1, T);
% figure;imshow(bw);
% image2 = histeq(image2);
% T = adaptthresh(image2,0.999,'ForegroundPolarity','bright');
% bw = imbinarize(image2, T);
% figure;imshow(bw);

start = 301;
step = 100;
image = image3(start:start+step,100:300);
T = adaptthresh(image,0.999,'ForegroundPolarity','bright');
bw = imbinarize(image, T);
figure;imshow(bw);

pause;
close all;

end
