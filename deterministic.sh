#!/bin/bash

##SETUP
. $MODULESHOME/init/bash
module load camino
module load FSL
module load matlab
module load paraview

##INPUTS

bvecFile=SPN01_CMH_P001_01_01_DTI60-1000_17_Ax-DTI-60plus5_eddy_correct.bvec
bvalFile=SPN01_CMH_P001_01_01_DTI60-1000_17_Ax-DTI-60plus5_eddy_correct.bval
multiVol=SPN01_CMH_P001_01_01_DTI60-1000_17_Ax-DTI-60plus5_eddy_correct.nii.gz
b0Mask=SPN01_CMH_P001_01_01_DTI60-1000_17_Ax-DTI-60plus5_eddy_correct_b0_bet_mask.nii.gz
b0Brain=SPN01_CMH_P001_01_01_DTI60-1000_17_Ax-DTI-60plus5_eddy_correct_b0_bet.nii.gz
T1wBrain=T1w_brain.nii.gz
wmParc=wmparc.nii.gz
mniBrain=MNI152_T1_2mm_brain.nii.gz
shenAtlas=shen_2mm_268_parcellation.nii.gz

#get T1w_brain, wmparc, shen, MNI

echo "making scheme file"
fsl2scheme -bvecfile ${bvecFile} -bvalfile ${bvalFile} > bVectorScheme.scheme
echo
echo "registering b0-T1"
flirt -in ${b0Brain} -ref ${T1wBrain} -omat tfm.mat
convert_xfm -omat tfm_invert.mat -inverse tfm.mat
echo
echo "registering white matter mask"
flirt -in ${wmParc} -ref ${b0Brain} -applyxfm -init tfm_invert.mat -o wmparc_invert.nii.gz
fslmaths wmparc_invert.nii.gz -thr 2500 -bin wmparc_invert_bin.nii.gz
echo
echo "registering MNI"
flirt -in ${mniBrain} -ref ${b0Brain} -interp nearestneighbour -omat mni.mat
echo
echo "registering atlas"
flirt -in ${shenAtlas} -ref ${b0Brain} -interp nearestneighbour -applyxfm -init mni.mat -o atlas.nii.gz
echo

#***************************************************************************
#DETERMINISTIC TRACTOGRAPHY
echo "fitting tensors"
wdtfit ${multiVol} A.scheme -brainmask ${b0Mask} -outputfile wdt.nii.gz
echo
echo "streamlining"
track -inputfile wdt.nii.gz -inputmodel dt -seedfile wmparc_invert_bin.nii.gz -curvethresh 90 -curveinterval 2.5 -anisthresh 0.2 -tracker rk4 -interpolator linear -stepsize 0.5 \
-brainmask ${b0Mask} | procstreamlines -endpointfile atlas.nii.gz -outputfile detTracts.Bfloat
echo
#***************************************************************************
#CONNECTIVITY MATRIX
fa -inputfile wdt.nii.gz -outputfile fa.nii.gz

echo "calculating connectivity matrix"
conmat -inputfile detTracts.Bfloat -targetfile atlas.nii.gz -scalarfile fa.nii.gz -tractstat min -outputroot conmat_
echo
#***************************************************************************
#visuals
vtkstreamlines -colourorient < detTracts.Bfloat > detTracts.vtk
paraview detTracts.vtk

matlab
# conmat_path = 'conmat_ts.csv';
# myconmat = csvread(conmat_path, 1, 0);
# figure, imagesc(myconmat)