function [sign, output] = embedSign(image, beta)

    dwtmode('per');
    [C, S] = wavedec2(image, 3, 'db9');

    % Get the A, H, V, D for third level
    A = appcoef2(C, S, 'db9', 3);

    rng(2000);  % Fix the random number generator to generate same random values
    [row, col] = size(A);
    sign = randi([0 1], row, col);

    % Embed signature into pixels
    for r = 1 : row
        for c = 1: col
            remainder = mod(A(r, c), beta);

            % If the random number is 1
            if (sign(r, c) == 1)
                if (remainder >= 0.25*beta)
                    A(r, c) = A(r, c) - remainder + 0.75*beta;
                else
                    A(r, c) = (A(r, c) - 0.25*beta) + mod((A(r, c) - 0.25*beta), beta) + 0.75*beta;
                end
            else
            % If the random number is 0
                if (r <= 0.75*beta)
                    A(r, c) = (A(r, c) - remainder) + 0.25*beta;
                else
                    A(r, c) = (A(r, c) + 0.5*beta) - mod((A(r, c) - 0.5*beta), beta) + 0.25*beta;
                end        
            end
        end
    end

    signedC = C;
%     signedC(row*col+1: 2*row*col) = H;
    signedC(1 : row*col) = A;
    output = waverec2(signedC, S, 'db9');
    output = uint8(output);
end