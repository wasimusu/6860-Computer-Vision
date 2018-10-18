function [nH, nV, nD] = threshWavelet(A, H, V,D)
    
    sigma = median(median([abs(H), abs(V), abs(D)])) / 0.6745;
    [r,c] = size(A);
    M = 3*r*c;
    thresh = sigma * sqrt(2*log(M));

    nH = applyThresh(H, thresh);
    nV = applyThresh(V, thresh);
    nD = applyThresh(D, thresh);

end

function newF = applyThresh(F, thresh)
    % Indices for thresholding
    minusI = find(F>=thresh);
    plusI = find(F<=-thresh);
    zeroI = find(abs(F)<thresh);
    
    disp([length(minusI), length(plusI), length(zeroI)]);
    % Apply thresholding
    newF = F;
    newF(zeroI) = 0;
    newF(plusI) = F(plusI) + thresh;
    newF(minusI) = F(minusI) - thresh;
end