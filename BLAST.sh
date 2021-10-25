

### ============================================= ##
##                    BLAST
### ============================================= ##

# BLAST stands for Basic Local Alignment Search Tool
# It finds regions of similarity between biological sequences
# BLAST can be used using web server (https://blast.ncbi.nlm.nih.gov/Blast.cgi)
# and by command-line tools (such as bash)


### ============================================= ##
##       Setup Directory for BLAST
### ============================================= ##

## Open ubuntu terminal and go to Linux directory
cd /mnt/e/Linux && ls

## Make a directory for BLAST
mkdir BLAST && ls


### ============================================= ##
##    Create Environment for BLAST using CONDA
### ============================================= ##

#  Create Environment for BLAST search
conda create -n blast ## This should create an empty environment  called blast

# conda is the program
# create is to create the environment
# -n is to name your environment
# blast is the name I chose for the environment
# A list of softwares can be installed in this environment

### ============================================= ##
##      Activate Environment blast
### ============================================= ##

# To activate this environment, use
conda activate blast

## You will notice that the environment changed from 
## base to blast

### ============================================= ##
##             Install BLAST using CONDA
### ============================================= ##

#---------------------
#  Add Channels in the order of priority

# The channel with least priority will be added first
# The channel with highest priority will be added last

conda config --add channels defaults  # defaults will be looked in the last
conda config --add channels bioconda
conda config --add channels conda-forge # highest priority, curated with dependencies

#---------------------
# Install blast

conda install blast

# Conda will look into conda-forge first and then bioconda and in the end default channel
# It will find muscle and its dependencies and then install it
# Conda-forge will provide the most recyent package

# update blast with
conda update blast

# Now check if it is already installed
blastn -help

#---------------------
# Check the list of softwares

# in blast
conda list  

## If you restart the terminal, it will open the base environment
## and not the blast rnvironment. In such case activate the blast environment

conda activate blast && conda list
## Now we can see the list of sodtwares including blast installed from bioconda
## and its dependencies were installed from conda-forge

### ============================================= ##
##      Execute BLAST search
### ============================================= ##

## In the BLAST directory, I added two fasta files
## Quesry.fasta is the query file
## subject.fasta is the subject file

## Make Blast database of the subject.fasta
cd BLAST && ls

makeblastdb -in subject.fasta -out test_db -dbtype nucl -parse_seqids

## Now run blastn and save the output as my_blast_output.txt
blastn -query query.fasta -db test_db -out my_blast_output.txt

## Check the output
cat my_blast_output.txt

## The result shows that the query seq is spike ORF

## Another BLAST run with another query sequence
blastn -query query_2.fasta -db test_db -out my_blast_output2.txt
## Check the output
cat my_blast_output2.txt

## BLAST OUTPUT IN TABULAR FORMAT
# output format 6 has 12 columns
# 1) qseqid: query or source (e.g., gene) sequence id
# 2) sseqid: subject  or target (e.g., reference genome) sequence id
# 3) pident: percentage of identical matches
# 4) length: alignment length (sequence overlap)
# 5) mismatch: number of mismatches
# 6) gapopen: number of gap openings
# 7) qstart: start of alignment in query
# 8) qend: end of alignment in query
# 9) sstart: start of alignment in subject
# 10) send: end of alignment in subject
# 11) evalue: expect value
# 12) bitscore: bit score

blastn -query query_2.fasta -db test_db -outfmt 6 -out my_blast_out_table.txt


### Automate Run the BLAST for both quereys in For Loop
# Write a script that runs loop for executing blast for all the query sequences
# Output tablular result
# Output complete result


#script:  blast_loop.sh
# =============================
#!/bin/bash

VAR=$(ls query*)


for i in ${VAR}
    do
        blastn -query ${i} -db test_db >> blast_out_loop.txt
        blastn -query ${i} -db test_db -outfmt 6 >> blast_out_loop_table.txt
    done
# =============================

cat blast_loop.sh

## Run the script
./blast_loop.sh


