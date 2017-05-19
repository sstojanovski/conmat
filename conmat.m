% phantom 1
det11 = csvread('0001_01_det.csv', 1, 0);
det12 = csvread('0001_02_det.csv', 1, 0);
det13 = csvread('0001_03_det.csv', 1, 0);

prob11 = csvread('0001_01_prob.csv', 1, 0);
prob12 = csvread('0001_02_prob.csv', 1, 0);
prob13 = csvread('0001_03_prob.csv', 1, 0);

fmri11 = csvread('0001_01_fmri.csv');
fmri12 = csvread('0001_02_fmri.csv');
fmri13 = csvread('0001_03_fmri.csv');

% fmri11(find(det11==0)) = 0;
% fmri12(find(det12==0)) = 0;
% fmri13(find(det13==0)) = 0;

fmri11(find(fmri11<max(fmri11(:))*0.10)) = 0;
fmri12(find(fmri12<max(fmri12(:))*0.10)) = 0;
fmri13(find(fmri13<max(fmri13(:))*0.10)) = 0;

fmri11(find(fmri11==1)) = 0;
fmri12(find(fmri12==1)) = 0;
fmri13(find(fmri13==1)) = 0;

% phantom 2
det21 = csvread('0002_01_det.csv', 1, 0);
det22 = csvread('0002_02_det.csv', 1, 0);
det23 = csvread('0002_03_det.csv', 1, 0);

prob21 = csvread('0002_01_prob.csv', 1, 0);
prob22 = csvread('0002_02_prob.csv', 1, 0);
prob23 = csvread('0002_03_prob.csv', 1, 0);

fmri21 = csvread('0002_01_fmri.csv');
fmri22 = csvread('0002_02_fmri.csv');
fmri23 = csvread('0002_03_fmri.csv');

% fmri21(find(det21==0)) = 0;
% fmri22(find(det22==0)) = 0;
% fmri23(find(det23==0)) = 0;

% phantom 3
det31 = csvread('0003_01_det.csv', 1, 0);
det32 = csvread('0003_02_det.csv', 1, 0);
det33 = csvread('0003_03_det.csv', 1, 0);

prob31 = csvread('0003_01_prob.csv', 1, 0);
prob32 = csvread('0003_02_prob.csv', 1, 0);
prob33 = csvread('0003_03_prob.csv', 1, 0);

fmri31 = csvread('0003_01_fmri.csv');
fmri32 = csvread('0003_02_fmri.csv');
fmri33 = csvread('0003_03_fmri.csv');

% fmri31(find(det31==0)) = 0;
% fmri32(find(det32==0)) = 0;
% fmri33(find(det33==0)) = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dims = size(det11);

% phantom 1
det11_rs = reshape(det11, dims(1)*dims(2), 1);
det12_rs = reshape(det12, dims(1)*dims(2), 1);
det13_rs = reshape(det13, dims(1)*dims(2), 1);

prob11_rs = reshape(prob11, dims(1)*dims(2), 1);
prob12_rs = reshape(prob12, dims(1)*dims(2), 1);
prob13_rs = reshape(prob13, dims(1)*dims(2), 1);

fmri11_rs = reshape(fmri11, dims(1)*dims(2), 1);
fmri12_rs = reshape(fmri12, dims(1)*dims(2), 1);
fmri13_rs = reshape(fmri13, dims(1)*dims(2), 1);

% fmri11_rs = (fmri11_rs - min(fmri11_rs)) / (max(fmri11_rs) - min(fmri11_rs));
% fmri12_rs = (fmri12_rs - min(fmri12_rs)) / (max(fmri12_rs) - min(fmri12_rs));
% fmri13_rs = (fmri13_rs - min(fmri13_rs)) / (max(fmri13_rs) - min(fmri13_rs));

% phantom 2
det21_rs = reshape(det21, dims(1)*dims(2), 1);
det22_rs = reshape(det22, dims(1)*dims(2), 1);
det23_rs = reshape(det23, dims(1)*dims(2), 1);

prob21_rs = reshape(prob21, dims(1)*dims(2), 1);
prob22_rs = reshape(prob22, dims(1)*dims(2), 1);
prob23_rs = reshape(prob23, dims(1)*dims(2), 1);

fmri21_rs = reshape(fmri21, dims(1)*dims(2), 1);
fmri22_rs = reshape(fmri22, dims(1)*dims(2), 1);
fmri23_rs = reshape(fmri23, dims(1)*dims(2), 1);

% fmri21_rs = (fmri21_rs - min(fmri21_rs)) / (max(fmri21_rs) - min(fmri21_rs));
% fmri22_rs = (fmri22_rs - min(fmri22_rs)) / (max(fmri22_rs) - min(fmri22_rs));
% fmri23_rs = (fmri23_rs - min(fmri23_rs)) / (max(fmri23_rs) - min(fmri23_rs));

% phantom 3
det31_rs = reshape(det31, dims(1)*dims(2), 1);
det32_rs = reshape(det32, dims(1)*dims(2), 1);
det33_rs = reshape(det33, dims(1)*dims(2), 1);

prob31_rs = reshape(prob31, dims(1)*dims(2), 1);
prob32_rs = reshape(prob32, dims(1)*dims(2), 1);
prob33_rs = reshape(prob33, dims(1)*dims(2), 1);

fmri31_rs = reshape(fmri31, dims(1)*dims(2), 1);
fmri32_rs = reshape(fmri32, dims(1)*dims(2), 1);
fmri33_rs = reshape(fmri33, dims(1)*dims(2), 1);

% fmri31_rs = (fmri31_rs - min(fmri31_rs)) / (max(fmri31_rs) - min(fmri31_rs));
% fmri32_rs = (fmri32_rs - min(fmri32_rs)) / (max(fmri32_rs) - min(fmri32_rs));
% fmri33_rs = (fmri33_rs - min(fmri33_rs)) / (max(fmri33_rs) - min(fmri33_rs));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %deterministic vs probabilistic 
% % phantom 1
% figure
% dp1 = [det11_rs, det12_rs, det13_rs, prob11_rs, prob12_rs, prob13_rs]';
% detprob = pdist(dp1)
% imagesc(squareform(detprob))
% colorbar
% title('phantom 1: deterministic vs probabilistic');
% set(gca, 'yTickLabel', {'det1', 'det2', 'det3', 'prob1', 'prob2', 'prob3'}, 'yAxisLocation', 'left');
% set(gca, 'xTickLabel', {'det1', 'det2', 'det3', 'prob1', 'prob2', 'prob3'}, 'xAxisLocation', 'top');
% 
% % phantom 2
% figure
% dp2 = [det21_rs, det22_rs, det23_rs, prob21_rs, prob22_rs, prob23_rs]';
% detprob = pdist(dp2)
% imagesc(squareform(detprob))
% colorbar
% title('phantom 2: deterministic vs probabilistic');
% set(gca, 'yTickLabel', {'det1', 'det2', 'det3', 'prob1', 'prob2', 'prob3'}, 'yAxisLocation', 'left');
% set(gca, 'xTickLabel', {'det1', 'det2', 'det3', 'prob1', 'prob2', 'prob3'}, 'xAxisLocation', 'top');
% 
% % phantom 3
% figure
% dp3 = [det31_rs, det32_rs, det33_rs, prob31_rs, prob32_rs, prob33_rs]';
% detprob = pdist(dp3)
% imagesc(squareform(detprob))
% colorbar
% title('phantom 3: deterministic vs probabilistic');
% set(gca, 'yTickLabel', {'det1', 'det2', 'det3', 'prob1', 'prob2', 'prob3'}, 'yAxisLocation', 'left');
% set(gca, 'xTickLabel', {'det1', 'det2', 'det3', 'prob1', 'prob2', 'prob3'}, 'xAxisLocation', 'top');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % deterministic
% % phantom 1
% figure
% dd1 = [det11_rs, det12_rs, det13_rs]';
% detdet = pdist(dd1)
% imagesc(squareform(detdet))
% colorbar
% title('phantom 1: deterministic vs deterministic');
% set(gca, 'yTickLabel', {'', 'det1', '', 'det2', '', 'det3'}, 'yAxisLocation', 'left');
% set(gca, 'xTickLabel', {'', 'det1', '', 'det2', '', 'det3'}, 'xAxisLocation', 'top');
% 
% % phantom 2
% figure
% dd2 = [det21_rs, det22_rs, det23_rs]';
% detdet = pdist(dd2)
% imagesc(squareform(detdet))
% colorbar
% title('phantom 2: deterministic vs deterministic');
% set(gca, 'yTickLabel', {'', 'det1', '', 'det2', '', 'det3'}, 'yAxisLocation', 'left');
% set(gca, 'xTickLabel', {'', 'det1', '', 'det2', '', 'det3'}, 'xAxisLocation', 'top');
% 
% % phantom 3
% figure
% dd3 = [det31_rs, det32_rs, det33_rs]';
% detdet = pdist(dd3)
% imagesc(squareform(detdet))
% colorbar
% title('phantom 3: deterministic vs deterministic');
% set(gca, 'yTickLabel', {'', 'det1', '', 'det2', '', 'det3'}, 'yAxisLocation', 'left');
% set(gca, 'xTickLabel', {'', 'det1', '', 'det2', '', 'det3'}, 'xAxisLocation', 'top');
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %probabilistic
% % phantom 1
% figure
% pp1 = [prob11_rs, prob12_rs, prob13_rs]';
% probprob = pdist(pp1)
% imagesc(squareform(probprob))
% colorbar
% title('phantom 1: probabilistic vs probabilistic');
% set(gca, 'yTickLabel', {'', 'prob1', '', 'prob2', '', 'prob3'}, 'yAxisLocation', 'left');
% set(gca, 'xTickLabel', {'', 'prob1', '', 'prob2', '', 'prob3'}, 'xAxisLocation', 'top');
% 
% % phantom 2
% figure
% pp2 = [prob21_rs, prob22_rs, prob23_rs]';
% probprob = pdist(pp2)
% imagesc(squareform(probprob))
% colorbar
% title('phantom 2: probabilistic vs probabilistic');
% set(gca, 'yTickLabel', {'', 'prob1', '', 'prob2', '', 'prob3'}, 'yAxisLocation', 'left');
% set(gca, 'xTickLabel', {'', 'prob1', '', 'prob2', '', 'prob3'}, 'xAxisLocation', 'top');
% 
% % phantom 3
% figure
% pp3 = [prob31_rs, prob32_rs, prob33_rs]';
% probprob = pdist(pp3)
% imagesc(squareform(probprob))
% colorbar
% title('phantom 3: probabilistic vs probabilistic');
% set(gca, 'yTickLabel', {'', 'prob1', '', 'prob2', '', 'prob3'}, 'yAxisLocation', 'left');
% set(gca, 'xTickLabel', {'', 'prob1', '', 'prob2', '', 'prob3'}, 'xAxisLocation', 'top');
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %fmri
% % phantom 1
% figure
% ff1 = [fmri11_rs, fmri12_rs, fmri13_rs]';
% fmrifmri = pdist(ff1)
% imagesc(squareform(fmrifmri))
% colorbar
% title('phantom 1: fmri vs fmri');
% set(gca, 'yTickLabel', {'', 'fmri1', '', 'fmri2', '', 'fmri3'}, 'yAxisLocation', 'left');
% set(gca, 'xTickLabel', {'', 'fmri1', '', 'fmri2', '', 'fmri3'}, 'xAxisLocation', 'top');
% 
% % phantom 2
% figure
% ff2 = [fmri21_rs, fmri22_rs, fmri23_rs]';
% fmrifmri = pdist(ff2)
% imagesc(squareform(fmrifmri))
% colorbar
% title('phantom 2: fmri vs fmri');
% set(gca, 'yTickLabel', {'', 'fmri1', '', 'fmri2', '', 'fmri3'}, 'yAxisLocation', 'left');
% set(gca, 'xTickLabel', {'', 'fmri1', '', 'fmri2', '', 'fmri3'}, 'xAxisLocation', 'top');
% 
% % phantom 3
% figure
% ff3 = [fmri31_rs, fmri32_rs, fmri33_rs]';
% fmrifmri = pdist(ff3)
% imagesc(squareform(fmrifmri))
% colorbar
% title('phantom 3: fmri vs fmri');
% set(gca, 'yTickLabel', {'', 'fmri1', '', 'fmri2', '', 'fmri3'}, 'yAxisLocation', 'left');
% set(gca, 'xTickLabel', {'', 'fmri1', '', 'fmri2', '', 'fmri3'}, 'xAxisLocation', 'top');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% deterministic vs fmri
% phantom 1
figure
df1 = [det11_rs, det12_rs, det13_rs, fmri11_rs, fmri12_rs, fmri13_rs]';
detfmri = pdist(df1, 'correlation');
imagesc(squareform(detfmri))
colorbar
title('phantom 1: deterministic vs fmri');
set(gca, 'yTickLabel', {'det1', 'det2', 'det3', 'fmri1', 'fmri2', 'fmri3'}, 'yAxisLocation', 'left');
set(gca, 'xTickLabel', {'det1', 'det2', 'det3', 'fmri1', 'fmri2', 'fmri3'}, 'xAxisLocation', 'top');

% phantom 2
figure
df2 = [det21_rs, det22_rs, det23_rs, fmri21_rs, fmri22_rs, fmri23_rs]';
detfmri = pdist(df2, 'correlation');
imagesc(squareform(detfmri))
colorbar
title('phantom 1: deterministic vs fmri');
set(gca, 'yTickLabel', {'det1', 'det2', 'det3', 'fmri1', 'fmri2', 'fmri3'}, 'yAxisLocation', 'left');
set(gca, 'xTickLabel', {'det1', 'det2', 'det3', 'fmri1', 'fmri2', 'fmri3'}, 'xAxisLocation', 'top');

% phantom 3
figure
df3 = [det31_rs, det32_rs, det33_rs, fmri31_rs, fmri32_rs, fmri33_rs]';
detfmri = pdist(df3, 'correlation');
imagesc(squareform(detfmri))
colorbar
title('phantom 1: deterministic vs fmri');
set(gca, 'yTickLabel', {'det1', 'det2', 'det3', 'fmri1', 'fmri2', 'fmri3'}, 'yAxisLocation', 'left');
set(gca, 'xTickLabel', {'det1', 'det2', 'det3', 'fmri1', 'fmri2', 'fmri3'}, 'xAxisLocation', 'top');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % deterministic vs probabilistic all phantoms
% figure
% dpAll = [det11_rs, prob11_rs, det12_rs, prob12_rs, det13_rs, prob13_rs, det21_rs, prob21_rs, det22_rs, prob22_rs, det23_rs, prob23_rs, det31_rs, prob31_rs, det32_rs, prob32_rs, det33_rs, prob33_rs]';
% detprob = pdist(dpAll)
% imagesc(squareform(detprob))
% colorbar
% title('phantom All: deterministic vs probabilistic');
% set(gca, 'yTickLabel', {'det11', 'prob11', 'det12', 'prob12', 'det13', 'prob13', 'det21', 'prob21', 'det22', 'prob22', 'det23', 'prob23', 'det31', 'prob31', 'det32', 'prob32', 'det33', 'prob33'}, 'yAxisLocation', 'left', 'yTick', 1:18);
% set(gca, 'xTickLabel', {'det11', 'prob11', 'det12', 'prob12', 'det13', 'prob13', 'det21', 'prob21', 'det22', 'prob22', 'det23', 'prob23', 'det31', 'prob31', 'det32', 'prob32', 'det33', 'prob33'}, 'xAxisLocation', 'top', 'xTick', 1:2:18);
% 
% % deterministic vs probabilistic all phantoms
% figure
% dpAll = [det11_rs, det12_rs, det13_rs, det21_rs, det22_rs, det23_rs, det31_rs, det32_rs, det33_rs, prob11_rs, prob12_rs, prob13_rs, prob21_rs, prob22_rs, prob23_rs, prob31_rs, prob32_rs, prob33_rs]';
% detprob = pdist(dpAll)
% imagesc(squareform(detprob))
% colorbar
% title('phantom All: deterministic vs probabilistic');
% set(gca, 'yTickLabel', {'det11', 'det12', 'det13', 'det21', 'det22', 'det23', 'det31', 'det32', 'det33', 'prob11', 'prob12', 'prob13', 'prob21', 'prob22', 'prob23', 'prob31', 'prob32', 'prob33'}, 'yAxisLocation', 'left', 'yTick', 1:18);
% set(gca, 'xTickLabel', {'det11', 'det12', 'det13', 'det21', 'det22', 'det23', 'det31', 'det32', 'det33', 'prob11', 'prob12', 'prob13', 'prob21', 'prob22', 'prob23', 'prob31', 'prob32', 'prob33'}, 'xAxisLocation', 'top', 'xTick', 1:2:18);
% 
% % deterministic all phantoms
% figure
% ddAll = [det11_rs, det12_rs, det13_rs, det21_rs, det22_rs, det23_rs, det31_rs, det32_rs, det33_rs]';
% detdet = pdist(ddAll)
% imagesc(squareform(detdet))
% colorbar
% title('phantom All: deterministic vs deterministic');
% set(gca, 'yTickLabel', {'det11', 'det12', 'det13', 'det21', 'det22', 'det23', 'det31', 'det32', 'det33'}, 'yAxisLocation', 'left', 'yTick', 1:9);
% set(gca, 'xTickLabel', {'det11', 'det12', 'det13', 'det21', 'det22', 'det23', 'det31', 'det32', 'det33'}, 'xAxisLocation', 'top', 'xTick', 1:9);
% 
% 
% % probabilistic all phantoms
% figure
% ppAll = [prob11_rs, prob12_rs, prob13_rs, prob21_rs, prob22_rs, prob23_rs, prob31_rs, prob32_rs, prob33_rs]';
% probprob = pdist(ppAll)
% imagesc(squareform(probprob))
% colorbar
% title('phantom All: probabilistic vs probabilistic');
% set(gca, 'yTickLabel', {'prob11', 'prob12', 'prob13', 'prob21', 'prob22', 'prob23', 'prob31', 'prob32', 'prob33'}, 'yAxisLocation', 'left', 'yTick', 1:9);
% set(gca, 'xTickLabel', {'prob11', 'prob12', 'prob13', 'prob21', 'prob22', 'prob23', 'prob31', 'prob32', 'prob33'}, 'xAxisLocation', 'top', 'xTick', 1:9);
% 
% deterministic vs probabilistic vs fmri all phantoms
figure 
dpfAll = [det11_rs, det12_rs, det13_rs, det21_rs, det22_rs, det23_rs, det31_rs, det32_rs, det33_rs, prob11_rs, prob12_rs, prob13_rs, prob21_rs, prob22_rs, prob23_rs, prob31_rs, prob32_rs, prob33_rs, fmri11_rs, fmri12_rs, fmri13_rs, fmri21_rs, fmri22_rs, fmri23_rs, fmri31_rs, fmri32_rs, fmri33_rs]';
detprobfmri = pdist(dpfAll, 'correlation');
imagesc(squareform(detprobfmri))
colorbar
