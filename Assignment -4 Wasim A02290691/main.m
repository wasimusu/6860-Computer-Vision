% WASIM AKRAM KHAN -- Assignment 3
% A02290691
sample = imread('sample.jpg');
[H, filtered_sample] = butterworthFilter(sample, 40,2);
figure;
subplot(1, 3, 1);imshow(sample); title('Input image');
subplot(1, 3, 2);imshow(H); title('Filter');
subplot(1, 3, 3);imshow(filtered_sample); title('Filtered image');
pause;
% % -----Finish Solving Problem I-1 -----%

sample = imread('sample.jpg');
[H, filtered_sample] = gaussianFilter(sample);
figure;
subplot(1, 3, 1);imshow(sample); title('Input image');
subplot(1, 3, 2);imshow(H); title('Gaussian Filter');
subplot(1, 3, 3);imshow(filtered_sample); title('Filtered image');
pause;
% -----Finish Solving Problem I-2 -----%

city = imread('city.jpg');
[H, noisyCity] = noisyImage(city);
subplot(1, 3, 1);imshow(city); title('Input image');
subplot(1, 3, 2);imshow(H); title('Gaussian Filter');
subplot(1, 3, 3);imshow(noisyCity); title('Filtered image');
pause;
% % -----Finish Solving Problem II-1 -----%

[filter, restored] = restoreImage(noisyCity, H);
figure;
subplot(1, 3, 1);imshow(noisyCity); title('Input image');
subplot(1, 3, 2);imshow(filter); title('Filter');
subplot(1, 3, 3);imshow(restored); title('Restored image');
pause;
% % -----Finish Solving Problem II-2 -----%

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

% % A log needs to be applied before scaling
% dispCapM = log(capM);
% dispCapP = log(capP);
% % [capM, ~] = Scaling(capM, [0 255]);
% % [capP, ~] = Scaling(capP, [0 255]);
% figure;
% PC = Scaling(dispCapP, [0 255]);
% imshow(uint8(PC));title('Phase Cap');
% % -----Finish Solving Problem III-1 -----%

% Restoring capital image with its' phase and magnitude of other image
restCap = sampleM.*exp(1i*capP);
restCap = uint8(real(ifft2(ifftshift(restCap))));
figure; imshow(restCap); title('restored cap');

% Restoring sample image with its' phase and magnitude of other image
restSample = capM.*exp(1i*sampleP);
restSample = uint8(real(ifft2(ifftshift(restSample))));
figure; imshow(restSample); title('restored sample');
% % -----Finish Solving Problem III-2 -----%

image = imread('Lena.jpg');
% Maximum decomposition level
N = wmaxlev(size(image), 'db2');
% Decompose wavelet into C and Bookkeeping matrix S
[C,S] = wavedec2(image, N, 'db2');
output = uint8(waverec2(C, S, 'db2'));
figure; imshow(output); title('Decomposition and reconstruction of Lena');
if (image == output)
    disp('Perfect decomposition and reconstruction');
else
    disp('Imperfect decomposition and reconstruction');
end
pause;
% % -----Finish Solving Problem V-1 -----%

% Problem of three separate reconstruction
image = imread('Lena.jpg');

% First level decomposition
[A, H, V, D] = dwt2(im2double(image), 'db2');
% Set the 2*2 blocks of Approx coeff to their average
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
[A2, H2, V2, D2] = dwt2(A, 'db2');
H2(:,:) = 0;
newA1 = idwt2(A2, H2, V2, D2,'db2');
figure;imshow(newA1); title('New');
Y3 = idwt2(newA1(1:257,1:257), H, V, D,'db2');

figure; imshow(Y1); title('Average approx coefficients');
figure; imshow(Y2); title('Zero vertical detail for first level');
figure; imshow(Y3); title('Second level horizontal detail set to 0');
% % % -----Finish Solving Problem V-2 -----%

gaussianWN();
% % % -----Finish Solving Problem VI -----%
