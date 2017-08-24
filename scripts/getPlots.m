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

scatterPlotting(length_control_arm_1, fmri_control_arm_1)
title('CONTROL: Mean Streamline Length vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline Length')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/scatter_ctrl_length.fig')
close all

scatterPlotting(length_case_arm_2, fmri_case_arm_2)
title('CASE: Mean Streamline Length vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline Length')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/scatter_case_length.fig')
close all

scatterPlotting(fa_mean_control_arm_1, fmri_control_arm_1)
title('CONTROL: Mean Streamline Fractional Anisotropy vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline FA')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/scatter_ctrl_fa_mean.fig')
close all

scatterPlotting(fa_mean_case_arm_2, fmri_case_arm_2)
title('CASE: Mean Streamline Fractional Anisotropy vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline FA')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/scatter_case_fa_mean.fig')
close all

scatterPlotting(md_mean_control_arm_1, fmri_control_arm_1)
title('CONTROL: Mean Streamline Mean Diffusivity vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline MD')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/scatter_ctrl_md_mean.fig')
close all

scatterPlotting(md_mean_case_arm_2, fmri_case_arm_2)
title('CASE: Mean Streamline Mean Diffusivity vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline MD')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/scatter_case_md_mean.fig')
close all

scatterPlotting(length_weighted_control_arm_1, fmri_control_arm_1)
title('CONTROL: Length-Weighted Streamline Density vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Length-Weighted Streamline Density')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/scatter_ctrl_length_weighted.fig')
close all

scatterPlotting(length_weighted_case_arm_2, fmri_case_arm_2)
title('CASE: Length-Weighted Streamline Density vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Length-Weighted Streamline Density')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/scatter_case_length_weighted.fig')
close all

scatterPlotting(connectivity_weighted_control_arm_1, fmri_control_arm_1)
title('CONTROL: Volume-Weighted Streamline Density vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Volume-Weighted Streamline Density')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/scatter_ctrl_volume_weighted.fig')
close all

scatterPlotting(connectivity_weighted_case_arm_2, fmri_case_arm_2)
title('CASE: Volume-Weighted Streamline Density vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Volume-Weighted Streamline Density')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/scatter_case_volume_weighted.fig')
close all

%---------------------------------------------------------------------------

dtifmriBinningBin(connectivity_control_arm_1, fmri_control_arm_1)
title('CONTROL: Connection Presence vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Connection Presence (%)')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_ctrl_connection_presence.fig')
close all

dtifmriBinningBin(connectivity_case_arm_2, fmri_case_arm_2)
title('CASE: Connection Presence vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Connection Presence (%)')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_case_connection_presence.fig')
close all

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

dtifmriBinning(length_control_arm_1, fmri_control_arm_1)
title('CONTROL: Mean Streamline Length vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline Length')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_ctrl_length.fig')
close all

dtifmriBinning(length_case_arm_2, fmri_case_arm_2)
title('CASE: Mean Streamline Length vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline Length')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_case_length.fig')
close all

dtifmriBinning(fa_mean_control_arm_1, fmri_control_arm_1)
title('CONTROL: Mean Streamline Fractional Anisotropy vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline FA')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_ctrl_fa_mean.fig')
close all

dtifmriBinning(fa_mean_case_arm_2, fmri_case_arm_2)
title('CASE: Mean Streamline Fractional Anisotropy vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline FA')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_case_fa_mean.fig')
close all

dtifmriBinning(md_mean_control_arm_1, fmri_control_arm_1)
title('CONTROL: Mean Streamline Mean Diffusivity vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline MD')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_ctrl_md_mean.fig')
close all

dtifmriBinning(md_mean_case_arm_2, fmri_case_arm_2)
title('CASE: Mean Streamline Mean Diffusivity vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline MD')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_case_md_mean.fig')
close all

dtifmriBinning(length_weighted_control_arm_1, fmri_control_arm_1)
title('CONTROL: Length-Weighted Streamline Density vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Length-Weighted Streamline Density')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_ctrl_length_weighted.fig')
close all

dtifmriBinning(length_weighted_case_arm_2, fmri_case_arm_2)
title('CASE: Length-Weighted Streamline Density vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Length-Weighted Streamline Density')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_case_length_weighted.fig')
close all

dtifmriBinning(connectivity_weighted_control_arm_1, fmri_control_arm_1)
title('CONTROL: Volume-Weighted Streamline Density vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Volume-Weighted Streamline Density')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_ctrl_volume_weighted.fig')
close all

dtifmriBinning(connectivity_weighted_case_arm_2, fmri_case_arm_2)
title('CASE: Volume-Weighted Streamline Density vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Volume-Weighted Streamline Density')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/binning_case_volume_weighted.fig')
close all

--------------------------------------------------------------------------

getLinePlotBin(connectivity_control_arm_1, connectivity_case_arm_2, fmri_control_arm_1, fmri_case_arm_2)
title('CONTROL vs. CASE: Connection Presence vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Connection Presence (%)')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/line_comb_connection_presence.fig')
close all

getLinePlot(connectivity_control_arm_1, connectivity_case_arm_2, fmri_control_arm_1, fmri_case_arm_2)
title('CONTROL vs. CASE: Streamline Count vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Streamline Count')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/line_comb_streamline_count.fig')
close all

getLinePlot(length_control_arm_1, length_case_arm_2, fmri_control_arm_1, fmri_case_arm_2)
title('CONTROL vs. CASE: Mean Streamline Length vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline Length')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/line_comb_length.fig')
close all

getLinePlot(fa_mean_control_arm_1, fa_mean_case_arm_2, fmri_control_arm_1, fmri_case_arm_2)
title('CONTROL vs. CASE: Mean Streamline Fractional Anisotropy vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline FA')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/line_comb_fa_mean.fig')
close all

getLinePlot(md_mean_control_arm_1, md_mean_case_arm_2, fmri_control_arm_1, fmri_case_arm_2)
title('CONTROL vs. CASE: Mean Streamline Mean Diffusivity vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Mean Streamline MD')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/line_comb_md_mean.fig')
close all

getLinePlot(length_weighted_control_arm_1, length_weighted_case_arm_2, fmri_control_arm_1, fmri_case_arm_2)
title('CONTROL vs. CASE: Length-Weighted Streamline Density vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Length-Weighted Streamline Density')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/line_comb_length_weighted.fig')
close all

getLinePlot(connectivity_weighted_control_arm_1, connectivity_weighted_case_arm_2, fmri_control_arm_1, fmri_case_arm_2)
title('CONTROL vs. CASE: Volume-Weighted Streamline Density vs. fMRI Correlation')
xlabel('fMRI Correlation')
ylabel('Volume-Weighted Streamline Density')
saveas(gcf, '/scratch/lliu/SPINS/analysis/figures/line_comb_volume_weighted.fig')
close all
