#! /bin/bash
#to specify which bash you are using

#####################

#What for:
#1-copying source directory to the destination recursively (including all sub-directories)
#2-changing the owner to root
#3-changing permissions to read, wrtite, execute for everything in the destination directory


#source directory must exist, destination must not 


echo "Copying for root"

################################################################################################

# check to see if the user provided the first 
#command line argument point to an existing file or directory.

# -z file test operator ‘-z’ operator is used to check the length of a string is zero or not. 
#The following script shows the use of this operator by checking an argument is entered or not. 

#the exit is put to exit if an existing source directory

if [ -z $1 ]; then
    echo "You must provide a source directory"
    exit
fi

if [ -z $2 ]; then
    echo "You must provide a destination directory"
    exit
fi

#############################################################################################

# -d file test operator is used to check if file is a directory; 
#if yes, then the condition becomes true.

echo "Verifying if $1 exists ..."

if [ -d $1 ]; then
    echo "$1 is a directory".
else 
    echo "$1 does not exist or is not a directory"   
    exit
fi

##############################################################################################

#-e file test operator is used to check any file or folder is exists or not.

if [ -e $2 ]; then
    echo "$2 already exists".
    exit
fi

###############################################################################################


echo "Copying $1 to $2"

cp -r $1 $2

###############################################################################################

# recursively change the file permission to read only for the
# owner
# R since the option recusively for chown is R unlike r for copy 
#chown -option <for who> <destination>

#Sudo stands for either "substitute user do" or "super user do" and 
#it allows you to elevate your current user account to have root privileges temporarily. 
#This is different from “su” which is not temporary.

echo "Changing owner to root"

sudo chown -R root $2

################################################################################################

#chmod <numbers> <filename>
#4 for read, 2 for write, 1 for execute

echo "Changing file permissions to root since the root is the new user"

sudo chmod -R 700 $2 

################################################################################################

echo 
"Copying for root
#1-copying source directory to the destination recursively (including all sub-directories)
#2-changing the owner to root
#3-changing permissions to read, wrtite, execute for everything in the destination directory
is finished"

################################################################################################

# to run this bash script in the command line ./name so ./copying_for_root


# f forcing to do whithot giving a prompt, 
#-d including any subdiriectory, -r recusively, to delete a subdirectory tree 