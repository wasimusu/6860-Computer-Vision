function [] = cosineNoise()

image = imread('boy_noisy.gif');
fImage = fftshift(fft2(image));

% Compute the magnitude of the FFT
imageM = abs(fImage);

% Frequencies corresponding to four largest distinct magnitudes
largeMag = sort(imageM);
largeMag = largeMag(1:4);

% Positions
pos = zeros(1, 8);
pos(1:2) = find(imageM==largeMag(1));
pos(3:4) = find(imageM==largeMag(2));
pos(5:6) = find(imageM==largeMag(3));
pos(7:8) = find(imageM==largeMag(4));
pos = unique(pos);
disp(pos);

m = (abs(fImage(pos)));
p =(angle(fImage(pos)));
f = m .* exp(1i*p);
disp(fImage(pos));
disp(f);

i = 10;
roi = imageM;
box = roi(i-1,i-1) + roi(i, i-1) + roi(i, i+1) + roi(i-1,i) + roi(i, i) + roi(i, i) + roi(i-1,i+1) + roi(i, i+1) + roi(i, i+1);
        
end