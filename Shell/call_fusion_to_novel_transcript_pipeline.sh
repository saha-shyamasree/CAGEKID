
path=$1;
outpath=$2;
t=$path"B*"
for d in $t
do
    echo "running "
    echo $path
    if [ -d "$d" ] && [ "$d" != "B00E4GS.64K0EAAXX.6" ]
    then
        #echo $d
        sample=`echo $d | awk -F'/' '{print $NF}'`
        echo $sample
        chr1="7"
        bsub -o /nfs/ma/home/shyama/outputs/CAGEKID/$sample".txt" -M 60000 -R "rusage[mem=60000]" "sh fusion_to_novel_transcript_pipeline.sh $sample"/" $chr1 $outpath $path all"
    fi
    #break;
done

#this code and fusion_to_novel_transcript_pipeline.sh should be in same folder and this code should be run from the directory where it sits.