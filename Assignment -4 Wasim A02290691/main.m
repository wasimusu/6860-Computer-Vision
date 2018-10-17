% % WASIM AKRAM KHAN -- Assignment 3
% % A02290691
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
figure;imshow(restCap);title('restored sample');

% Restoring sample image with its' phase and magnitude of other image
restSample = capM.*exp(1i*sampleP);
restSample = uint8(real(ifft2(ifftshift(restSample))));
figure;imshow(restSample);title('restored sample');
% % -----Finish Solving Problem III-2 -----%
