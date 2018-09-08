% WASIM AKRAM KHAN -- Assignment 1


function [maxValue, minValue, meanValue, medianValue] = FindInfo(origImage)

% Convert matrices to row vector and sort it.
array = origImage(:);
array = sort(array);

% first item should be the smallest value
minValue = array(1);

maxIndex = length(array);
% last item should be the largest value
maxValue = array(maxIndex);

% Computing media for cases when length of array is even and odd
if rem(maxIndex, 2) == 0
    medianValue = (array(maxIndex/2) + array(maxIndex/2+1))/2;
else
    medianValue = array((maxIndex+1)/2);
end

% Computing sum of all the pixels in the image using loop
total = 0;
array = double(array);
for i = 1:maxIndex
    total = total + array(i);
end

% Sum of pixels can also be computed using sum
% total = sum(array)

% Compute mean of the image
meanValue = total / maxIndex;
end
