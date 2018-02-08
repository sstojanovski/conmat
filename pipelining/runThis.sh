#!/bin/bash

. $MODULESHOME/init/bash
module load python/2.7.9-anaconda-2.1.0-150119

python /projects/sstojanovski/PNC_dti_conn/scripts/pipelining/connectivityPipeline.py $1 $2
