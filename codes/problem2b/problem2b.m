% problem 2b
clear all;
clc;
load('2b_new.mat');
figure;
plot3(lines(1, :), lines(2, :), lines(3, :), 'ro');
hold on;
plot3(plane(1, :), plane(2, :), plane(3, :), 'b.');
xlabel('x');
ylabel('y');
zlabel('z');
title('problem 2b');

[Class1, Class2] = cluster2lines(lines, 10, 0.05);

figure;
plot3(Class1(1, :), Class1(2, :), Class1(3, :), 'ro');
hold on;
plot3(Class2(1, :), Class2(2, :), Class2(3, :), 'kp');
hold on;
plot3(plane(1, :), plane(2, :), plane(3, :), 'b.');
xlabel('x');
ylabel('y');
zlabel('z');
title('problem 2b');
L1 = ['1类:', num2str(size(Class1, 2)), '点'];
L2 = ['2类:', num2str(size(Class2, 2)), '点'];
L3 = ['3类:', num2str(size(plane, 2)), '点'];
legend(L1, L2, L3, 'Location', 'Best');