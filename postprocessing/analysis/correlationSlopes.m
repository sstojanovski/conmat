function output = correlationSlopes(dtiList, fmriList)
    
    fmriSubjIDList = {};
    for i = 1:length(fmriList)
        fmriSplit = strsplit(char(fmriList(i)), '_');
        fmriSubjIDList(i) = cellstr(strjoin(fmriSplit(1:4), '_'));
    end
    
    subjData(1,:) = {'subjectID' 'slope_neg' 'slope_null' 'slope_pos'};
    subjIndex = 2;
    
    file = fopen('cool.csv', 'w');
    fprintf(file, '%s,%s,%s,%s\n', subjData{1,:});
    
    for dtiIndex = 1:length(dtiList)
        try
            dtiSplit = strsplit(char(dtiList(dtiIndex)), '_');
            dtiSubjID = strjoin(dtiSplit(1:4), '_');
            
            if any(ismember(fmriSubjIDList, dtiSubjID))
  
                dtiSubj(1)= dtiList(dtiIndex);
                fmriSubj(1) = fmriList(find(ismember(fmriSubjIDList, dtiSubjID)));
                
                slope_neg = dtifmriStrength(dtiSubj, fmriSubj, -1.0, -0.35);
                slope_null = dtifmriStrength(dtiSubj, fmriSubj, -0.35, 0.35);
                slope_pos = dtifmriStrength(dtiSubj, fmriSubj, 0.35, 1.0);
                
                subjData(subjIndex,:) = {dtiSubjID slope_neg slope_null slope_pos};
                
                fprintf(file, '%s,%f,%f,%f\n', subjData{subjIndex,:});
                subjIndex = subjIndex + 1;
		
                close all
            end
        catch
            dtiSubjID
            continue
        end
    end
    fclose(file);
end




