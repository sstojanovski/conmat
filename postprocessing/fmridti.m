list = {'SPN01_CMH_0004_01_bedpostX_det_connectivity.csv' 'SPN01_CMH_0005_01_bedpostX_det_connectivity.csv' 'SPN01_CMH_0007_01_bedpostX_det_connectivity.csv' 'SPN01_CMH_0008_01_bedpostX_det_connectivity.csv' 'SPN01_CMH_0011_01_bedpostX_det_connectivity.csv' 'SPN01_CMH_0016_01_bedpostX_det_connectivity.csv' 'SPN01_CMH_0017_01_bedpostX_det_connectivity.csv' 'SPN01_CMH_0020_01_bedpostX_det_connectivity.csv' 'SPN01_CMH_0023_01_bedpostX_det_connectivity.csv' 'SPN01_CMH_0026_01_bedpostX_det_connectivity.csv' 'SPN01_CMH_0030_01_bedpostX_det_connectivity.csv' 'SPN01_CMH_0033_01_bedpostX_det_connectivity.csv'}
list2 = {'SPN01_CMH_0004_01_01_RST_07_Ax-RestingState_MNI-nonlin_roi-corrs.csv' 'SPN01_CMH_0005_01_01_RST_07_Ax-RestingState_MNI-nonlin_roi-corrs.csv' 'SPN01_CMH_0007_01_01_RST_07_Ax-RestingState_MNI-nonlin_roi-corrs.csv' 'SPN01_CMH_0008_01_01_RST_07_Ax-RestingState_MNI-nonlin_roi-corrs.csv' 'SPN01_CMH_0011_01_01_RST_07_AxEPI-RestingState_MNI-nonlin_roi-corrs.csv' 'SPN01_CMH_0016_01_01_RST_09_Ax-RestingState_MNI-nonlin_roi-corrs.csv' 'SPN01_CMH_0017_01_01_RST_07_Ax-RestingState_MNI-nonlin_roi-corrs.csv' 'SPN01_CMH_0020_01_01_RST_07_Ax-RestingState_MNI-nonlin_roi-corrs.csv' 'SPN01_CMH_0023_01_01_RST_07_AxEPI-RestingState_MNI-nonlin_roi-corrs.csv' 'SPN01_CMH_0026_01_01_RST_09_AxEPI-RestingState_MNI-nonlin_roi-corrs.csv' 'SPN01_CMH_0030_01_01_RST_07_AxEPI-RestingState_MNI-nonlin_roi-corrs.csv' 'SPN01_CMH_0033_01_01_RST_08_AxEPI-RestingState_MNI-nonlin_roi-corrs.csv' }


for i = 1:length(list)
    dti = csvread(char(list(i)), 1, 0);
    
    dti(dti >0) = 1;
    dti = reshape(dti, 268*268, 1);
    
    fmri = csvread(char(list2(i)));
    fmri = reshape(fmri, 268*268, 1);
    hold on
    
    minFmri = min(fmri(:));
    maxFmri = max(fmri(:));
    minDti = min(dti(:));
    maxDti = max(dti(:));

    numBins = 20;
    step = (maxFmri-minFmri)/numBins;

    for i = minFmri:step:maxFmri-step
        avgDti = mean(dti(fmri >= i & fmri < (i+step)));
        avgFmri = (i + (i+step))/2;
        hold on;
        scatter(avgFmri, avgDti)
    end
    
end
