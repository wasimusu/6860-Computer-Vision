function [output] = embedSign(image, sign, beta)
    
    dwtmode('per');
    [C, S] = wavedec2(image, 3, 'db9');

    % Get the A, H, V, D for third level
    A3 = appcoef2(C, S, 'db9', 3);
    [H3, ~, ~] = detcoef2('all', C, S, 3);

    [row, col] = size(A3);

    % Embed signature into pixels
    for r = 1 : row
        for c = 1: col
            remainder = rem(H3(r, c), beta);

            % If the random number is 1
            if (sign(r, c) == 1)
                if (remainder >= 0.25*beta)
                    H3(r, c) = H3(r, c) - r + 0.75*beta;
                else
                    H3(r, c) = H3(r, c) - 0.25*beta + rem((H3(r, c) - 0.25*beta), beta) + 0.75*beta;
                end
            else
            % If the random number is 0
                if (r <= 0.75*beta)
                    H3(r, c) = H3(r, c) - remainder + 0.25*beta;
                else
                    H3(r, c) = (H3(r, c) + 0.5*beta) + rem((H3(r, c) - 0.5*beta), beta) + 0.25*beta;
                end        
            end
        end
    end

    signedC = C;
    signedC(row*col+1: 2*row*col) = H3;
    output = waverec2(signedC, S, 'db9');
    output = uint8(output);
end