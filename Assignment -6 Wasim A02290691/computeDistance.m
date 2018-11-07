function score = computeDistance(hist1, hist2)

    len = length(hist1);
    score = zeros(1, len);

    for i = 1 : len
        score(i) = min(hist1(i), hist2(i));
    end
    
    score = sum(score);

end