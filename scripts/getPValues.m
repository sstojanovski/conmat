listOfLists

% csvwrite('/scratch/lliu/SPINS/analysis/tables/compare_streamline_count.csv', doTTest(connectivity_control_arm_1, connectivity_case_arm_2, fmri_control_arm_1, fmri_case_arm_2))
% csvwrite('/scratch/lliu/SPINS/analysis/tables/compare_length.csv', doTTest(length_control_arm_1, length_case_arm_2, fmri_control_arm_1, fmri_case_arm_2))
% csvwrite('/scratch/lliu/SPINS/analysis/tables/compare_mean_fa.csv', doTTest(fa_mean_control_arm_1, fa_mean_case_arm_2, fmri_control_arm_1, fmri_case_arm_2))
csvwrite('/scratch/lliu/SPINS/analysis/tables/compare_mean_md.csv', doTTest(md_mean_control_arm_1, md_mean_case_arm_2, fmri_control_arm_1, fmri_case_arm_2))
csvwrite('/scratch/lliu/SPINS/analysis/tables/compare_length_weighted.csv', doTTest(length_weighted_control_arm_1, length_weighted_case_arm_2, fmri_control_arm_1, fmri_case_arm_2))
csvwrite('/scratch/lliu/SPINS/analysis/tables/compare_connectivity_weighted.csv', doTTest(connectivity_weighted_control_arm_1, connectivity_weighted_case_arm_2, fmri_control_arm_1, fmri_case_arm_2))
csvwrite('/scratch/lliu/SPINS/analysis/tables/compare_presence.csv', doFisherTest(connectivity_control_arm_1, connectivity_case_arm_2, fmri_control_arm_1, fmri_case_arm_2))

%// doZTest(controlList, caseList, fmri_control, fmri_case)
