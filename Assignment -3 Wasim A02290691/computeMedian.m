function med = computeMedian(roi, mask)
    
    array = zeros(1,sum(sum(mask)));

    roi = roi(:);
    mask = mask(:);
    
    k = 1;
    for i = 1:length(roi)
        for j = 1 : mask(i)
            array(k) = roi(i);
            k = k + 1;
        end
    end
    med = median(array);
end