cd /nfs/ma/home/shyama/installed_soft/trinityrnaseq_r2012-06-08/

fileDir="/nfs/ma/home/shyama/DATA/CAGEKID/bam/B00EY0T"
bsub -o /nfs/ma/home/shyama/outputs/CAGEKID/trinity_B00EY0T.out -M 64000 -R "rusage[mem=64000]" "./Trinity.pl --seqType fq --JM 60G --no_run_quantifygraph --no_run_butterfly --left $fileDir"/s_5_1_seq.fastq" --right $fileDir"/s_5_2_seq.fastq" --output $fileDir"/whole""