% WASIM AKRAM KHAN -- Assignment 3
% A02290691

S = imread('sample.jpg');
[H, filtered_sample] = gaussianFilter(S);
figure;
subplot(1, 3, 1);imshow(S); title('Input image');
subplot(1, 3, 2);imshow(H); title('Gaussian Filter');
subplot(1, 3, 3);imshow(filtered_sample); title('Filtered image');
pause;
% -----  Finish Solving Problem I-1  -----%

S = imread('sample.jpg');
[H, filtered_sample] = butterworthFilter(S, 40,2);
figure;
subplot(1, 3, 1);imshow(S); title('Input image');
subplot(1, 3, 2);imshow(H); title('Butterworth Filter');
subplot(1, 3, 3);imshow(filtered_sample); title('Filtered image');
pause;
% -----  Finish Solving Problem I-2  -----%

city = imread('city.jpg');
[H, noisyCity] = noisyImage(city);
subplot(1, 3, 1);imshow(city); title('Input image');
subplot(1, 3, 2);imshow(H); title('Noise Filter');
subplot(1, 3, 3);imshow(noisyCity); title('Filtered image');
pause;
% -----Finish Solving Problem II-1 -----%

[filter, restored] = restoreImage(noisyCity, H);
figure;
subplot(1, 3, 1);imshow(noisyCity); title('Input image');
subplot(1, 3, 2);imshow(filter); title('Filter');
subplot(1, 3, 3);imshow(restored); title('Restored image');
pause;
% -----Finish Solving Problem II-2 -----%

% FFT, Magnitude and Phase of capitol
C = imread('capitol.jpg');
fC = fftshift(fft2(C));
CM = log(abs(fC));
CP = unwrap(angle(fC));

% FFT, Magnitude and Phase of sample
sample = imread('sample.jpg');
capitol = imread('capitol.jpg');

sampleF = fftshift(fft2(sample));
capitolF = fftshift(fft2(capitol));

AA = angle(sampleF);
BB = log(abs(sampleF));
CC = angle(capitolF);
DD = log(abs(capitolF));

[ AA, ~] = Scaling(AA, [0 255]);
[BB, ~] = Scaling(BB, [0 255]);
AA = uint8(AA);
BB = uint8(BB);


[CC, ~] = Scaling(CC, [0 255]);
[DD, ~] = Scaling(DD, [0 255]);
CC = uint8(CC);
DD = uint8(DD);

figure;
subplot(2, 2, 1); imshow(BB); title('Sample Magnitude');
subplot(2, 2, 2); imshow(AA); title('Sample Angle');
subplot(2, 2, 3); imshow(DD); title('Capitol Magnitude');
subplot(2, 2, 4); imshow(CC); title('Capitol Angle');
pause;
% -----Finish Solving Problem III-1 -----%

% FFT, Magnitude and Phase of capitol
capitol = imread('capitol.jpg');
capitolF = fftshift(fft2(capitol));
capM = abs(capitolF);
capP = (angle(capitolF));

% FFT, Magnitude and Phase of sample
sample = imread('sample.jpg');
sampleF = fftshift(fft2(sample));
sampleM = abs(sampleF);
sampleP = angle(sampleF);

% Restoring capital image with its' phase and magnitude of other image
restCap = sampleM.*exp(1i*capP);
restCap = uint8(real(ifft2(ifftshift(restCap))));

% Restoring sample image with its' phase and magnitude of other image
restSample = capM.*exp(1i*sampleP);
restSample = uint8(real(ifft2(ifftshift(restSample))));
figure;
subplot(1,2,1); imshow(restSample); title('restored sample');
subplot(1,2,2); imshow(restCap); title('restored cap');
pause;
% -----Finish Solving Problem III-2 -----%

image = imread('boy_noisy.gif');
Y = cosineNoise(image);
figure;
subplot(1,2,1); imshow(image); title('Input Image');
subplot(1,2,2); imshow(Y); title('Denoised Image');
pause;
% -----Finish Solving Problem IV -----%

image = imread('Lena.jpg');
% Maximum decomposition level
N = wmaxlev(size(image), 'db2');
% Decompose wavelet into C and Bookkeeping matrix S
[C,S] = wavedec2(image, N, 'db2');
output = uint8(waverec2(C, S, 'db2'));
if (image == output)
    disp('Perfect decomposition and reconstruction');
else
    disp('Imperfect decomposition and reconstruction');
end
% figure; imshow(output); title('Decomposition and reconstruction of Lena');
% pause;
% -----Finish Solving Problem V-1 ----- %

% Problem of three separate reconstruction
image = imread('Lena.jpg');

% First level decomposition
[A, H, V, D] = dwt2(im2double(image), 'db2');
% Set the 2*2 blocks of Approx coeff first level to their average
[r,c] = size(A);
newA = A;
for i = 1:2:r-1
    for j = 1:2:c-1
        newA(i:i+1,j:j+1) = mean(mean(A(i:i+1,j:j+1)));
    end
end
Y1 = idwt2(newA,H,V,D,'db2');

% Set the first level vertical details to 0
newV = V;
newV(:,:) = 0;
Y2 = idwt2(A,H,newV,D,'db2');

% Setting second level horizontal detail coefficients to 0
dwtmode('per');
[A2, H2, V2, D2] = dwt2(A, 'db2');
H2(:,:) = 0;
newA1 = idwt2(A2, H2, V2, D2,'db2');
Y3 = idwt2(newA1, H, V, D,'db2');

figure; imshow(Y1); title('Average approx coefficients (1st level since question does not state clearly the level');
figure; imshow(Y2); title('Zero vertical detail for first level');
figure; imshow(Y3); title('Second level horizontal detail set to 0');
pause;
% -----Finish Solving Problem V-2 -----%

% Read lena image and add gaussian noise of 0 mean and 0.01 variance
image = imread('Lena.jpg');
imageN = imnoise(image, 'gaussian', 0, 0.01);

Y = gaussianWN(imageN);
figure; 
subplot(1,2,1), imshow(imageN); title('Input Noisy Image');
subplot(1,2,2), imshow(Y); title('Denoised Image');
pause;
pause;
% -----Finish Solving Problem VI -----%
close all
