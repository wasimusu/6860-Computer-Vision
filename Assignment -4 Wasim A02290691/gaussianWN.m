function [] = gaussianWN()
    % Read lena image and add gaussian noise of 0 mean and 0.01 variance
    image = imread('Lena.jpg');
    imageN = imnoise(image, 'gaussian', 0, 0.01);
    
    dwtmode('per');
    % Manipulate first, second and third level of Decomposition layers
    [A, H, V, D] = dwt2(imageN, 'db2');
    [H, V, D] = threshWavelet(H,V,D); % First level
    
    [A2, H2, V2, D2] = dwt2(A, 'db2');
    [H2, V2, D2] = threshWavelet(H2, V2, D2); % Second level
    
    [A3, H3, V3, D3] = dwt2(A2, 'db2');
    [H3, V3, D3] = threshWavelet(H3, V3, D3);  % Third level
    
    % Rollback
    nA2 = idwt2(A3, H3, V3, D3,'db2');
    nA1 = idwt2(nA2, H2, V2, D2,'db2');
    Y = idwt2(nA1, H, V, D,'db2');
    Y = uint8(Y);
    
    if(imageN == Y)
        disp('No changes');
    else
        disp('Some minor changes');
    end
    
    figure; imshow(imageN); title('Input Image');
    figure; imshow(Y); title('Noise Free');
end