function output = correlationSloping(dtiList, fmriList, min, max)

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
                dti = reshape(dti, 268*268, 1);

                fmri = csvread(char(fmriList(fmriIndex)));
                fmri = reshape(fmri, 268*268, 1);

                fmriData = fmri(fmri(:) > minimum & fmri(:) < maximum)
                dtiData = dti(fmri(:) > minimum & fmri(:) < maximum)

                scatter(fmriData, dtiData, 3, 'k')
            end
        catch
            dtiSubjID
            continue
        end
    end
    M = lsline;
    slopeIntercept = polyfit(get(M, 'xdata'), get(M, 'ydata'), 1);
    output = slopeIntercept(1, 1);
end
