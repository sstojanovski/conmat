function output = binning(fmri, dti)

fmri = csvread(fmri);
fmri(find(fmri == 1)) = 0;

dti = csvread(dti);

minFmri = min(fmri(:));
maxFmri = max(fmri(:));
minDti = min(dti(:));
maxDti = max(dti(:));

numBins = 100;
step = (maxFmri-minFmri)/numBins;

for i = minFmri:step:maxFmri-step
    avgDti = mean(dti(fmri >= i & fmri < (i+step)));
    avgFmri = (i + (i+step))/2;
    hold on;
    scatter(avgFmri, avgDti)
end

end
