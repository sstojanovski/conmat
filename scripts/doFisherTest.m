function output = doFisherTest(controlList, caseList, fmri_control, fmri_case)
    index = 1;

    pVals = [];
    oddsRs = [];
    for min = -1.0:0.1:0.9
        controlData = noBinning(controlList, fmri_control, min, min+0.1);
        caseData = noBinning(caseList, fmri_case, min, min+0.1);

        controlPres(1,index) = nnz(controlData);
        controlAbs(1,index) = sum(controlData(:)==0);

        casePres(1,index) = nnz(caseData);
        caseAbs(1,index) = sum(caseData(:)==0);

        [~, p, stats] = fishertest([controlPres(1,index) controlAbs(1,index); casePres(1,index) caseAbs(1,index)])
        pVals(1,index) = p
        oddsRs(1,index) = struct.OddsRatio

        index = index + 1;
    end
    output = [pVals; oddsRs]
end
