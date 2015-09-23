% problem 3a
clear all;
close all;
clc;
load('3a.mat');
figure;
plot(data(1, :), data(2, :), '.');
xlabel('x');
ylabel('y');
title('cluster result');

[Class1, Class2] = cluster2lines(data, 0.06);

if isempty(Class1) || isempty(Class2)
    return;
end

figure;
plot(Class1(1, :), Class1(2, :), 'r.');
hold on;
plot(Class2(1, :), Class2(2, :),  'g.');
xlabel('x');
ylabel('y');
title('problem 3a');
L1 = ['1类:', num2str(size(Class1, 2)), '点'];
L2 = ['2类:', num2str(size(Class2, 2)), '点'];
legend(L1, L2, 'Location', 'Best');

% compute center
c1 = mean(Class1, 2);
c2 = mean(Class2, 2);
center = [0, 0];
std1 = std(Class1');
std2 = std(Class2');
if std1(1) < std1(2)
    center(1) = c1(1);
else
    center(2) = c1(2);
end
if std2(1) < std2(2)
    center(1) = c2(1);
else
    center(2) = c2(2);
end