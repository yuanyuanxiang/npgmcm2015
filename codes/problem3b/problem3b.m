% problem 3b
close all;
clear all;
clc;
load('3b.mat');
l = smmc(data,3,1,10,6);
result = reshape([l;0;0;0],20,[])';
xlswrite('problem3b.xls', result);

[M,N]=size(data);
figure;
for i = 1 : (M/2)
    y1 = [];
    y2 = [];
    y3 = [];
    for j= 1 :N
        if l(j)==1
            y1 = [y1,data((2*i-1):(2*i),j)];
        elseif l(j)==2
            y2 = [y2,data((2*i-1):(2*i),j)];
        else
            y3 = [y3,data((2*i-1):(2*i),j)];
        end
    end
    subplot(5,7,i);
    plot(y1(1,:),y1(2,:),'b.');
    hold on
    plot(y2(1,:),y2(2,:),'g+');
    hold on
    plot(y3(1,:),y3(2,:),'yo');
    title([num2str(i), '帧']);
    set(gca, 'xtick', [], 'ytick', []); 
end

L1 = find(l == 1);
L2 = find(l == 2);
L3 = find(l == 3);
figure;
hold on;
plot(1:31, data(1:2:end, L1(1)), 'b.-');
plot(1:31, data(1:2:end, L2(1)), 'g+-');
plot(1:31, data(1:2:end, L3(1)), 'yo-');
xlabel('x');
ylabel('y');
title('运动轨迹');
legend1 = ['1类:', num2str(length(L1)), '点'];
legend2 = ['2类:', num2str(length(L2)), '点'];
legend3 = ['3类:', num2str(length(L3)), '点'];
legend(legend1, legend2, legend3, 'Location', 'Best');