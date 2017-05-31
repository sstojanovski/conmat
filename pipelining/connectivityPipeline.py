#!/usr/bin/env python

import os
import glob
import shutil
import sys

#--------------------------------------------------------------------------------

# # enter project directory
# projectName = sys.argv[1]
# projectPath = '/archive/data-2.0/' + projectName + '/data/nii/'

# os.chdir(projectPath)

# projectSubjects = glob.glob('*')
# projectSubjects.sort()

# # for all the projects which have nii pipeline folders
# for subjectID in projectSubjects:
# 	if "PHA" not in subjectID:
# 		print(subjectID)
# 		# check for bedpostx pipeline and conmat do not exist already?

projectName = sys.argv[1]
subjectID = sys.argv[2]

bedpostXPipeDir = '/scratch/lliu/' + projectName + '/pipelines/bedpostX/' + subjectID + '/'
conmatPipeDir = '/scratch/lliu/' + projectName + '/pipelines/conmat/' + subjectID + '/'
dtiPipeDir = '/archive/data-2.0/' + projectName + '/pipelines/dtifit/' + subjectID + '/'
hcpPipeDir = '/archive/data-2.0/' + projectName + '/pipelines/hcp/' + subjectID + '/T1w/'
eyeFile = bedpostXPipeDir + subjectID + '.bedpostX/xfms/eye.mat'

dtiPipeDir = '/archive/data-2.0/' + projectName + '/pipelines/dtifit/' + subjectID + '/'
hcpPipeDir = '/archive/data-2.0/' + projectName + '/pipelines/hcp/' + subjectID + '/T1w/'
mniAtlasDir = '/projects/lliu/ImportantFiles/'
tempSubjDir = '/scratch/lliu/tmp/' + subjectID + '/'
tempSubjName = '/scratch/lliu/tmp/' + subjectID

bedpostXPipeDir = '/scratch/lliu/' + projectName + '/pipelines/bedpostX/' + subjectID + '/' + subjectID + '.bedpostX'
conmatPipeDir = '/scratch/lliu/' + projectName + '/pipelines/conmat/' + subjectID + '/' 

def main():
	if os.path.exists(dtiPipeDir):
		getFiles(projectName, subjectID)
		if not os.path.exists(bedpostXPipeDir):
			runBedpostX(projectName, subjectID)
		else:
			if not os.path.exists(conmatPipeDir):
				register(subjectID)
				runConmat(projectName, subjectID)
				removeTempFiles(subjectID)	

#--------------------------------------------------------------------------------

def getFiles(projName, subjID):
	if not os.path.exists(tempSubjDir):
		shutil.copytree(dtiPipeDir, tempSubjDir)
		shutil.copy(hcpPipeDir + 'wmparc.nii.gz', tempSubjDir)
		shutil.copy(hcpPipeDir + 'T1w_brain.nii.gz', tempSubjDir)
		shutil.copy(mniAtlasDir + 'shen_2mm_268_parcellation.nii.gz', tempSubjDir)
		shutil.copy(mniAtlasDir + 'MNI152_T1_2mm_brain.nii.gz', tempSubjDir)

def runBedpostX(projName, subjID):
	os.chdir(tempSubjDir)

	shutil.copyfile(tempSubjDir + glob.glob('*.bval')[0], tempSubjDir + 'bvals')
	shutil.copyfile(tempSubjDir + glob.glob('*.bvec')[0], tempSubjDir + 'bvecs')
	shutil.copyfile(tempSubjDir + glob.glob('*_eddy_correct_b0_bet_mask.nii.gz')[0], tempSubjDir + 'nodif_brain_mask.nii.gz')
	shutil.copyfile(tempSubjDir + glob.glob('*_eddy_correct.nii.gz')[0], tempSubjDir + 'data.nii.gz')

	# run bedpostX
	os.system('bedpostx ./')

	# copy the output *.bedpostX to targetPath
	flag = 0
	while flag != 1:
		if os.path.exists(eyeFile):
			shutil.copytree(tempSubjName + '.bedpostX', bedpostXPipeDir)
			flag == 1

def register(subjID):
	os.chdir(tempSubjDir)

	b0Mask = glob.glob('*_b0_bet_mask.nii.gz')[0] 
	b0Brain = glob.glob('*_b0_bet.nii.gz')[0] 
	T1wBrain = 'T1w_brain.nii.gz' 
	wmParc = 'wmparc.nii.gz' 
	mniBrain = 'MNI152_T1_2mm_brain.nii.gz' 
	shenParc = 'shen_2mm_268_parcellation.nii.gz' 

	os.system('echo "registering b0-T1"')
	os.system('flirt \
		-in ' + b0Brain + ' \
		-ref ' + T1wBrain + ' \
		-omat tfm.mat')

	os.system('convert_xfm \
		-omat tfm_invert.mat \
		-inverse tfm.mat')

	os.system('echo "registering white matter mask"')
	os.system('flirt \
		-in ' + wmParc + ' \
		-ref ' + b0Brain + ' \
		-applyxfm \
		-init tfm_invert.mat \
		-o wmparc_invert.nii.gz')

	os.system('fslmaths \
		wmparc_invert.nii.gz \
		-thr 2500 \
		-bin wmparc_invert_bin.nii.gz')

	os.system('echo "registering MNI"')
	os.system('flirt \
		-in ' + mniBrain + ' \
		-ref ' + b0Brain + ' \
		-interp nearestneighbour \
		-omat mni.mat')

	os.system('echo "registering atlas"')
	os.system('flirt \
		-in ' + shenParc + ' \
		-ref ' + b0Brain + ' \
		-interp nearestneighbour \
		-applyxfm \
		-init mni.mat \
		-o atlas.nii.gz')

def runConmat(projName, subjID):
	os.chdir(tempSubjDir)

	os.system('echo "streamlining"')
	os.system('track \
		-bedpostxdir ' + tempSubjName + '.bedpostX' + ' \
		-inputmodel bedpostx_dyad \
		-seedfile wmparc_invert_bin.nii.gz \
		-curvethresh 90 \
		-curveinterval 2.5 \
		-anisthresh 0.2 \
		-tracker rk4 \
		-interpolator linear \
		-iterations 1000 \
		-brainmask nodif_brain_mask.nii.gz | procstreamlines \
		-endpointfile atlas.nii.gz \
		-outputfile bedDetTracts.Bfloat')

	os.system('echo "calculating connectivity matrix"')
	os.system('conmat \
		-inputfile bedDetTracts.Bfloat \
		-targetfile atlas.nii.gz \
		-tractstat length \
		-outputroot ' + subjID + '_bedpostX_det_')

	os.makedirs(conmatPipeDir)
	shutil.copyfile(tempSubjDir + glob.glob('*_sc.csv')[0], conmatPipeDir + subjID + '_bedpostX_det_connectivity.csv')
	shutil.copyfile(tempSubjDir + glob.glob('*_ts.csv')[0], conmatPipeDir + subjID + '_bedpostX_det_length.csv')

def removeTempFiles(subjID):
	shutil.rmtree(tempSubjDir)
	shutil.rmtree(tempSubjDir + '.bedpostX')

#--------------------------------------------------------------------------------

if __name__ == '__main__':
	main()