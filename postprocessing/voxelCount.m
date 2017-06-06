% in bash 
% module load freesurfer
% module load SPM

niiFile = 'shen_2mm_268_parcellation.nii';
headerInfo = spm_vol(niiFile);
data = spm_read_vols(headerInfo);
voxels = [];

for i = 1:268
    voxels(i) = length(find(data == i));
end

csvwrite('voxelROI.csv', voxels);