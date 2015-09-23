function [Class1, Class2] = cluster2lines(lines, absLim)
% 本函数由个人编写
% 功能：分割两条直线
% lines:直线坐标
% absLim:可调参数<1.0

clc;

if nargin == 1
    absLim = 0.1;
end

num = size(lines, 2);

MaxIt = 1000;%最大迭代次数
Class1Num = 0;
Class2Num = 0;
MinNuNum = num / 3;%类的最小数据个数

it = 0;
while it < MaxIt && (Class1Num < MinNuNum || Class2Num < MinNuNum)
    Class1 = [];
    Class2 = [];
    % step 1：任取两个点(x1,y1),(x2,y2)，假设属于直线L1：kx+b=y
    id = zeros(1, 2);
    while id(1) == id(2)
        id = unidrnd(num, [1, 2]);
    end
    p = lines(:, id(1));
    q = lines(:, id(2));
    A = [p(1), 1; q(1), 1];
    B = [p(2); q(2)];
    X = A \ B;
    k = X(1);
    b = X(2);
    % step 2：遍历所有点
    for i = 1:num
        r = lines(:, i);
        y = k * r(1) + b;
        flag = abs((y - r(2))/y);
        if flag <= absLim
            Class1 = [Class1, lines(:, i)];
            % 修正k,b
        else
            Class2 = [Class2, lines(:, i)];
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
end

if it == MaxIt
    return;
end

figure;
plot(Class1(1, :), Class1(2, :), 'ro');
hold on;
plot(Class2(1, :), Class2(2, :), 'b.');
xlabel('x');
ylabel('y');
title('cluster result');