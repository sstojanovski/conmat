function output = procFile(inputFile)

if strfind(inputFile, 'fmri')
    output = csvread(inputFile);

    output(find(output == 1)) = 0;

%     % filter out bottom x%
%     output(find(output<max(output(:))*0.45)) = 0;

    % mask dti image on fmri
    combineDetProb(inputFile(1:8));
    correspondDTI = strcat(inputFile(1:8), 'comb.csv');
    output(find(procFile(correspondDTI) == 0)) = 0;

%     figure, imagesc(output)
%     title(inputFile)

elseif strfind(inputFile, 'comb')
    output = csvread(inputFile);
%     figure, imagesc(output)
%     title(inputFile)
else
    output = csvread(inputFile, 1, 0);
%     figure, imagesc(output)
%     title(inputFile)
end
output = reshape(output, 268*268, 1);
end
