% Save matrix as jpg file.
function SaveMatrixAs(M, fileName)
M = zscore(M);
Max = max(max(M));
Min = min(min(M));
M = 255 * (M - Min) / (Max - Min);
M = uint8(M);
imwrite(M, fileName);