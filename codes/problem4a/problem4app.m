% Problem 4a++
%
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

MaxIt = 300;%最大迭代次数
absLim = 0.02;
Class1Num = 0;
Class2Num = 0;
MinNuNum = Num / 10;%类的最小数据个数

it = 0;
while it < MaxIt && (Class1Num < MinNuNum || Class2Num < MinNuNum)
    Class1 = [];
    Class2 = [];
    % step 1：任取两个点(x1,y1),(x2,y2)，假设属于平面：z = Ax + By + C
    id = zeros(1, 3);
    while id(1) == id(2) || id(1) == id(2) || id(2) == id(3)
        id = unidrnd(Num, [1, 3]);
    end
    p = data(:, id(1));
    q = data(:, id(2));
    r = data(:, id(3));
    A = [p(1), p(2), 1; q(1), q(2), 1; r(1), r(2), 1];
    B = [p(end); q(end); r(end)];
    X = A \ B;
    k1 = X(1);
    k2 = X(2);
    k3 = X(3);
    % step 2：遍历所有点z,△1 = z - x,△2 = z - y
    % 判断夹角<△1, △2>
    for i = 1:Num
        s = data(:, i);
        z = X' * s;
        flag = abs((z - s(end))/z);
        if flag < absLim
            Class1 = [Class1, data(:, i)];
            % 修正k,b
        else
            Class2 = [Class2, data(:, i)];
            if Class2Num >= 2
                % 修正k2,b2
            else
                % count++
            end
        end
    end
    % step3：重新计算两个类的数据个数
    Class1Num =  size(Class1, 2);
    Class2Num =  size(Class2, 2);
    it = it + 1;
    fprintf('iteration = %g\n', it);
end

if isempty(Class1) && isempty(Class2)
    return;
end

subplot(1, 2, 2);
plot3(Class1(1, :), Class1(2, :), Class1(3, :), 'ro');
hold on;
plot3(Class2(1, :), Class2(2, :), Class2(3, :), 'b.');
xlabel('x');
ylabel('y');
zlabel('z');
title('cluster result');