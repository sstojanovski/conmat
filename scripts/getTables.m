listOfLists

getPValues

csvwrite('/scratch/lliu/SPINS/analysis/tables/slopes_ctrl_streamline_count.csv', getSlopes(connectivity_control_arm_1, fmri_control_arm_1))
csvwrite('/scratch/lliu/SPINS/analysis/tables/slopes_ctrl_length.csv', getSlopes(length_control_arm_1, fmri_control_arm_1))
csvwrite('/scratch/lliu/SPINS/analysis/tables/slopes_ctrl_fa_mean.csv', getSlopes(fa_mean_control_arm_1, fmri_control_arm_1))
csvwrite('/scratch/lliu/SPINS/analysis/tables/slopes_ctrl_md_mean.csv', getSlopes(md_mean_control_arm_1, fmri_control_arm_1))
csvwrite('/scratch/lliu/SPINS/analysis/tables/slopes_ctrl_length_weighted_mean.csv', getSlopes(length_weighted_control_arm_1, fmri_control_arm_1))
csvwrite('/scratch/lliu/SPINS/analysis/tables/slopes_ctrl_volume_weighted_mean.csv', getSlopes(connectivity_weighted_control_arm_1, fmri_control_arm_1))

csvwrite('/scratch/lliu/SPINS/analysis/tables/slopes_case_streamline_count.csv', getSlopes(connectivity_case_arm_2, fmri_case_arm_2))
csvwrite('/scratch/lliu/SPINS/analysis/tables/slopes_case_length.csv', getSlopes(length_case_arm_2, fmri_case_arm_2))
csvwrite('/scratch/lliu/SPINS/analysis/tables/slopes_case_fa_mean.csv', getSlopes(fa_mean_case_arm_2, fmri_case_arm_2))
csvwrite('/scratch/lliu/SPINS/analysis/tables/slopes_case_md_mean.csv', getSlopes(md_mean_case_arm_2, fmri_case_arm_2))
csvwrite('/scratch/lliu/SPINS/analysis/tables/slopes_case_length_weighted_mean.csv', getSlopes(length_weighted_case_arm_2, fmri_case_arm_2))
csvwrite('/scratch/lliu/SPINS/analysis/tables/slopes_case_volume_weighted_mean.csv', getSlopes(connectivity_weighted_case_arm_2, fmri_case_arm_2))
