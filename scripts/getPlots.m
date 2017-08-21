getScatterPlot(connectivity_control_arm_1, fmri_control_arm_1)
title('CONTROL: Streamline Count vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Streamline Count')
saveas(gcf, '/scratch/lliu/SPINS/analysis/scatter_ctrl_streamline_count.fig')
close all

getScatterPlot(connectivity_case_arm_2, fmri_case_arm_2)
title('CASE: Streamline Count vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Streamline Count')
saveas(gcf, '/scratch/lliu/SPINS/analysis/scatter_case_streamline_count.fig')
close all
