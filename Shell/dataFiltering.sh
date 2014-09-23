

#assuming each file has 1 to relation between read and read id, that is same read id does not appear twice. reads are in same order in both pair.
sampath="/nfs/ma/home/shyama/installed_soft/samtools-0.1.18/"

#./samtools view /nfs/ma/home/shyama/DATA/CAGEKID/bam/B00EY1B/accepted_hits.bam 18:900,000-1,200,000
#17:2200000-2300000

#cat /Volumes/ma-home/shyama/DATA/CAGEKID/B00EY1B.depth | awk '{ sum += $3 } END { print sum }'
#total coverage 4433942749
#number of base pair 59022102
#average coverage = 
chromosome=""
start=""
end=""
#filepath="/ebi/microarray/home/johan/DATA/CAGEKID/RNASEQ_JUN2012/B00EY1B/AC0MFTACXX/002/s_2_"
#samout="/nfs/ma/home/shyama/DATA/CAGEKID/bam/B00EY1B/Ch17_220k/filtered_chr17_2200k.sam"
#samfiltered=$sampath"./samtools view "$filepath" "$chromosome":"$start"-"$end" > "$samout
#newfq="/nfs/ma/home/shyama/DATA/CAGEKID/bam/B00EY1B/Ch17_220k/s_2_2_sequence.fastq"
#ids=`cut -f1 $samout | sort | uniq`
#echo "IDS:"
#echo $ids
#for i in $ids
#do
#    echo $i
#    lno=`gunzip -c $filepath"2_sequence.txt.gz" | grep -n -m 1 "@"$i | cut -d: -f1`
#    echo $lno
#    ed=`expr $lno + 3`
#    read1=`gunzip -c $filepath"2_sequence.txt.gz" | sed -n $lno,+3p`
#    echo $read1 | sed -e 's/\s/\n/g' >> $newfq
#done;

outpath="/nfs/ma/home/shyama/DATA/CAGEKID/data/tumor/"
sample="B00E4HB"
chr1="4"
samout=$outpath$sample"/"$chr1".sam"
month="APR"
input="/nfs/ma/home/mar2/data/cagekid/data/raw/RNASEQ_"$month"2012/"
filename=$input$sample"/BC07B5ACXX/002/r"
newfq1=$outpath$sample"/seq_1.fq"
newfq2=$outpath$sample"/seq_2.fq"

ids=`cut -f1 $samout | sort | uniq`
echo "IDS:"
echo $ids
for i in $ids
do
    echo $i
    lno=`gunzip -c $filepath"1/s_7_sequence.txt.gz" | grep -n -m 1 "@"$i | cut -d: -f1`
    lno2=`gunzip -c $filepath"2/s_7_sequence.txt.gz" | grep -n -m 1 "@"$i | cut -d: -f1`
    echo $lno
    echo $lno2
    ed=`expr $lno + 3`
    read1=`gunzip -c $filepath"1/s_7_sequence.txt.gz" | sed -n $lno,+3p`
    read2=`gunzip -c $filepath"2/s_7_sequence.txt.gz" | sed -n $lno2,+3p`
    echo $read1 | sed -e 's/\s/\n/g' >> $newfq1
    echo $read2 | sed -e 's/\s/\n/g' >> $newfq2
done;
