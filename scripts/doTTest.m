function output = doTTest(controlList, caseList, fmri_control, fmri_case)
    index = 1;

    pVals = [];
    tVals = [];
    dofs = [];
    
    for min = -1.0:0.1:0.9
        controlData = noBinning(controlList, fmri_control, min, min+0.1);
        caseData = noBinning(caseList, fmri_case, min, min+0.1);
        [~,p,~,stats] = ttest2(controlData, caseData, 'Vartype', 'unequal');
        pVals(1, index) = p;
        tVals(1, index) = stats.tstat;
        dofs(1, index) = stats.df;
        index = index + 1;
    end
    output = [pVals; tVals; dofs]
end
