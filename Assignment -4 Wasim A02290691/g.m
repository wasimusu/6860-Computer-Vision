% Read lena image and add gaussian noise of 0 mean and 0.01 variance
image = imread('Lena.jpg');
image = imnoise(image, 'gaussian', 0, 0.01);

% % Apply  3-level decomposition
% [C,S] = wavedec2(image, 'db2', 3);
% 
% sigma = median(C) / 0.6745;
% M = length(C);
% threshold = sigma * sqrt(2*log*M);

[A, H, V, D] = dwt2(im2double(image), 'db2');
imshow([A,H,V,D],[]);
[r,c] = size(A);
newA = A;
for i = 1:2:r-1
    for j = 1:2:c-1
        newA(i:i+1,j:j+1) = mean(mean(A(i:i+1,j:j+1)));
    end
end

Y1 = idwt2(newA,H,V,D,'db2');

newV = V;
newV(:,:) = 0;
Y2 = idwt2(A,H,newV,D,'db2');

imshow(Y1);
figure; imshow(image);
figure; imshow(Y2);title('Zero vertical');

% Setting second level horizontal detail coefficients to 0
[A2, H2, V2, D2] = dwt2(A, 'db2');
H2(:,:) = 0;
newA1 = idwt2(A2, H2, V2, D2,'db2');
figure;imshow(newA1); title('New');
Y3 = idwt2(newA1(1:257,1:257), H, V, D,'db2');

figure;imshow(Y3);title('Y3');