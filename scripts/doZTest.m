function output = doZTest(controlList, caseList, fmri_control, fmri_case)
    index = 1;

    pVals = [];
    chiVals = [];
    for min = -1.0:0.1:0.9

        [~,controlData] = zScoring(controlList, fmri_control, min, min+0.1);
        [~,caseData] = zScoring(caseList, fmri_case, min, min+0.1);
        [h,p,ci,stats] = ttest2(controlData, caseData, 'Vartype', 'unequal');
        pVals(1, index) = p

        index = index + 1;
    end

    output = pVals
end
