#!/bin/bash -e
. $MODULESHOME/init/bash
module load camino/1886d5
module load FSL/5.0.10
module load python/2.7.9-anaconda-2.1.0-150119
## if this fails use python 3.6 not erins
module load AFNI/2014.12.16

#-------------------------------------------------------------------------------
# ADD USAGE FOR Projectname, project path (where raw data is)
#-------------------------------------------------------------------------------
# enter project directory
projectName=PNC_dti_conn
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
projectPath=/projects/sstojanovski/${projectName}/bedpostXdata/data
projectDir=/projects/sstojanovski/${projectName}

if [ ! -d "${projectDir}" ]
	then
	cd /projects/sstojanovski/ | mkdir ${projectDir}
	cd ${projectDir}

	mkdir bedpostX
	mkdir conmat
	mkdir Qlogs
	mkdir tmp
fi

cd ${projectPath}

for subjectID in *
do
		# qsub -V -e ${projectDir}/QLogs/ -o ${projectDir}/QLogs/ -v projName=${projectName} -v subjID=${subjectID} ${projectDir}/scripts/pipelining/runThis.sh
		bash ${projectDir}/scripts/pipelining/runThis.sh ${projectName} ${subjectID}

done

# bash ${projectDir}/scripts/pipelining/runThis.sh projName=${projectName} subjID=${subjectID}
