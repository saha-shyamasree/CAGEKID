sampleName=$1 #"B00E4HB" #"B00EY19"
subFold=$2 #"BC07B5ACXX/002"
filename=$3 #"s_7_"
month=$4 #"APR"
desc=$5 #"tumor"
chr=$6
out="/nfs/ma/home/shyama/DATA/CAGEKID/data/"$desc"/"$sampleName"/whole"$chr
FQ="/nfs/ma/home/shyama/DATA/CAGEKID/data/"$desc"/"$sampleName"/"$filename

mkdir "/nfs/ma/home/shyama/DATA/CAGEKID/data/"$desc"/"$sampleName
mkdir $out
#zcat /ebi/microarray/home/mar2/data/cagekid/data/raw/RNASEQ_"$month"2012/"$sampleName"/"$subFold"/r1/"$filename"sequence.txt.gz > "$FQ"1.fq
#zcat /ebi/microarray/home/mar2/data/cagekid/data/raw/RNASEQ_"$month"2012/"$sampleName"/"$subFold"/r2/"$filename"sequence.txt.gz > "$FQ"2.fq

#zcat /ebi/microarray/home/mar2/data/cagekid/data/raw/RNASEQ_"$month"2012/"$sampleName"/"$subFold"/"$filename"1_sequence.txt.gz > "$FQ"1.fq
#zcat /ebi/microarray/home/mar2/data/cagekid/data/raw/RNASEQ_"$month"2012/"$sampleName"/"$subFold"/"$filename"2_sequence.txt.gz > "$FQ"2.fq

#for big input use these two options --no_run_quantifygraph --no_run_butterfly 
/nfs/ma/home/shyama/installed_soft/trinityrnaseq_r2012-06-08/./Trinity.pl --seqType fq --JM 20G --left $FQ"1.fastq" --right $FQ"2.fastq" --CPU 6 --output $out


