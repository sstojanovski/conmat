mkdir pico

##INPUTS

bvecFile=SPN01_CMH_0001_01_01_DTI60-1000_20_Ax-DTI-60plus5_eddy_correct.bvec
bvalFile=SPN01_CMH_0001_01_01_DTI60-1000_20_Ax-DTI-60plus5_eddy_correct.bval
multiVol=SPN01_CMH_0001_01_01_DTI60-1000_20_Ax-DTI-60plus5_eddy_correct.nii.gz
b0Mask=SPN01_CMH_0001_01_01_DTI60-1000_20_Ax-DTI-60plus5_eddy_correct_b0_bet_mask.nii.gz
b0Brain=SPN01_CMH_0001_01_01_DTI60-1000_20_Ax-DTI-60plus5_eddy_correct_b0_bet.nii.gz

#get T1w_brain, wmparc, shen, MNI

echo "making scheme file"
fsl2scheme -bvecfile ${bvecFile} -bvalfile ${bvalFile} > A.scheme
echo "registering b0-T1"
flirt -in ${b0Brain} -ref T1w_brain.nii.gz -omat tfm.mat
convert_xfm -omat tfm_invert.mat -inverse tfm.mat
echo "registering white matter mask"
flirt -in wmparc.nii.gz -ref ${b0Brain} -applyxfm -init tfm_invert.mat -o wmparc_invert.nii.gz
fslmaths wmparc_invert.nii.gz -thr 2500 -bin wmparc_invert_bin.nii.gz
echo "registering MNI"
flirt -in MNI152_T1_2mm_brain.nii.gz -ref ${b0Brain} -interp nearestneighbour -omat mni.mat
echo "registering atlas"
flirt -in shen_2mm_268_parcellation.nii.gz -ref ${b0Brain} -interp nearestneighbour -applyxfm -init mni.mat -o atlas.nii.gz

echo "converting DWI to Camino format"
image2voxel -4dimage ${multiVol} -outputfile dwi.Bfloat

for PROG in fa md 
do cat dt.Bdouble | ${PROG} | voxel2image -outputroot ${PROG} -header ${multiVol}
done
cat dt.Bdouble | dteig > dteig.Bdouble
# pdview -inputfile dteig.Bdouble -scalarfile fa.nii.gz

#***************************************************************************
#PROBABILISTIC TRACTOGRAPHY
echo "fitting tensors"
modelfit -inputfile dwi.Bfloat -schemefile A.scheme -model ldt -brainmask ${b0Mask} -outputfile dt.Bdouble

echo "calculating snr"
signalNoiseRatio=$(estimatesnr -inputfile dwi.Bfloat -schemefile A.scheme -bgmask ${b0Mask} | grep "SNR mult" | tr "\t" " " | tr -s " " | cut -d " " -f3)

echo "generating look-up table"
dtlutgen -schemefile A.scheme -snr ${signalNoiseRatio} > picoTable.dat

echo "generating Probability Density Functions (PDFs) in each voxel"
picopdfs -inputmodel dt -luts picoTable.dat < dt.Bdouble > pdfs.Bdouble

echo "streamlining"
track -inputmodel pico -seedfile wmparc_invert_bin.nii.gz -iterations 100 < pdfs.Bdouble > picoTracts.Bfloat

#***************************************************************************
#CONNECTIVITY MATRIX

echo "calculating connectivity matrix"
conmat -inputfile picoTracts.Bfloat -targetfile atlas.nii.gz -scalarfile fa.nii.gz -tractstat min -outputroot conmat_

#***************************************************************************
#visuals
# for visualizing picoTracts and ROI probability

track -inputmodel pico -seedfile wmparc_invert_bin.nii.gz < pdfs.Bdouble | procstreamlines -seedfile wmparc_invert_bin.nii.gz -outputacm -outputroot pico/
track -inputmodel pico -seedfile wmparc_invert_bin.nii.gz < pdfs.Bdouble | procstreamlines -seedfile wmparc_invert_bin.nii.gz -outputcp -outputroot pico/
imagestats -stat max -outputroot roiprobs -images pico/*

# fslview pico/acm_sc.nii.gz
# fslview roiprobs.nii.gz

# matlab
# conmat_path = 'conmat_ts.csv';
# myconmat = csvread(conmat_path, 1, 0);
# figure, imagesc(myconmat)