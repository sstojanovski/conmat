listOfLists

scatterPlotting(connectivity_control_arm_1, fmri_control_arm_1)
title('CONTROL: Streamline Count vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Streamline Count')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/scatter_ctrl_streamline_count.fig')
close all

scatterPlotting(connectivity_case_arm_2, fmri_case_arm_2)
title('CASE: Streamline Count vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Streamline Count')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/scatter_case_streamline_count.fig')
close all

%---------------------------------------------------------------------------

dtifmriBinning(connectivity_control_arm_1, fmri_control_arm_1)
title('CONTROL: Streamline Count vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Streamline Count')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_ctrl_streamline_count.fig')
close all

dtifmriBinning(connectivity_case_arm_2, fmri_case_arm_2)
title('CASE: Streamline Count vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Streamline Count')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_case_streamline_count.fig')
close all

%--------------------------------------------------------------------------

// getLinePlotBin(controlList, caseList, fmri_control, fmri_case)
//
// getLinePlot(controlList, caseList, fmri_control, fmri_case)
