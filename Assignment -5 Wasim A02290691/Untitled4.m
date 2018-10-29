image = imread('Ball.tif');
[output, num_objects] = FindComponentLabelNoBorder(image, false);
disp(num_objects)