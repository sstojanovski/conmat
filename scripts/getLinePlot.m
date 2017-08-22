function output = getLinePlot(controlList, caseList, fmri_control, fmri_case)
    index = 1;
    for min = -1.0:0.1:0.9
        controlData = noBinning(controlList, fmri_control, min, min+0.1);
        caseData = noBinning(caseList, fmri_case, min, min+0.1);

        controlY(1, index) = mean(controlData);
        controlErr(1, index) = std(controlY)/sqrt(length(controlY));

        caseY(1, index) = mean(caseData);
        caseErr(1, index) = std(caseY)/sqrt(length(caseY));

        index = index + 1;
    end

    figure
    hold on
    errorbar(matrix(1,:), controlY(1,:), controlErr(1,:), 'b')
    errorbar(matrix(1,:), caseY(1,:), caseErr(1,:), 'r')

end
