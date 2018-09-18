function [scaledImage, transferParams] = Scaling(inputImage, range)
    % Max and min intensity of input image
    maxIntensity = max(max(inputImage));
    minIntensity = min(min(inputImage));

    % Max and min intensity of desired image
    b = max(range);
    a = min(range);

    % Check if the intensity range is fine
    if (max(range) > 255) || (min(range) < 0)
        disp('Transfer Parameters invalid');
    end
    
    % Copy the image
    scaledImage = inputImage;

    % Scale the image
    norm_factor = (b-a)/(maxIntensity - minIntensity);
    scaledImage = (inputImage - minIntensity)*norm_factor + a;
    range = b -a ;
    %imshow(scaledImage);

    % Just passing on the transfer Params
    transferParams = [norm_factor, a, minIntensity];

end
