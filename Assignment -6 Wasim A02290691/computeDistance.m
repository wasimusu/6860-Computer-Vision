function score = computeDistance(hist1, hist2, imageSize1, imageSize2)
    % Length of vector to loop over them
    len = length(hist1);    
    
    % Loop over histogram and compute distance
    score = 0;
    for i = 1 : len
        score = score + min(hist1(i)*imageSize1, hist2(i)*imageSize2)/(min(imageSize1, imageSize2));
    end
end