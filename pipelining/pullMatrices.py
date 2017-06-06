import os
import glob
import shutil

#this program pulls the connectivity matrices and puts them in a folder, and then makes a text file that has a string of all the file names separated by spaces 

# enter project directory
projectName = 'SPINS'
projectPath = '/archive/data-2.0/' + projectName + '/data/nii/'

os.chdir(projectPath)

projectSubjects = glob.glob('*')
projectSubjects.sort()

parameter = 'md_mean'
fileNames = ''
groupedConmatDir = '/scratch/lliu/' + projectName + '/pipelines/grouped/' + parameter + '/'
# for all the projects which have nii pipeline folders
for subjectID in projectSubjects:
	if "PHA" not in subjectID and "CMH" in subjectID:
		subjConmatDir = '/scratch/lliu/' + projectName + '/pipelines/conmat/' + subjectID +'/' 
		if os.path.exists(subjConmatDir): 
			os.chdir(subjConmatDir)
			subjFile = glob.glob('*' + parameter + '.csv')
			if subjFile != []:
				shutil.copy(subjConmatDir + subjFile[0], groupedConmatDir)
				fileNames = fileNames + ' \'' + subjFile[0] + '\''

os.chdir(groupedConmatDir)
file = open(parameter + "_fileNames.txt", "w")
file.write(fileNames)
file.close()

