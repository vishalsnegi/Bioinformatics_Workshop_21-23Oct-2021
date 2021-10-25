
##-------------------------------------------##
##      Linux Filesystem
##-------------------------------------------##

## The present working directory
## It reports where you are in the file system
pwd

## ------------------------------------------
## Change directory
## ------------------------------------------

## This will allow you to move around the file system
## To go to the root of the filesystem is denoted by single forward slash
cd /

## This will move the prompt to the root directory
## Check it
pwd

## In Windows Subsystem for Linux (WSL) The C:\ drive is mounted as /mnt/c/, 
## E:\ is mounted as /mnt/e/ et cetra. 
## Therefore, E:/Linux should be at /mnt/e/Linux.

##-------------------------------------------
## List the content of the current directory

ls
## The text in dark blue color is for DIRECTORIES
## the lighter blue text is the LINK for another files
## The white color texts represent FILES
## The green background reprent FILES/DIRECTORIES that has special permissions

## ls with argument
ls bin ## will list the contents of the directory bin

##-------------------------------------------
## Go back to directory inside your pwd

## Now I am in the root and the home directory is insode the root
## so we can write the following command
cd home

## Now go to vishal in home directory
cd vishal
cd Jupy_linux
pwd
## The output is /home/vishal/Jupy_linux

##-------------------------------------------
## Go back to directory located above your pwd

## Change directory to home/vishal
## One way could be to type the full path
cd /home/vishal

## Shortcut way would be cd with no argument
cd
pwd
## The output is /home/vishal

## Another Shortcut way would be cd with a tilde ~
cd ~  ## wherever you are in directory this will bring you to home/vishal
pwd
## The output is /home/vishal

##-------------------------------------------
## Go to one level up in the directory

pwd     # The output is /home/vishal
cd ..   
pwd 

## let us change it to home/vishal
cd ~ && pwd
## Now change it to two directory above
cd ../../../ && pwd ## will take you to root directory

## you can go above and then below
## Change the pwd to home/vishal & then go to root and then 
## come back to vishal in the same command

cd && pwd
cd ../../../home/vishal

##-------------------------------------------
## Package Manager apt

## Ubuntu has a package manager apt, which can be used to install packages
## sudo is a way to run a command as an administrator
## Lets install tree which gives a nice display of file system

sudo apt install tree

##-------------------------------------------
##  Graphical display of directories and files

## Now we have tree we can use it to print the graphical display of 
## files and directories

tree ## it will list all the files and directories present in my entire system

## This is awfully a lot of files and directories
## We can limit the output- for example 
## List the files and directories that descend into three levels

tree -L 3

##-------------------------------------------
##  Make directory 
cd
mkdir my_dir   ## will create my_dir directory
ls             ## will list the files & directories
ls /           ## will list the files & directories in root
ls -l -h       ## -l for long listing and -h for human readable (size of the file)
## These dash after ls represent options
## -l is option for list them in longer format  
## (i.e. in more detail e.g. size of files, date and time of creation). By default the sizes are listed in bytes.
##  for bigger sized files and directories the size could be millions of bytes
## which is quite difficult to read
## -h is an option for converting this size from bytes to human readable format
## i.e. bytes, kilobytes, megabytes or gigabytes depending on the size
## very small size will still be in bytes

##-------------------------------------------
##  Create a file

## The newly created my_dir is an empty directory
## create a file in that directory using the command touch
cd my_dir && touch testfile && ls
## touch command will create the file testfile if file does not exist
## If the testfile already exists the tocuh command will update the file

##-------------------------------------------
##  Copy a file in other location

## The cp command copy a file
## It requires two arguments 
## (1) filename to be copied 
## (2) destination of copied file for example /home/vishal
cp testfile /home/vishal && ls /home/vishal   
## OR a tilde can also be used for home/vishal
cp testfile ~ && ls ~

## Copy the file and rename it
cp testfile ~/newfile && ls ~

##-------------------------------------------
##  Move a file in other location

## Some times a file need to be moved to a new location
## rather than copying it 

## Example move newfile from /home/vishal to  /home/vishal/my_dir
cd ~ && mv newfile ~/my_dir && ls ~/my_dir

##-------------------------------------------
##  Remove file

## rm command
## CAUTION: the rm command can be very distructive to your filesystems
## So one need to be very careful and make sure you don't remove anything important

## Remove the copy of testfile from home/vishal
## To remove newfile in home/vishal

rm testfile && ls

## Now remove newfile from home/vishal/my_dir
rm ~/my_dir/testfile && ls ~/my_dir


##-------------------------------------------
##  Remove an empty directory using rmdir or rm -d

## Removing an empty directory using rmdir command
## Example: create a directory test in home/vishal & remove it
mkdir test && ls
rmdir test && ls  

## Removing an empty directory using rm -d command
## Example: create a directory test in home/vishal & remove it
mkdir test && ls
rm -d test && ls  

##-------------------------------------------
## Removing an NON-EMPTY directory using rm -r command

## Example: create a directory test in home/vishal 
## create a file in it
## Remove the directory

mkdir test && touch ~/test/newfile && ls ~/test
rm -r test && ls 
## rm means remove
## -r means recursively. 
## i.e. rm -r commands tells that remove the directory even if it is not empty

## removing in an interactive mode using -i option
## -i option will ask for each file to be removed 
## Example: create a directory test in home/vishal 
## create three files in it
## Remove the directory in an interactive mode

mkdir test && touch ~/test/file_1 && touch ~/test/file_2 && touch ~/test/file_3 && ls ~/test
rm -i -r test && ls 

## The output will be like below:
#----------------------------------
#  vishal@LAPTOP-MI2MCHSD:~$ rm -i -r test && ls
#  rm: descend into directory 'test'? y
#  rm: remove regular empty file 'test/file_1'? y
#  rm: remove regular empty file 'test/file_2'? y
#  rm: remove regular empty file 'test/file_3'? y
#  rm: remove directory 'test'? y
#  Jupy_linux  anaconda3  my_dir
#  vishal@LAPTOP-MI2MCHSD:~$
#----------------------------------




