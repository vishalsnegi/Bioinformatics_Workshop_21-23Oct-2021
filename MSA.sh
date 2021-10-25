

### ============================================= ##
##             Install MUSCLE using CONDA
### ============================================= ##

#---------------------
#  Create Environment for Multiple Alignment Software

conda create -n msa1  ## This should create an empty environment  called msa

# conda is the program
# create is to create the environment
# -n is to name your environment
# msa1 is the name I chose for the environment
# A list of softwares can be installed in this environment

#---------------------
#  Activate Environment msa

# To activate this environment, use
conda activate msa 

#---------------------
#  Add Channels in the order of priority

# The channel with least priority will be added first
# The channel with highest priority will be added last

conda config --add channels defaults  # defaults will be looked in the last
conda config --add channels bioconda
conda config --add channels conda-forge # highest priority, curated with dependencies

#---------------------
# Install Muscle

conda install muscle      
# Conda will look into conda-forge first and then bioconda and in the end default channel
# It will find muscle and its dependencies and then install it
# Conda-forge will provide the most recent package

conda activate msa1 && conda list
## Now we can see that muscle installed from bioconda
## and its dependencies were installed from conda-forge

# Now check if it is already installed
muscle -help


### ============================================= ##
##            Perform MSA
### ============================================= ##

## I have a text file with some fasta sequence (HMGBA1_2.txt)
## Create a fasta file by writing the content of text file in a new fasta file

pwd
cd /mnt/e/Linux/msa && ls

cat HMGA1_2.txt >> test.fasta

## Now check it
cat test.fasta

# our input file is test.fasta
# lets count the number of sequences

grep -c '^>' test.fasta   ##  sequences
# -c    : for count
# '^>'  : for the entries starting with > sign   

# Perform multiple alignment

# There is no manual page for muscle as it is 
# not part of Linux distribution

# So in order to get basic information about muscle type mucle
muscle

## Basic syntax 
#  muscle -in <inputfile> -out <outputfile>

# default output is fasta
# to get clustal output we can use -clw

muscle -in test.fasta -out test_aln.fasta

## Check if the alignment file has been created
ls    ## test_aln

cat test_aln.fasta

# Although this is a nice way to look into the alignment but this is 
# not the perfect one, we can do a better visualization

# We can use a a software Jalview (developed by University of Dundee)


### ============================================= ##
##   View Multiple Sequence Alignment using JalView
### ============================================= ##

## Install in your desktop using the link
## http://www.jalview.org/getdown/release/
## Download windows executable file
## Install with default choices

## Now open the jalview
## Click on File > Input Alignment > From File
## Select the hmgb1_aln.fasta file 

## Colourful output: Colour > Clustalx
## Tree: Select All > Calculate > Calculate Tree or PCA 
## > Neighbour Joining > BLOSUM62


