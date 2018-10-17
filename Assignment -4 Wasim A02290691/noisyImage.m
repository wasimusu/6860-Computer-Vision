function [H, noisyImage] = noisyImage(image)
    % Filter parameter
    k = 0.0025;

    % Make noise filter
    [row, col] = size(image);
    H = zeros(row, col);
    cu = row/2;
    cv = col/2;
    
    % Compute Noise filter
    for u = 1 : row
        for v = 1 :col
            D = sqrt((u - cu)^2+ (v-cv)^2);
            H(u,v) = exp(-(k*(D^(5/3))));
        end
    end
    
    noisyImage = applyFilter(image, H);
end