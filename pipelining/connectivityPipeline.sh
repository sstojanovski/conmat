#!/bin/bash -e

. $MODULESHOME/init/bash
module load camino/1886d5
module load FSL/5.0.10
module load python

# enter project directory
projectName=SPINS
projectPath=/archive/data-2.0/${projectName}/data/nii/

cd ${projectPath}

for subjectID in *
do
	tempSubjDir=/scratch/lliu/tmp/${subjectID}/
	if [[ ! ${subjectID} == *PHA* && ${subjectID} == *CMH* ]]
		then
		if [ ! -d ${tempSubjDir} ]
			then
			qsub -V -e /scratch/lliu/ConnectivityLogs/ -o /scratch/lliu/ConnectivityLogs/ -v projName=${projectName} -v subjID=${subjectID} /scratch/lliu/ConnectivityPipe/runThis.sh
			# bash /scratch/lliu/ConnectivityPipe/runThis.sh
			# python /scratch/lliu/ConnectivityPipe/recover.py ${projectName} ${subjectID} | qsub -V -e /scratch/lliu/ConnectivityLogs/ -o /scratch/lliu/ConnectivityLogs/
		fi
	fi
done

