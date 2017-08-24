#!/bin/bash

. $MODULESHOME/init/bash
module load python

projectName=${projName}
subjectID=${subjID}

python /scratch/lliu/ConnectivityPipe/connectivityPipeline.py ${projectName} ${subjectID}
