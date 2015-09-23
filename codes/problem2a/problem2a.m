% Problem 2a
% 2.解决附件二中四个低维空间中的子空间聚类问题和多流形聚类问题，如图1所示。图1(a)
% 为两条交点不在原点且互相垂直的两条直线，将其分为两类；图1(b) 为一个平面和两条
% 直线，这是一个不满足独立子空间的关系的例子，将其分为三类。图1(c)为两条不相交的
% 二次曲线，将其分为两类。图1(d) 为两条相交的螺旋线，将其分为两类。
%
clear all;
close all;
clc;
data = analysis2(2, 'a');
num = size(data, 2);

MaxIt = 1000;%最大迭代次数
absLim = 0.12;
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
    p = data(:, id(1));
    q = data(:, id(2));
    A = [p(1), 1; q(1), 1];
    B = [p(2); q(2)];
    X = A \ B;
    k = X(1);
    b = X(2);
    % step 2：遍历所有点z,△1 = z - x,△2 = z - y
    % 判断夹角<△1, △2>
    for i = 1:num
        r = data(:, i);
        y = k * r(1) + b;
        flag = abs((y - r(2))/y);
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
end

if it == MaxIt
    return;
end

figure;
plot(Class1(1, :), Class1(2, :), 'rp');
hold on;
plot(Class2(1, :), Class2(2, :), 'gh');
xlabel('x');
ylabel('y');
title('problem 2a');
L1 = ['1类:', num2str(size(Class1, 2)), '点'];
L2 = ['2类:', num2str(size(Class2, 2)), '点'];
legend(L1, L2, 'Location', 'Best');

%{
para = polyfit(Class1(1, :), Class1(2, :), 1);
NewClass2 = [];
for i = 1:Class2Num
    xi = Class2(1, i);
    yi = polyval(para, xi);
    dy = (Class2(2, i) - yi) / yi;
    if abs(dy) < 0.10
        Class1 = [Class1, Class2(:, i)];
    else
        NewClass2 = [NewClass2, Class2(:, i)];
    end
end
figure;
plot(Class1(1, :), Class1(2, :), 'ro');
hold on;
plot(NewClass2(1, :), NewClass2(2, :), 'b.');
xlabel('x');
ylabel('y');
title('cluster result');
%}