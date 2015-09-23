% Problem 2
% 用传统方法对题二进行聚类。
% 2.解决附件二中四个低维空间中的子空间聚类问题和多流形聚类问题，如图1所示。图1(a)
% 为两条交点不在原点且互相垂直的两条直线，将其分为两类；图1(b) 为一个平面和两条
% 直线，这是一个不满足独立子空间的关系的例子，将其分为三类。图1(c)为两条不相交的
% 二次曲线，将其分为两类。图1(d) 为两条相交的螺旋线，将其分为两类。
%
clear all;
close all;
clc;
[~, Class2a1, Class2a2, Class2a3] = analysis2(2, 'a');
[~, Class2b1, Class2b2, Class2b3] = analysis2(2, 'b');
[~, Class2c1, Class2c2, Class2c3] = analysis2(2, 'c');
[~, Class2d1, Class2d2, Class2d3] = analysis2(2, 'd');

figure;

subplot(2, 2, 1);
hold on;
plot(Class2a1(1, :), Class2a1(2, :), 'r*');
plot(Class2a2(1, :), Class2a2(2, :), 'g.');

subplot(2, 2, 2);
hold on;
plot3(Class2b1(1, :), Class2b1(2, :), Class2b1(3, :), 'r*');
plot3(Class2b2(1, :), Class2b2(2, :), Class2b2(3, :), 'g.');
plot3(Class2b3(1, :), Class2b3(2, :), Class2b3(3, :), 'b>');

subplot(2, 2, 3);
hold on;
plot(Class2c1(1, :), Class2c1(2, :), 'r*');
plot(Class2c2(1, :), Class2c2(2, :), 'g.');

subplot(2, 2, 4);
hold on;
plot(Class2d1(1, :), Class2d1(2, :), 'r*');
plot(Class2d2(1, :), Class2d2(2, :), 'g.');