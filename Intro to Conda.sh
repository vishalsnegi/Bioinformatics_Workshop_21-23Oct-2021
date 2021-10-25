### ============================================= ##
##                 Intro to Conda
### ============================================= ##

# Useful for third party softwares, whcih are not part of Linux code distribution

# PROBLEM: 
# (a) there are a number of softwares, which are not trivial to install
# (b) there are a number of softwares that requires a lot of dependencies

# We need a way to flexible system to resolve our dependencies well
# and maintain mutiple versions of softwares
#
# FOR THIS WE WILL USE A PIECE OF SOFTWARE CALLED CONDA
# CONDA is produced by a company caled ANACONDA


# Anaconda offers three distributions
#		Anaconda | MiniConda | Conda

# Anaconda is a full distribution of the central software 
# Miniconda is smaller version of Anaconda only includes Python,
# It is essentially an installer for an empty conda environment, containing only Conda, 
# its dependencies, and Python

# Mini conda is smaller and is sufficient for our requirements
# It consumes much less space than the full version

#---------------------
## System requirements

# Operating system: 
	# Windows 8 or newer, 
	# 64-bit macOS 10.13+, or 
	# Linux, including Ubuntu, RedHat, CentOS 7+, and others.

# System architecture: 
	# Windows- 64-bit x86, 32-bit x86; 
	# MacOS- 64-bit x86; 
	# Linux- 64-bit x86, 64-bit aarch64 (AWS Graviton2 / arm64), 64-bit Power8/Power9,
    # s390x (Linux on IBM Z & LinuxONE).

# Minimum 400 MB disk space to download and install.

## 	Computers with 32-bit processors are older, slower, 
## 	and less secure, while a 64-bit processor is newer, 
## 	faster, and more secure.
##  64-bit processor can handle 2^64 (or 18,446,744,073,709,551,616) 
##  bytes of RAM.

### ============================================= ##
##             Install CONDA
### ============================================= ##

#---------------------
# Web page for Mini Conda
https://docs.conda.io/en/latest/miniconda.html
# Download the correct installer for mini conda
# Scroll down to find the Linux Installer

# My system is 64 bit so I chose the 64 bit 
# Right click and copy the link "
https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
# This link is the installer script

https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh

cd /mnt/e/Linux

wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh

#---------------------
# Verify your installer hashes

# Hashing is a cryptographic process that can be used to validate 
# the authenticity and integrity of various types of input 
# (software in this case) 

# HASH FILE is executable
# get the file name of the script

ls      # Miniconda3-py39_4.10.3-Linux-x86_64.sh

# get the hash file
sha256sum Miniconda3-py39_4.10.3-Linux-x86_64.sh

# This command will create the hash from the script (Miniconda3-py39_4.10.3-Linux-x86_64.sh)
# output 1ea2f885b4dbc3098662845560bc64271eb17085387a70c2ba3f29fff6f8d52f 
# This is same as the one present in website
# Miniconda3-py39_4.10.3-Linux-x86_64.sh


#---------------------
#  Install

# use bash command followed by the name of the script (Miniconda3-py39_4.10.3-Linux-x86_64.sh)
bash Miniconda3-py39_4.10.3-Linux-x86_64.sh
ls

# update
conda update conda

# delete the installer
rm Miniconda3-py39_4.10.3-Linux-x86_64.sh

### ============================================= ##
##             ENVIRONMENTS & Channels
### ============================================= ##

# ENVIRONMENTS
# By default while running conda we have environment called base
# This is where all the softwares are going to be installed by default

# If we install everything in one environment
# it can become very large due to installation of various softwares
# 
-----
#  Creating New Environment

# A conda environment is a directory that contains a specific 
# collection of conda packages that you have installed
# 	New Conda environment can be created for specific task
#   for example MSA
# 	Also, in a new environment you can keep different versions of 
#	softwares

# So its the environment that allows you to maintain 
# independent version of softwares

#---------------------
#  CHANNEL

# Channels are distinct official storages of softwares 
# and their dependencies

# Three Channels
# Channel defaults: of ANACONDA is the default place 
#					where software comes from
# Channel conda-forge: is a curated channel which contains
#					   a lot of dependencies 
# Channel bioconda: is a repository of bioinformatics softwares 

# So we will add this to our environment so that we can download the required softwares