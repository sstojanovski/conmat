function output = dtifmriBinning(dtiList, fmriList)
    
    fmriSubjIDList = {};
    for i = 1:length(fmriList)
        fmriSplit = strsplit(char(fmriList(i)), '_');
        fmriSubjIDList(i) = cellstr(strjoin(fmriSplit(1:4), '_'));
    end
    
    figure

    for dtiIndex = 1:length(dtiList)
        try
            dtiSplit = strsplit(char(dtiList(dtiIndex)), '_');
            dtiSubjID = strjoin(dtiSplit(1:4), '_');
            
            if any(ismember(fmriSubjIDList, dtiSubjID))
                
                fmriIndex = find(ismember(fmriSubjIDList, dtiSubjID));

                dti = csvread(char(dtiList(dtiIndex)), 1, 0);

%                 dti(dti > 0) = 1;
                dti = reshape(dti, 268*268, 1);

                fmri = csvread(char(fmriList(fmriIndex)));
                fmri = reshape(fmri, 268*268, 1);

                minFmri = min(fmri(:));
                maxFmri = max(fmri(:));
        %         minFmri = -1;
        %         maxFmri = 1;
                minDti = min(dti(:));
                maxDti = max(dti(:));

                numBins = 500;
                step = (maxFmri-minFmri)/numBins;

                for i = minFmri:step:maxFmri-step
                    avgDti = mean(dti(fmri >= i & fmri < (i+step)));
                    avgFmri = (i + (i+step))/2;
                    hold on;
                    scatter(avgFmri, avgDti, 3, 'k')
                end
            end
        catch 
            continue;
        end
    end
end
