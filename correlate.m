function output = correlate(fileList)

reshapedMat = zeros(71824, length(fileList));
index = 1;

for i = fileList
   reshapedMat(:,index) = procFile(cell2mat(i));
   index = index+1;
end

correlationMat = pdist(reshapedMat', 'correlation')
figure, imagesc(squareform(correlationMat))
colorbar
end