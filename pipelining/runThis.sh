#!/bin/bash

. $MODULESHOME/init/bash
module load python

projectName=${projName}
subjectID=${subjID}

python /projects/sstojanovski/conmat/pipelining/connectivityPipeline.py ${projectName} ${subjectID}
