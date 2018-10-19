function [] = cosineNoise()

    image = imread('boy_noisy.gif');
    fImage = fftshift(fft2(image));

    % Compute the magnitude of the FFT
    imageM = abs(fImage);

    % Frequencies corresponding to four largest distinct magnitudes
    mag = flip(sort(unique(imageM(:))));
    mag = mag(1:5); % Highest five magnitude
    disp([mag(1), mag(5)])
    M = abs(imageM);
    pos = find(M>=mag(5)&M<mag(1));  % Ignore highest magnitude
    
    % Frequencies corresponding to large magnitude positions
    f = fImage(pos);
    fConj = conj(f);
    f = f(:);
    fConj = fConj(:);
    f = [f, fConj];
    f = f(:);
    
    for k = 1:length(f)
        pos = find(fImage == f(k));
        [row, col] = ind2sub(size(fImage), pos);
        
        % Assign the center the average of the surrounding eight points
        fImage(row, col) = 0;        
        roi = fImage(row-1: row+1, col-1: col+1);
        fImage(row, col) = sum(roi(:))/8;
    end

    output = uint8(real(ifft2(ifftshift(fImage))));
    figure;imshow(image); title('Input');
    figure;imshow(output);title('Output');    
end