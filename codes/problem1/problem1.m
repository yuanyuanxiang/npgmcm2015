% Problem 1
% 1.当子空间独立时，子空间聚类问题相对容易。附件一中1.mat 中有一组高维数据（.mat
% 所存矩阵的每列为一个数据点，以下各题均如此），它采样于两个独立的子空间。我们需
% 要将这组数据分成两类。
%
close all;
load('1.mat');
% 行/列
[row, col] = size(data);
% 进行显示
figure;
subplot(1, 2, 1);
imshow(data, []);
title('原始数据');
% 标准化数据
data = zscore(data);
SaveMatrixAs(data, 'problem1-1.jpg');
% 计算距离
Dist = pdist(data');
MatrixOfDist = squareform(Dist);
SaveMatrixAs(MatrixOfDist, 'problem1-2.jpg');
subplot(1, 2, 2);
imshow(MatrixOfDist, []);
title('相关系数');
% 定义变量之间的连接
Lkg = linkage(Dist);
% 评价聚类信息
Cn = cophenet(Lkg, Dist);
% 创建聚类，并作出谱系图
Ct = clusterdata(data', 'linkage','ward','maxclust', 2);
figure;
plot(1:col, Ct, '+');
xlabel('index');
ylabel('class id');
set(gca, 'ytick',1:2);
title('cluster result');
figure;
dendrogram(Lkg);
Result = reshape(Ct, 20, [])';
xlswrite('problem1.xls', Result);