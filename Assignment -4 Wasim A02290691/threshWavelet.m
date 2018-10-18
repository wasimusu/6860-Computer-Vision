function newA = threshWavelet(A, H, V,D)
    
    sigma = median(median([H,V,D])) / 0.6745;
    [r,c] = size(A);
    M = 3*r*c;
    thresh = sigma * sqrt(2*log(M));
    
    % Indices for thresholding
    greaterI = find(A>=thresh);
    lessI = find(A<=thresh);
    zeroI = A==0;

    % Apply thresholding
    newA = A;
    newA(zeroI) = 0;
    newA(lessI) = A(lessI) - thresh;
    newA(greaterI) = A(greaterI) + thresh;
end