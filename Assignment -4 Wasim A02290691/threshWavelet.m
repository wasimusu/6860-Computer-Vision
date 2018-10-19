function [nH, nV, nD] = threshWavelet(H, V,D)
    
    % Compute sigma and threshold
    matrix = abs([H, V, D]);
    med = median(matrix(:));
    disp(med);
    sigma = sqrt(med / 0.6745);
    [r,c] = size(H);    
    disp(size(H));
    M = 3*r*c;
    
    thresh = sigma * sqrt(2*log(M));
    
    disp(thresh);
    
    % Apply threshold
    nH = applyThresh(H, thresh);
    nV = applyThresh(V, thresh);
    nD = applyThresh(D, thresh);

end

function newF = applyThresh(F, thresh)
    % Indices for thresholding
    minusI = find(F>=thresh);
    plusI = find(F<=-1*thresh);
    zeroI = find(abs(F)<thresh);

    % Apply thresholding
    newF = F;
    newF(zeroI) = 0;
    newF(plusI) = F(plusI) + thresh;
    newF(minusI) = F(minusI) - thresh;
end