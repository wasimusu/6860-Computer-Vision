function score = computeDistance(hist1, hist2)
    % Length of vector to loop over them
    len = length(hist1);    
    
    % Loop over histogram and compute distance
    score = 0;
    for i = 1 : len
        score = score + min(hist1(i), hist2(i));
    end
end