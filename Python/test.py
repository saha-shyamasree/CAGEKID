import os
import fnmatch
import re

matches = []
path='/nfs/ma/home/johan/DATA/CAGEKID/RNASEQ_MAPPED/B00E4JD/'
for root, dirnames, filenames in os.walk(path):
    for filename in fnmatch.filter(filenames, 'accepted_hits.bam'):
        matches.append(root)
print re.sub(path,'',matches[0])