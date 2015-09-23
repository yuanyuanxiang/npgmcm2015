% problem 3c
load('3c.mat');
result = smmc(data,2,2,2,6,4);
xlswrite('problem3c.xls',result');
for i = 1: 20
    c(:,:,i) = reshape(data(:,i),42,48);
    subplot(4,5,i);
    imshow(c(:,:,i)/256);
    title(num2str(result(i)));
    set(gca, 'xtick', [], 'ytick', []); 
end