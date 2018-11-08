function [sign] = extractSign(image, beta)

    dwtmode('per');
    [C, S] = wavedec2(image, 3, 'db9');

    % Get the A, H, V, D for third level
    A = appcoef2(C, S, 'db9', 3);
    [row, col] = size(A);
    
    % Extract signature from pixels
    sign = zeros(size(A));    
    for r = 1 : row
        for c = 1: col
            remainder = mod(A(r, c), beta);
            if (remainder > beta/2)
                sign(r, c) = 1;
            end
            % Sign is 0 by default
        end
    end

end