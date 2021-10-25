

### ============================================= ##
##           wget to interact with web
### ============================================= ##

cd /mnt/e/Linux
mkdir uniprot && ls
## Jupy_linux  anaconda3  my_dir  uniprot

cd uniprot

## Let's get the information about human HMGB1
## www.uniprot.org/uniprot/P09429  ## is the web link
## Use wget command with this link and add .txt

wget www.uniprot.org/uniprot/P09429.txt
## This will save all the information in P09429.txt file

## ============================================= ##
## less for pager view of the txt file

less P09429.txt  
## Use space bar to move to next page and so on
## Use q to return to the terminal window

## ============================================= ##
## wget to download the fasta file for that entry
## www.uniprot.org/uniprot/P09429  ## is the web link
## Use wget command with this link and add .fasta
wget www.uniprot.org/uniprot/P09429.fasta

## view the sequence using cat
cat P09429.fasta

## Now check the directory
ls -l -h   ## The output will be as below:

## -rwxrwxrwx 1 vishal vishal 316 Jun  2 05:30 P09429.fasta
## -rwxrwxrwx 1 vishal vishal 80K Jun  2 05:30 P09429.txt

## The -l and -h can be combined with no change in the result
ls -lh  ## The output will be as below:

## -rwxrwxrwx 1 vishal vishal 316 Jun  2 05:30 P09429.fasta
## -rwxrwxrwx 1 vishal vishal 80K Jun  2 05:30 P09429.txt

## ============================================= ##
## head command for first 10 lines of the file

head -n 10 P09429.txt  ## First 10 lines of the file
tail -n 10 P09429.txt  ## Last 10 lines of the file

## Combine head and tail using pipe (|)
## The pipe takes the output of the command and 
## redirect it to the next command

head -n 10 P09429.txt | tail -n 5 
## This will take first 10 lines and then from these 10 lines, it 
## will print the last 5 lines of the 10 lines

## Combine head and tail using &&
head -n 5 P09429.txt && tail -n 5 P09429.txt

## This will print first 5 and last 5 lines


## ============================================= ##
## wget a Google Sheet csv file stored in a web and save with a different name

pwd  	## /mnt/e/Linux/uniprot
cd .. 	## goes one up /mnt/e/Linux
mkdir web_dat && ls   ## SRA  Scripts_bash  uniprot  web_dat

## download data from link 
## https://docs.google.com/spreadsheets/d/1-O0Kvs9WTz-aVAuFN_xccikuWRHXXIHbOMByBCeO7rQ/edit?usp=sharing
## The file setting was modifoed to make it publicly available
## Save with a name example.csv
## use -O argument which stands for output file name
## Find the Ggle Sheet ID
## In the link "https://docs.google.com/spreadsheets/d/1-O0Kvs9WTz-aVAuFN_xccikuWRHXXIHbOMByBCeO7rQ/edit?usp=sharing"
## The id of Google Sheet is 1-O0Kvs9WTz-aVAuFN_xccikuWRHXXIHbOMByBCeO7rQ
## The command should be
## wget https://docs.google.com/spreadsheets/d/<FILE_ID>/export?format=csv -O Example.csv
## (1) Here the wget is the command to get the file
## (2) The 'https://docs.google.com/spreadsheets/d/' is Google Sheet URL without file ID
## (3) FILE_ID/
## (4) export?format=csv  defines the format 
## (5) -O is for output followed by the name of the output file

wget 'https://docs.google.com/spreadsheets/d/1-O0Kvs9WTz-aVAuFN_xccikuWRHXXIHbOMByBCeO7rQ/export?format=csv' -O Example.csv

## Let's see how it looks like
head Example.csv  ## The columns in the output are not lined up

## bash has a command to have a better display of csv files in terminal
column -t -s ',' Example.csv
## The column command will take comma delimited data (csv) or tab-separated data, 
## or space separated data which is a table
## This will diplay the data as a table
## -t is the option for table as an output
## -s is the option for what is the delimiter character  i.e. separater
## ',' is the delimited character 
## the Example.csv is the name of the file 


## ============================================= ##
## Convert the pubmed id's to NCBI url 

## sed command is the stream editor which makes changes to the input stream

## we have pubmed ids stored in the file /mnt/e/Linux/uniprot/pubmed.txt
cd /mnt/e/Linux/uniprot && ls
head pubmed.txt

## Substitute start of line with pubmed web link (https://pubmed.ncbi.nlm.nih.gov/)

cat pubmed.txt | sed 's/^/https:\/\/pubmed.ncbi.nlm.nih.gov\//'
## s for substitution ## ^ for start of line [We want to substitute the begining of the line]
## / after carrot: whatever we want to substitute with
## Problem: once we put / after https (/https:/), the code will consider this as the end of the block 
## Therefore to ignore the forward slash as the end of the block 
## escape the forward slash (/) with a back slash (\) [The back slash will come before the forward slash ]

## ============================================= ##
## Write a loop to download fasta files from Uniprot

## We have a file 'hmgb1.txt' with Uniprot identifier 

cd /mnt/e/Linux/uniprot  && ls
cat hmgb1.txt  ## to check the uniprot ids in hmgb1.txt

## create an empty bash file
touch get_uniprot_data.sh

## Write the following script in a text editor 


#=============================================
#!/bin/bash

VAR=$(cat hmgb1.txt)
URL="https://www.uniprot.org/uniprot/"

for i in ${VAR}
    do
        echo "(o)Downloading uniprot entry: ${i}"
        curl ${URL}${i}.fasta >> hmgb1.fasta
        echo "(o)Downloading complete for uniprot entry: ${i}"
    done

#=============================================

## (o) with echo is to see the progress of work

## Check the content
cat get_uniprot_data.sh

## Run the script
./get_uniprot_data.sh
