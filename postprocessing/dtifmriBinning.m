function output = dtifmriBinning(dtiList, fmriList)

    for i = 1:length(dtiList)
        dti = csvread(char(dtiList(i)), 1, 0);

        dti(dti >0) = 1;
        dti = reshape(dti, 268*268, 1);

        fmri = csvread(char(fmriList(i)));
        fmri = reshape(fmri, 268*268, 1);

        minFmri = min(fmri(:));
        maxFmri = max(fmri(:));
        minDti = min(dti(:));
        maxDti = max(dti(:));

        numBins = 200;
        step = (maxFmri-minFmri)/numBins;

        for i = minFmri:step:maxFmri-step
            avgDti = mean(dti(fmri >= i & fmri < (i+step)));
            avgFmri = (i + (i+step))/2;
            hold on;
            scatter(avgFmri, avgDti)
        end
    end
end
