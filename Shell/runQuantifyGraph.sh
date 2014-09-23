#!/bin/sh

#26855
#87401
line=$LSB_JOBINDEX
echo $line
filelist="/nfs/ma/home/shyama/DATA/CAGEKID/bam/B00EY0T/whole/chrysalis/quantifyGraph_commands"
command=`sed -n "$line"p $filelist`

$command
echo $line