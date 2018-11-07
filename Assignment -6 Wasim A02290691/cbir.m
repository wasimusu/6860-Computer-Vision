% No of bins for each channel
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

% contains all histogram
hist = [hist1; hist2; hist3; hist4];

% Compute the adjacency matrix
scores = zeros(4, 4);
for i = 1:4
    h1 = hist(i, :);
    for j = 1:4
        h2 = hist(j, :);
        score = computeDistance(h1, h2);
        scores(i, j) = score;
    end
end

disp(scores);
