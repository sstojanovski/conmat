#!/bin/bash

. $MODULESHOME/init/bash
module load python

projectName=${projName}
subjectID=${subjID}

python /projects/sstojanovski/PNC_dti_conn/scripts/pipelining/connectivityPipeline.py ${projectName} ${subjectID}
