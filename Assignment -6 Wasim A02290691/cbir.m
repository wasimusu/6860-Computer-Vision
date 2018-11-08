% No of bins for each channel
hBin = 4;
sBin = 4;
vBin = 4;

% Read all the images
image1 = imread('elephant1.jpg');
image2 = imread('elephant2.jpg');
image3 = imread('horse1.jpg');
image4 = imread('horse2.jpg');

% Get all the four images together
images = cat(4, image1, image2, image3, image4);

% Find histogram of all the images
hist1 = CalNormalizedHSVHist(image1, hBin, sBin, vBin);
hist2 = CalNormalizedHSVHist(image2, hBin, sBin, vBin);
hist3 = CalNormalizedHSVHist(image3, hBin, sBin, vBin);
hist4 = CalNormalizedHSVHist(image4, hBin, sBin, vBin);

% Plot the histograms
subplot(2, 2, 1); bar(hist1); title('Hist Elephant1');
subplot(2, 2, 2); bar(hist2); title('Hist Elephant2');
subplot(2, 2, 3); bar(hist3); title('Hist Horse1');
subplot(2, 2, 4); bar(hist4); title('Hist Horse2');

% contains all histogram
hist = [hist1; hist2; hist3; hist4];

% Compute the adjacency matrix
scores = zeros(4, 4);
for i = 1:4
    h1 = hist(i, :);
    ranks = [ 0 0 0 0];
    for j = 1:4
        h2 = hist(j, :);
        score = computeDistance(h1, h2);
        scores(i, j) = score;
        ranks(j) = score;
    end

    % Display ranks
    figure;
    sorted_rank = sort(ranks, 'descend');
    for r = 1:4
        ranked = sorted_rank(r);
        index = find(ranks == ranked);
        subplot(2, 2, r); imshow(images(:, :, :, index)); title(r);
    end
    pause;
end

disp(scores);