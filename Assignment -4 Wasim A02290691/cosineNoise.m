function [] = cosineNoise()

    image = imread('boy_noisy.gif');
    fImage = fftshift(fft2(image));

    % Compute the magnitude of the FFT
    imageM = abs(fImage);

    % Frequencies corresponding to four largest distinct magnitudes
    mag = flip(sort(imageM(:)));
    mag = mag(1:5); % Highest five magnitude
    M = abs(imageM);
    pos = find(M>=mag(4)&M<mag(1));  % Ignore highest magnitude
    % Frequencies corresponding to large magnitude positions
    f = fImage(pos);
    fConj = conj(f);

    % Position of conjugate elements
    posC = zeros(1,length(fConj));
    for i = 1 : length(pos)
        posC(i) = find(fImage == fConj(i));
    end    
    % Combine both original and conjugate positions
    pos = [pos posC(:)];
    pos = pos(:);

    [r, ~] = size(image);    
    for k = 1:length(pos)
        j = uint16(pos(k)/r);
        i = rem(pos(k),r);
        disp([k,i,j]);
        fImage(i, j) = 0;        
        roi = fImage(i-1:i+1, j-1:j+1);
        m = mean(mean(roi));
        fImage(i, j) = m;
    end
    
    output = uint8(real(ifft2(ifftshift(fImage))));
    figure;imshow(image); title('Input');
    figure;imshow(output);title('Output');
    
end