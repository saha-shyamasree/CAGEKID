#!/usr/bin/env python

import re

unmapped_id_file=""
fasta_file=""
unmapped_reads=""

ifile  = open(unmapped_id_file, "r")
id_reader = csv.reader(ifile)

unmapped_ids=[row for row in reader]

ifile2  = open(fasta_file, "r")
fasta_reader = csv.reader(ifile2)

unmapped_reads_file  = open(unmapped_reads, "w")

flag=0
for row in fasta_reader:
    if (re.search('^>',row)):
        if(row.strip() in unmapped_ids):
            unmapped_reads_file.write(">"+row.strip()+"\n")
            flag=1
        else:
            flag=0
    else:
        if(flag==1):
            unmapped_reads_file.write(row.strip()+"\n")

