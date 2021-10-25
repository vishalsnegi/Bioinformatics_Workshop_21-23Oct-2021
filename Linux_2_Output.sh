
# ======================================== #
#          Output in terminal
# ======================================== #


# Open the terminal
pwd

mkdir output && ls
cd output
touch newfile && ls -l -h  
## the -l will have details like size, date of createion etc.

##  the output will be like below:
## -rw-r--r-- 1 vishal vishal  0 Sep 16 20:20 newfile
## -rw-r--r-- 1 vishal vishal 15 Sep 16 22:33 output
## -rw-r--r-- 1 vishal vishal 18 Sep 16 22:32 output_new


echo 'I want to be a Bioinformaticians' > ~/output/newfile
cat newfile

echo "What's up world!" >> ~/output/newfile
cat newfile

##For new lines in one command one can use printf

printf "Hello world\nI want to be a Bioinformatician\n"



cd /mnt

##-------------------------------------------
## echo command ## print on the terminal

## whatever is typed after echo command, it will echo it back
## Example: print a string 'Hello Budding Bioinformaticians'

echo 'Hello Budding Bioinformaticians'
echo Hello Budding Bioinformaticians  
## the output will be same despite removing the quote

##-------------------------------------------
## save output in a file at defined location

## Output stream: where linux sends it output; default will be terminal
## The output can be captured and sent elsewhere too using > character
## which can then be redirected to a file

ls ~/my_dir  ## has only one file - newfile
echo 'Hello Everyone' > ~/my_dir/output       ## quote used (but doesn't matter)
echo Life is beautiful > ~/my_dir/output_new  ## quote NOT used 

## This will take the output of echo command and put that 
## in the file named output and output_new (NOTE: the file was not created before) 

## The my_dir has three files:
## (1) newfile     : empty with 0 byte in size
## (2) output      : not empty, we have output of echo command in the file
## (3) output_new  : not empty, we have output of echo command in the file

## let's compare the two files
ls ~/my_dir -l -h  ## the -l will have details like size, date of createion etc.

##  the output will be like below:
## -rw-r--r-- 1 vishal vishal  0 Sep 16 20:20 newfile
## -rw-r--r-- 1 vishal vishal 15 Sep 16 22:33 output
## -rw-r--r-- 1 vishal vishal 18 Sep 16 22:32 output_new

## the size of the empty file is 0 byte
## the size of the output file is 15 bytes as it has some content from echo command output
## the size of the output_new file is 18 bytes


##-------------------------------------------
## print the content of a file using cat command

## cat stands for Concatenate; it prints the content of a file  
## on a standard output i.e. on screen (terminal)

cat ~/my_dir/output  ## will print the hello everyone

## Now take the content of output file into the empty file  (newfile)
## NOTE: The newfile already exists
## This will write the content into newfile
## If it has any content before, the new content will replace the old one 

##-------------------------------------------
## print the content of a file in another file

cat ~/my_dir/output > ~/my_dir/newfile

## Now the content of newfile is same as the output file
## check it with the ls command (the size of newfile and output must be same)

ls ~/my_dir -l -h

## The ouptput is as below:
## -rw-r--r-- 1 vishal vishal 15 Sep 16 23:06 newfile
## -rw-r--r-- 1 vishal vishal 15 Sep 16 22:33 output
## -rw-r--r-- 1 vishal vishal 18 Sep 16 22:32 output_new

## The content of newfile is same as the output
cat ~/my_dir/newfile  ## the output is Hello everyone
## If we echo new statemnt to newfile, the previous content will be 
## replaced with the new one 

echo "What's up world!" > ~/my_dir/newfile && cat ~/my_dir/newfile
## the output is "What's up world!"

##-------------------------------------------
## Add new content to a file with some previous content

## cat command with two > characters
## Example: Add another statement in the newfile
cat ~/my_dir/newfile     ## What's up world!
cat ~/my_dir/output_new  ## Life is beautiful

cat ~/my_dir/output_new >> ~/my_dir/newfile 
## The >> symbol appends the content of output_new to the newfile

cat ~/my_dir/newfile     
## This will print
## What's up world!
## Life is beautiful

##-------------------------------------------
## less command to displays the contents of a file one page ata time
cat output ## Hello everyone
echo 'Welcome to the Linux Workshop' >> ~/my_dir/output
cat ~/my_dir/output

## Hello everyone
## Welcome to the Linux Workshop

less ~/my_dir/output  ## its like a pager- pne page at a time
## Hello everyone
## Welcome to the Linux Workshop
## /home/vishal/my_dir/output (END)

## press q to exit

##-------------------------------------------
## Edit the content of a file using nano

## Like less command the nano will also show the content of a file
## in a page where we don't see the terminal and prompt anymore
## However, nano allow us to edit the content using arrows
## The edit can be saved using the 'write Out' option in the 
## bottm pannel of the page 

nano ~/my_dir/output
## So I edited it and added two more lines: 
## I hope you will find this useful
## Happy Learning

## Now to save it press Ctrl-O
## Hit enter and then Hit Ctrl X for exit
## The prompt will ask if it need to be saved
## Press Y

## Check if the edits are there in the new file
cat ~/my_dir/output
## Hello everyone!
## Welcome to the Linux Workshop.
## I hope you will find this useful.
## Happy Learning

##-------------------------------------------
## nano can also create a new file which can be edited

nano ~/my_dir/nanofile
## Now edit the empty nanofile and add following
#  Hello World!
#  I am enjoying Linux.
#  Hope you too are having fun.
#  :)

## Now check
cat ~/my_dir/nanofile
## The ouput is as expected

##-------------------------------------------
## Let's move the content of my_dir to /home/vishal

# Contents of ~
ls ~  ## Jupy_linux  anaconda3  my_dir

# move newfile from my_dir to ~
mv ~/my_dir/newfile ~ && ls  ## Jupy_linux  anaconda3  my_dir  newfile

# move output_new from my_dir to ~
mv ~/my_dir/output_new ~ && ls  ## output is as below:
## Jupy_linux  anaconda3  my_dir  newfile  output_new

## multiple files can be moved together
# Now move the newfile and output_new back to my_dir at once
ls ~/my_dir
mv newfile output_new my_dir && ls ~/my_dir  ## newfile  output  output_new

##-------------------------------------------
## Moving based on wildcard

ls                            ## Jupy_linux  anaconda3  my_dir
touch myfile yourfile ourfile && ls
## Jupy_linux  anaconda3  my_dir  myfile  ourfile  yourfile

## move these file into ~/my_dir
mv *file ~/my_dir && ls ~/my_dir
## myfile  newfile  ourfile  output  output_new  yourfile

##-------------------------------------------
## Removing based on wildcard

rm ~/my_dir/*file && ls ~/my_dir
## output  output_new

####################################################