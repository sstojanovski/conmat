% w = 2 / (n_roi_1 + n_roi_2) * n_fibers

conMat = csvread('0001_01_beddet_sc.csv', 1, 0);
lengthsMat = csvread('0001_01_beddet_ts.csv', 1, 0);
voxelCounts = csvread('voxelROI.csv');
weightedMat = [];
weightedLength = [];

for roi1 = 1:268
    for roi2 = 1:268
        n_fibers = conMat(roi1, roi2);
        weightedMat(roi1, roi2) = 2 * n_fibers / (voxelCounts(roi1) + voxelCounts(roi2));
        if lengthsMat(roi1, roi2) > 0
            weightedLength(roi1, roi2) = 2 / (voxelCounts(roi1) + voxelCounts(roi2)) / lengthsMat(roi1, roi2);
        end
    end
end

csvwrite('weightedConmat.csv', weightedMat);
csvwrite('weightedLengths.csv', weightedLength);
