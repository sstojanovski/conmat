function output = correlationSlopes(dtiList, fmriList, parameter_status)
    
    fmriSubjIDList = {};
    for i = 1:length(fmriList)
        fmriSplit = strsplit(char(fmriList(i)), '_');
        fmriSubjIDList(i) = cellstr(strjoin(fmriSplit(1:4), '_'));
    end
    
%     subjData(1,:) = {'subjectID' 'slope_neg' 'slope_null' 'slope_pos'};
    subjData(1,:) = {'subjectID' 'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T'};
    subjIndex = 2;
    
    fileName = strcat(parameter_status, '_correlationSlopes.csv')
    file = fopen(fileName, 'w');
    fprintf(file, '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,\n', subjData{1,:});
    
    for dtiIndex = 1:length(dtiList)
        try
            dtiSplit = strsplit(char(dtiList(dtiIndex)), '_');
            dtiSubjID = strjoin(dtiSplit(1:4), '_');
            
            if any(ismember(fmriSubjIDList, dtiSubjID))
  
                dtiSubj(1)= dtiList(dtiIndex);
                fmriSubj(1) = fmriList(find(ismember(fmriSubjIDList, dtiSubjID)));
                
%                 slope_neg = dtifmriStrength(dtiSubj, fmriSubj, -1.0, -0.35);
%                 slope_null = dtifmriStrength(dtiSubj, fmriSubj, -0.35, 0.35);
%                 slope_pos = dtifmriStrength(dtiSubj, fmriSubj, 0.35, 1.0);
                
                A = dtifmriStrength(dtiSubj, fmriSubj, -1.0, -0.9);
                B = dtifmriStrength(dtiSubj, fmriSubj, -0.9, -0.8);
                C = dtifmriStrength(dtiSubj, fmriSubj, -0.8, -0.7);
                D = dtifmriStrength(dtiSubj, fmriSubj, -0.7, -0.6);
%                 E = 0;
%                 F = 0;
%                 G = 0;
%                 H = 0;
%                 I = 0;
%                 J = 0;
%                 K = 0;
%                 L = 0;
%                 M = 0;
%                 N = 0;
%                 O = 0;
%                 P = 0;
%                 Q = 0;
%                 R = 0;
%                 S = 0;
%                 T = 0;
      
                E = dtifmriStrength(dtiSubj, fmriSubj, -0.6, -0.5);
                F = dtifmriStrength(dtiSubj, fmriSubj, -0.5, -0.4);
                G = dtifmriStrength(dtiSubj, fmriSubj, -0.4, -0.3);
                H = dtifmriStrength(dtiSubj, fmriSubj, -0.3, -0.2);
                I = dtifmriStrength(dtiSubj, fmriSubj, -0.2, -0.1);
                J = dtifmriStrength(dtiSubj, fmriSubj, -0.1, 0.0);
                K = dtifmriStrength(dtiSubj, fmriSubj, 0.0, 0.1);
                L = dtifmriStrength(dtiSubj, fmriSubj, 0.1, 0.2);
                M = dtifmriStrength(dtiSubj, fmriSubj, 0.2, 0.3);
                N = dtifmriStrength(dtiSubj, fmriSubj, 0.3, 0.4);
                O = dtifmriStrength(dtiSubj, fmriSubj, 0.4, 0.5);
                P = dtifmriStrength(dtiSubj, fmriSubj, 0.5, 0.6);
                Q = dtifmriStrength(dtiSubj, fmriSubj, 0.6, 0.7);
                R = dtifmriStrength(dtiSubj, fmriSubj, 0.7, 0.8);
                S = dtifmriStrength(dtiSubj, fmriSubj, 0.8, 0.9);
                T = dtifmriStrength(dtiSubj, fmriSubj, 0.9, 1.0);

                
                subjData(subjIndex,:) = {dtiSubjID A B C D E F G H I J K L M N O P Q R S T};
                
                fprintf(file, '%s,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n', subjData{subjIndex,:});
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




