#!/bin/bash

VAR=$(ls query*)


for i in ${VAR}
    do
        blastn -query ${i} -db test_db >> blast_out_loop.txt
        blastn -query ${i} -db test_db -outfmt 6 >> blast_out_loop_table.txt
    done