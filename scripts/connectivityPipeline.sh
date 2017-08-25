#!/bin/bash -e
. $MODULESHOME/init/bash
module load camino/1886d5
module load FSL/5.0.10
module load python
module load AFNI

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# enter project directory
projectName=SPINS
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
projectPath=/archive/data-2.0/${projectName}/data/nii/
projectDir=/scratch/lliu/${projectName}/

if [ ! -d "${projectDir}" ]
	then
	cd /scratch/lliu/ | mkdir ${projectDir}
	cd ${projectDir}

	mkdir bedpostX
	mkdir conmat
fi

cd ${projectPath}

for subjectID in *
do
	tempSubjDir=/scratch/lliu/tmp/${subjectID}/
	if [[ ! ${subjectID} == *PHA* ]]
		then
			qsub -V -e /scratch/lliu/QLogs/ -o /scratch/lliu/QLogs/ -v projName=${projectName} -v subjID=${subjectID} /scratch/lliu/ConnectivityPipe/runThis.sh
			# python /scratch/lliu/ConnectivityPipe/connectivityPipeline.py ${projectName} ${subjectID}
	fi
done
