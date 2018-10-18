function [] = gaussianWN()
    % Read lena image and add gaussian noise of 0 mean and 0.01 variance
    image = imread('Lena.jpg');
    imageN = imnoise(image, 'gaussian', 0, 0.01);

    [A, H, V, D] = dwt2(im2double(imageN), 'db2');

    % Manipulating first, second and third level A 
    [A2, H2, V2, D2] = dwt2(threshWavelet(A,H,V,D), 'db2');
    [A3, H3, V3, D3] = dwt2(threshWavelet(A2,H2,V2,D2), 'db2');
    [A4, H4, V4, D4] = dwt2(threshWavelet(A3,H3,V3,D3), 'db2');

    % Rollback
    nA3 = idwt2(A4, H4, V4, D4,'db2');
    nA2 = idwt2(nA3, H3, V3, D3,'db2');
    nA1 = idwt2(nA2, H2, V2, D2,'db2');
    Y = idwt2(nA1(1:257,1:257), H, V, D,'db2');

    figure; imshow(Y); title('Noise Free');
    figure; imshow(image); title('Input Image');
end