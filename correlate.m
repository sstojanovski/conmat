files = {'0001_01_det.csv' '0001_02_det.csv' '0001_03_det.csv' '0001_01_prob.csv' '0001_02_prob.csv' '0001_03_prob.csv' '0001_01_fmri.csv' '0001_02_fmri.csv' '0001_03_fmri.csv'};

reshapedMat = zeros(71824, length(files));
index = 1;

for i = files
   reshapedMat(:,index) = procFile(cell2mat(i));
   index = index+1;
end

correlationMat = pdist(reshapedMat', 'correlation');
figure, imagesc(squareform(correlationMat))
colorbar