#!/bin/bash -e

. $MODULESHOME/init/bash
module load camino/1886d5
module load FSL/5.0.10
module load python

# enter project directory
projectName=ANDT
projectPath=/archive/data-2.0/${projectName}/data/nii/

cd ${projectPath}

for subjectID in *
do
	tempSubjDir=/scratch/lliu/tmp/${subjectID}/
	# if [[ ! ${subjectID} == *PHA* && ${subjectID} == *CMH* ]]
	if [[ ! ${subjectID} == *PHA* ]]
		then
		# if [ ! -d ${tempSubjDir} ]
		# 	then
			qsub -V -e /scratch/lliu/QLogs/ -o /scratch/lliu/QLogs/ -v projName=${projectName} -v subjID=${subjectID} /scratch/lliu/ConnectivityPipe/runThis.sh
			# python /scratch/lliu/ConnectivityPipe/connectivityPipeline.py ${projectName} ${subjectID}
	fi
done
