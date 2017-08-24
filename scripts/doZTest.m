function output = doZTest
    listOfLists

    index = 1;

    pVals = [];
    tVals = [];
    dofs = [];

    for min = -1.0:0.1:0.9

        [A, B] = zScoring(connectivity_control_arm_1, fmri_control_arm_1, min, min+0.1);
        [C, D] = zScoring(length_control_arm_1, fmri_control_arm_1, min, min+0.1);
        [E, F] = zScoring(fa_mean_control_arm_1, fmri_control_arm_1, min, min+0.1);
        [G, H] = zScoring(md_mean_control_arm_1, fmri_control_arm_1, min, min+0.1);
        [I, J] = zScoring(length_weighted_control_arm_1, fmri_control_arm_1, min, min+0.1);
        [K, L] = zScoring(connectivity_weighted_control_arm_1, fmri_control_arm_1, min, min+0.1);

        [M, N] = zScoring(connectivity_case_arm_2, fmri_case_arm_2, min, min+0.1);
        [O, P] = zScoring(length_case_arm_2, fmri_case_arm_2, min, min+0.1);
        [Q, R] = zScoring(fa_mean_case_arm_2, fmri_case_arm_2, min, min+0.1);
        [S, T] = zScoring(md_mean_case_arm_2, fmri_case_arm_2, min, min+0.1);
        [U, V] = zScoring(length_weighted_case_arm_2, fmri_case_arm_2, min, min+0.1);
        [W, X] = zScoring(connectivity_weighted_case_arm_2, fmri_case_arm_2, min, min+0.1);

        controlData = vertcat(B, D, F, H, J, L);
        controlFmri = vertcat(A, C, E, G, I, K);

        caseData = vertcat(N, P, R, T, V, X);
        caseFmri = vertcat(M, O, Q, S, U, W);

        [~,p,~,stats] = ttest2(controlData, caseData, 'Vartype', 'unequal');
        pVals(1, index) = p;
        tVals(1, index) = stats.tstat;
        dofs(1, index) = stats.df;
        index = index + 1;
    end

    output = [pVals; tVals; dofs]
    csvwrite('/scratch/lliu/SPINS/analysis/tables/ztest_comb.csv', output);
end
