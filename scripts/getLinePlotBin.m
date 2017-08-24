function output = getLinePlotBin(controlList, caseList, fmri_control, fmri_case)

    xCoords(1,:) = [-0.95:0.1:0.95];
    index = 1;
    for min = -1.0:0.1:0.9
        controlData = noBinning(controlList, fmri_control, min, min+0.1);
        caseData = noBinning(caseList, fmri_case, min, min+0.1);

        controlPres(1, index) = nnz(controlData);
        controlAbs(1, index) = sum(controlData(:)==0);
        controlY(1, index) = controlPres(1, index)./(controlPres(1, index)+controlAbs(1, index));
        controlErr(1, index) = std(controlY)/sqrt(length(controlY));

        casePres(1, index) = nnz(caseData);
        caseAbs(1, index) = sum(caseData(:)==0);
        caseY(1, index) = casePres(1, index)./(casePres(1, index)+caseAbs(1, index));
        caseErr(1, index) = std(caseY)/sqrt(length(caseY));

        index = index + 1;
    end

    figure
    hold on
    errorbar(xCoords(1,:), controlY(1,:), controlErr(1,:), 'b')
    errorbar(xCoords(1,:), caseY(1,:), caseErr(1,:), 'r')
end
