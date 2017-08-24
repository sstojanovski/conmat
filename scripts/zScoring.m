function [fmriPts dtiPts] = zScoring(dtiList, fmriList, min, max)
    fmriSubjIDList = {};
    for i = 1:length(fmriList)
        fmriSplit = strsplit(char(fmriList(i)), '_');
        fmriSubjIDList(i) = cellstr(strjoin(fmriSplit(1:4), '_'));
    end

    index = 1;
    for dtiIndex = 1:length(dtiList)
        try
            dtiSplit = strsplit(char(dtiList(dtiIndex)), '_');
            dtiSubjID = strjoin(dtiSplit(1:4), '_');

            if any(ismember(fmriSubjIDList, dtiSubjID));
                fmriIndex = find(ismember(fmriSubjIDList, dtiSubjID));

                dti = csvread(char(dtiList(dtiIndex)), 1, 0);
                dtiData(:, index) = zscore(reshape(dti, 268*268, 1));

                fmri = csvread(char(fmriList(fmriIndex)));
                fmriData(:, index) = reshape(fmri, 268*268, 1);

                index = index + 1;
            end
        catch
            dtiSubjID
            continue
        end
    end
    fmriPts = fmriData(fmriData > min & fmriData < max);
    dtiPts = dtiData(fmriData > min & fmriData < max);
end
