#sampleName="B00E4HB"
#subFold="BC07B5ACXX/002"
#filename="s_7_"
#month="APR"
#desc="tumor"
#mkdir "/nfs/ma/home/shyama/outputs/CAGEKID/"$sampleName
path=/ebi/microarray/home/SYBARIS/rna-seq/rna-seq2/fastq/
out=/nfs/ma/home/shyama/DATA/SYBARIS/
desc=RNA-Seq/M28/
count=0
while read line
do
    r=`echo $((count%2))`
    if [ $r == 0 ]
    then
    samplename=`echo $line | awk -F'[, ]' '{print $1$2}'`
    echo "samplename: "$samplename
    fname=`echo $line | awk -F'[,_]' '{print $2"_"$3"_"$4}'`
    echo "fname: "$fname
    #mkdir $out$desc$samplename
    #zcat $path$fname"_1.fastq.gz" > $out$desc$samplename"/"$fname"_1.fastq"
    #zcat $path$fname"_2.fastq.gz" > $out$desc$samplename"/"$fname"_2.fastq"
    bsub -o "/nfs/ma/home/shyama/outputs/SYBARIS/"$sample"/inchworm_chrysalis.out" -M 40000 -R "rusage[mem=40000]" -n 2 "sh /nfs/ma/home/shyama/code/SYBARIS/Shell/pre_post_trinityRun.sh $samplename null $fname"_" null $desc $out"
    #sh /nfs/ma/home/shyama/code/SYBARIS/Shell/pre_post_trinityRun.sh $samplename null $fname"_" null $desc $out
    fi
    count=`expr $count + 1`
done < /nfs/ma/home/shyama/DATA/SYBARIS/RNA-Seq/M28/sample_name_map.csv

#bsub -o "/nfs/ma/home/shyama/outputs/SYBARIS/"$sample"/inchworm_chrysalis.out" -M 80000 -R "rusage[mem=64000]" -n 2 "sh /nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh $sampleName $subFold $filename $month $desc"