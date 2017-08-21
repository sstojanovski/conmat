function [fmriPts dtiPts] = zScoring(dtiList, fmriList, minimum, maximum)
    fmriSubjIDList = {};
    for i = 1:length(fmriList)
        fmriSplit = strsplit(char(fmriList(i)), '_');
        fmriSubjIDList(i) = cellstr(strjoin(fmriSplit(1:4), '_'));
    end

    i = 1;
    for dtiIndex = 1:length(dtiList)
        try
            dtiSplit = strsplit(char(dtiList(dtiIndex)), '_');
            dtiSubjID = strjoin(dtiSplit(1:4), '_');

            if any(ismember(fmriSubjIDList, dtiSubjID));
                fmriIndex = find(ismember(fmriSubjIDList, dtiSubjID));

                dti = csvread(char(dtiList(dtiIndex)), 1, 0);
                dti = reshape(dti, 268*268, 1);

                fmri = csvread(char(fmriList(fmriIndex)));
                fmri = reshape(fmri, 268*268, 1);

                Y = dti(fmri(:) > minimum & fmri(:) < maximum);
                dtiValues{:,i} = Y;

                X = fmri(fmri(:) > minimum & fmri(:) < maximum);
                fmriValues{:,i} = X;

                i = i + 1;
            end
        catch
            dtiSubjID
            continue
        end
    end
    dtiPts = zscore(cell2mat(reshape(dtiValues, [], 1)));
    fmriPts = cell2mat(reshape(fmriValues, [], 1));

end
