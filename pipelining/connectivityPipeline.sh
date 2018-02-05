#!/bin/bash -e
. $MODULESHOME/init/bash
module load camino/1886d5
module load FSL/5.0.10
module load python
module load AFNI

#-------------------------------------------------------------------------------
# ADD USAGE FOR Projectname, project path (where raw data is)
#-------------------------------------------------------------------------------
# enter project directory
projectName=PNC_dti_conn
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
projectPath=/projects/sstojanovski/${projectName}/bedpostX/data/
projectDir=/projects/sstojanovski/${projectName}/

if [ ! -d "${projectDir}" ]
	then
	cd /projects/sstojanovski/ | mkdir ${projectDir}
	cd ${projectDir}

	mkdir bedpostX
	mkdir conmat
	mkdir Qlogs
fi

cd ${projectPath}

for subjectID in *
do
	tempSubjDir=/scratch/lliu/tmp/${subjectID}/
		qsub -V -e {$projectDir}/QLogs/ -o {$projectDir}/QLogs/ -v projName=${projectName} -v subjID=${subjectID} {$projectDir}/conmat/pipelining/runThis.sh
		# python /scratch/lliu/ConnectivityPipe/connectivityPipeline.py ${projectName} ${subjectID}
	fi
done
