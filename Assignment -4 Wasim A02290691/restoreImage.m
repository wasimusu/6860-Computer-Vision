function [F, filteredImage] = restoreImage(image, H)
    % Filter parameter
     g = 0.00001;

    % Make noise filter
    [row, col] = size(image);
    
    % Conveninet initialization of F
    F = zeros(row, col);
    % Compute Noise filter
    for u = 1 : row
        for v = 1 :col
            F(u,v) = (1/H(u,v))*(abs(H(u,v)^2)/(abs(H(u,v)^2)+g));
        end
    end
    filteredImage = applyFilter(image, F);
end
