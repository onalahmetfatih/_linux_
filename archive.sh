#! /bin/bash
#to specify which bash you are using

#####################

#What for:
#1-archiving and compressing that have been changed since the last archive to the destination 
#directory recursively (including all sub-directories)
#2-If the destination does not exist, it will be created 

#source directory must exist, destination must not 


echo "archiving and compressing"

#archiving <source> <destination directory>

#####################################

#check to see if the user provided the first 
#command line argument point to an existing file or directory.
#and the, do the same to check the second command line argument is provided or not.


# -z file test operator ‘-z’ operator is used to check the length of a string is zero or not. 
#The following script shows the use of this operator by checking an argument is entered or not. 

#the exit is put to exit if an existing source directory

if [ -z $1 ]; then
    echo "You must provide a source to archive"
    exit
fi

if [ -z $2 ]; then
    echo "You must provide a destination directory for the archive"
    exit
fi

#############################################################################################

#-e file test operator is used to check any file or folder is exists or not. 
#if yes, then the condition becomes true.

echo "Verifying if $1 exists ..."

if ! [ -e $1 ]; then
    echo "$1 does not exist"   
    exit
fi

##############################################################################################

# -d file test operator is used to check if file is a directory; 
#creating a directory, if it does not exist.

if ! [ -d $2 ]; then
    mkdir $2
    exit
fi

#gives the year,month,day - hour,minute,second
echo "generating filename stem"
filename_stem=$(date + '%Y%m%d-%H%M%S') 


echo "archiving and compressing"
#This command creates a file called $2 which is the Archive of all $1 files in current directory. 

tar cvf $2 $1

echo "archiving finished"