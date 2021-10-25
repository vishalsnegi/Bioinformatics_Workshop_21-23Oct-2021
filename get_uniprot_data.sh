#!/bin/bash

VAR=$(cat hmgb1.txt)
URL="https://www.uniprot.org/uniprot/"

for i in ${VAR}
    do
        echo "(o)Downloading uniprot entry: ${i}"
        curl ${URL}${i}.fasta >> hmgb1.fasta
        echo "(o)Download complete for uniprot entry: ${i}"
    done
