% problem 4a
clear all;
close all;
clc;
load('4a.mat');
figure;
subplot(1, 2, 1);
plot3(data(1, :), data(2, :), data(3, :), '.');
xlabel('x');
ylabel('y');
zlabel('z');
title('origin data');
tic;
[dim, Num] = size(data);
four = 200;
five = 20;
six = 11;
result = smmc(data, 3, 2, four, five, six);
% 4th:[N/10d, 5N/10d], 
% 5th:[logN, 3*logN], 
% 6th:[4, 12], 
toc;
% ª≠∑÷¿‡Õº
y1 = [];
y2 = [];
y3 = [];
for i = 1:size(data, 2)
    if result(i) == 1
        y1 = [y1, data(:,i)];
    elseif result(i) == 2
        y2 = [y2, data(:,i)];
    else 
        y3 = [y3, data(:,i)];
    end
end
subplot(1, 2, 2);
Paint4a(y1, y2, y3);