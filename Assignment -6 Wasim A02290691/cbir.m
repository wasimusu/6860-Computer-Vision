hBin = 4;
sBin = 4;
vBin = 4;

% Read all the images
image1 = imread('elephant1.jpg');
image2 = imread('elephant2.jpg');
image3 = imread('horse1.jpg');
image4 = imread('horse2.jpg');

% Find histogram of all the images
hist1 = computeHist(image1, hBin, sBin, vBin);
hist2 = computeHist(image2, hBin, sBin, vBin);
hist3 = computeHist(image3, hBin, sBin, vBin);
hist4 = computeHist(image4, hBin, sBin, vBin);

score1 = computeDistance(hist1, hist2)
score2 = computeDistance(hist3, hist4)
score3 = computeDistance(hist1, hist3)
score4 = computeDistance(hist2, hist4)
score4 = computeDistance(hist2, hist3)

disp(["Matching score : ", score]);
disp(["Sum of hist1 : ", sum(hist1)]);
stem(hist1);