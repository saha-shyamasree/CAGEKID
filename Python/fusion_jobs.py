#!/usr/bin/python

import sys
import os
import fnmatch
import glob
import csv
import re
import numpy as np
def call_process(samp,row,sample_names,sample_pairs):
    path='/nfs/ma/home/johan/DATA/CAGEKID/RNASEQ_MAPPED/'
    output="/nfs/ma/home/shyama/DATA/CAGEKID/data/"
    matches=[]
    print path+samp+"/"
    for root, dirnames, filenames in os.walk(path+samp+"/"):
        for filename in fnmatch.filter(filenames, 'accepted_hits.bam'):
            matches.append(root)
    sub_dir=re.sub(path,'',matches[0])
    sub_dir=sub_dir+"/"
        
    if(samp in sample_names):
        index=sample_names.index(samp)
        tumor_sample=sample_pairs[index]
        prev=sample_pairs[index-1]
        if(prev[2]==tumor_sample[2]):
            normal_sample=prev
        else:
            if((len(sample_pairs)>(index+1)) and sample_pairs[index+1][2]==tumor_sample[2]):
                normal_sample=sample_pairs[index+1]
            else:
                print "no pair normal, should not happen"
        print "tumor_sample:"+tumor_sample[0]
        print "normal_sample:"+normal_sample[0]
        print "normal[3]:"+normal_sample[3]
        matches1=[]
        for root, dirnames, filenames in os.walk(path+normal_sample[0]+"/"+normal_sample[3]):
            for filename in fnmatch.filter(filenames, 'accepted_hits.bam'):
                matches1.append(root)
        sub_dir2=re.sub(path,'',matches1[0])
        sub_dir2=sub_dir2+"/"
        print "subdir2:"+sub_dir2
        if(row[7]==row[14]):
            #same chromosome
            command="bsub -o /nfs/ma/home/shyama/outputs/CAGEKID/"+samp+".txt -M 65000 -R \"rusage[mem=65000]\" \"sh /nfs/ma/home/shyama/code/CAGEKID/Shell/fusion_to_novel_transcript_pipeline.sh "+sub_dir+" "+row[7]+" "+output+"tumor/ "+path+" tumor\""
            print command
            os.system(command)
            
            command="bsub -o /nfs/ma/home/shyama/outputs/CAGEKID/"+normal_sample[0]+".txt -M 65000 -R \"rusage[mem=65000]\" \"sh /nfs/ma/home/shyama/code/CAGEKID/Shell/fusion_to_novel_transcript_pipeline.sh "+sub_dir2+" "+row[7]+" "+output+"normal/ "+path+" normal\""
            print command
            os.system(command)
        else:
            #different chromosome
            command="bsub -o /nfs/ma/home/shyama/outputs/CAGEKID/"+samp+".txt -M 80000 -R \"rusage[mem=80000]\" \"sh /nfs/ma/home/shyama/code/CAGEKID/Shell/fusion_to_novel_transcript_pipeline.sh "+sub_dir+" "+row[7]+" "+output+"tumor/ "+path+" tumor "+row[14]+"\""
            print command
            os.system(command)
            command1="bsub -o /nfs/ma/home/shyama/outputs/CAGEKID/"+normal_sample[0]+".txt -M 80000 -R \"rusage[mem=80000]\" \"sh /nfs/ma/home/shyama/code/CAGEKID/Shell/fusion_to_novel_transcript_pipeline.sh "+sub_dir2+" "+row[7]+" "+output+"normal/ "+path+" normal "+row[14]+"\""
            print command1
            os.system(command1)
    else:
        print "sample is not paired (tumor/normal), hence not in this file:",
        print samp
        
        if(row[7]==row[14]):
            #same chromosome
            command="bsub -o /nfs/ma/home/shyama/outputs/CAGEKID/"+samp+".txt -M 65000 -R \"rusage[mem=65000]\" \"sh /nfs/ma/home/shyama/code/CAGEKID/Shell/fusion_to_novel_transcript_pipeline.sh "+sub_dir+" "+row[7]+" "+output+"tumor/ "+path+" tumor\""
            print command
            os.system(command)
        else:
            #different chromosome
            command="bsub -o /nfs/ma/home/shyama/outputs/CAGEKID/"+samp+".txt -M 80000 -R \"rusage[mem=65000]\" \"sh /nfs/ma/home/shyama/code/CAGEKID/Shell/fusion_to_novel_transcript_pipeline.sh "+sub_dir+" "+row[7]+" "+output+"tumor/ "+path+" tumor "+row[14]+"\""
            print command
            os.system(command)


fusion_file="/nfs/ma/home/shyama/DATA/CAGEKID/fusions2.csv"
pair_file="/nfs/ma/home/shyama/DATA/CAGEKID/paired_data.csv"

#this file do not have header
ifile  = open(pair_file, "r")
reader = csv.reader(ifile)

sample_pairs=[[cell for cell in row] for row in reader]
sample_pairs_array=np.array(sample_pairs)

#this file has header, hence row 0 will be ignored
ifile2  = open(fusion_file, "r")
reader2 = csv.reader(ifile2)

fusion_info=[[cell for cell in row] for row in reader2]
fusion_info_array=np.array(fusion_info)

print sample_pairs_array[:,1]
#for row in sample_pairs:
#    for col in row:
print sample_pairs[1][1] #.index('B00E418')
search="B00EY19"

sample_names=[row[0] for row in sample_pairs]
print sample_names
#pattern=re.compile(',')
flag=0
for row in fusion_info:
    if(flag==0):
        flag=flag+1
    else:
        print "\nProcessing:"+row[0]
        names=row[0].split(',')
        print names
        for n in names:
            call_process(n.strip(),row,sample_names,sample_pairs)