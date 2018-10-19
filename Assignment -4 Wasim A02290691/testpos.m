a = magic(10);
m = max(a(:));
p = find(a==m);

[row, col] = ind2sub(size(a), p);
newM = a(row, col);
disp([p, m, newM]);
disp(a);