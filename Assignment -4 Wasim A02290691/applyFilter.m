function [filteredImage] = applyFilter(image, H)

% Apply fft and shift image
fImage = double(fftshift(fft2(image)));

% Apply filter
filtered = double(fImage) .* double(H);

% Inverse Shift and DFT
filtered = ifft2(ifftshift(filtered));

% The output is real part of the image
filteredImage = uint8(real(filtered));

end