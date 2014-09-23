
#B00E4I1/AC07UWACXX/s_4/
#B00E4HB/BC07B5ACXX/s_7/
#B00E4HE/BC07B5ACXX/s_6/
#B00E4JC/BC0MLYACXX/s_1/
#B00EY1B/AC0MFTACXX/s_2/
#B00EY1X/C11D6ACXX/s_2/s_2/
#B00F3GB/C1246ACXX/s_7/s_7/
#B00F3GC/C1246ACXX/s_6/s_6/
picard="/nfs/ma/home/shyama/installed_soft/picard-tools-1.72/"
gmap="/nfs/ma/home/shyama/installed_soft/gmap-2012-12-07/bin/"
sampath="/nfs/ma/home/shyama/installed_soft/samtools-0.1.18/samtools"
igvtools="/nfs/ma/home/shyama/installed_soft/IGVTools/./igvtools"
outpath="/nfs/ma/home/shyama/DATA/CAGEKID/data/tumor/"
path="/nfs/ma/home/johan/DATA/CAGEKID/RNASEQ_MAPPED/"
bam="accepted_hits.bam"
unmapped="unmapped.bam"
samtofq=""

bsubout="/nfs/ma/home/shyama/outputs/CAGEKID/"


:<<COMMENT1
#raw/RNASEQ_APR2012/B00E4JC/BC0MLYACXX/003
#java -jar SamToFastq.jar INPUT=/nfs/ma/home/shyama/DATA/CAGEKID/data/tumor/B00E4HB/4.sam FASTQ=/nfs/ma/home/shyama/DATA/CAGEKID/data/tumor/B00E4HB/s_1.fastq SECOND_END_FASTQ=/nfs/ma/home/shyama/DATA/CAGEKID/data/tumor/B00E4HB/s_2.fastq INCLUDE_NON_PF_READS=true VALIDATION_STRINGENCY=SILENT

## tumor 
chr1="4"
for i in "B00E4HB/BC07B5ACXX/s_7/" "B00E4HE/BC07B5ACXX/s_6/" "B00E4I1/AC07UWACXX/s_4/" "B00E4JC/BC0MLYACXX/s_1/" "B00EY1B/AC0MFTACXX/s_2/" "B00EY1X/C11D6ACXX/s_2/s_2/" "B00F3GB/C1246ACXX/s_7/s_7/" "B00F3GC/C1246ACXX/s_6/s_6/"
do
    echo $i
    sample=`echo $i | cut -d '/' -f 1`
    echo $sample
    #mkdir $outpath$sample
    #$sampath view $path$i$bam $chr1 > $outpath$sample"/"$chr1".sam"
    #$sampath view $path$i$unmapped | sed 's,/1,,g' | sed 's,/2,,g' >> $outpath$sample"/"$chr1".sam" 
    #mkdir $bsubout$sample
    #bsub -o $bsubout$sample"/samTofastq.out" -J $sample"_samToFasta_"$chr1 -M 40000 -R "rusage[mem=40000]" java -jar $picard"SamToFastq.jar" INPUT=$outpath$sample"/"$chr1".sam" FASTQ=$outpath$sample"/s_chr"$chr1"_1.fastq" SECOND_END_FASTQ=$outpath$sample"/s_chr"$chr1"_2.fastq" INCLUDE_NON_PF_READS=true VALIDATION_STRINGENCY=SILENT
    #bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -M 65000 -R "rusage[mem=65000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_" "null" "tumor" $chr1  # -J $sample"_trinity_"$chr1 -w "done("$sample"_samToFasta_"$chr1")"
    #bsub -o $bsubout$sample"/gmap_chr"$chr1".out" -M 25000 -R "rusage[mem=25000]" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole$chr1/Trinity.fasta > $outpath$sample/whole$chr1/Trinity.sam" #-w "done("$sample"_trinity_"$chr1")" 
    #bsub -o $bsubout$sample"/igvtool_chr"$chr1".out" -M 8000 -R "rusage[mem=8000]" "$igvtools sort $outpath$sample/whole$chr1/Trinity.sam $outpath$sample/whole$chr1/Trinity.sorted.sam"
done
COMMENT1
##normal

for i in "B00E4GZ/AC07UWACXX/s_2/" "B00E4H2/BC07B5ACXX/s_6/" "B00E4HR/AC07UWACXX/s_2/" "B00EY0T/C0MP5ACXX/s_5/s_5/" "B00EY22/C11BWACXX/s_7/s_7/" "B00E4J9/C1246ACXX/s_7/s_7/"
do
    echo $i
    sample=`echo $i | cut -d '/' -f 1`
    echo $sample
    #mkdir $outpath$sample
    #$sampath view $path$i$bam $chr1 > $outpath$sample"/"$chr1".sam"
    #$sampath view $path$i$unmapped | sed 's,/1,,g' | sed 's,/2,,g' >> $outpath$sample"/"$chr1".sam" 
    #mkdir $bsubout$sample
    #bsub -o $bsubout$sample"/samTofastq.out" -J $sample"_samToFasta_"$chr1 -M 40000 -R "rusage[mem=40000]" java -jar $picard"SamToFastq.jar" INPUT=$outpath$sample"/"$chr1".sam" FASTQ=$outpath$sample"/s_chr"$chr1"_1.fastq" SECOND_END_FASTQ=$outpath$sample"/s_chr"$chr1"_2.fastq" INCLUDE_NON_PF_READS=true VALIDATION_STRINGENCY=SILENT
    #bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -M 65000 -R "rusage[mem=65000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_" "null" "tumor" $chr1  # -J $sample"_trinity_"$chr1 -w "done("$sample"_samToFasta_"$chr1")"
    #bsub -o $bsubout$sample"/gmap_chr"$chr1".out" -M 25000 -R "rusage[mem=25000]" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole$chr1/Trinity.fasta > $outpath$sample/whole$chr1/Trinity.sam" #-w "done("$sample"_trinity_"$chr1")" 
    bsub -o $bsubout$sample"/igvtool_chr"$chr1".out" -M 8000 -R "rusage[mem=8000]" "$igvtools sort $outpath$sample/whole$chr1/Trinity.sam $outpath$sample/whole$chr1/"$sample"Trinity.sorted.sam"
done



###############################################
:<<COMMENT2
chr1="17"
#B00E4HL,B00E4I2,B00E4I5,B00EY02,B00EY0J,B00EY19

for i in  "B00E4HL/BC07B5ACXX/s_4/" "B00E4I2/AC07UWACXX/s_3/" "B00E4I5/AC07UWACXX/s_2/" "B00EY02/BC0MLYACXX/s_5/" "B00EY0J/C0MP5ACXX/s_5/" "B00EY19/C0MP5ACXX/s_5/s_5/"
do
    echo $i
    sample=`echo $i | cut -d '/' -f 1`
    echo $sample
#    mkdir $outpath$sample
    #$sampath view $path$i$bam $chr1 > $outpath$sample"/"$chr1".sam"
    #/1 and /2 is removed because otherwise read ids do not match, i.e. one pair mapped to chr1 and other on on in unmapped, then because one pair has /1 or /2 at the end, picard thinks its read from different pair and discard them.
    #$sampath view $path$i$unmapped | sed 's,/1,,g' | sed 's,/2,,g' >> $outpath$sample"/"$chr1".sam" 
    #mkdir $bsubout$sample
    #bsub -o $bsubout$sample"/samTofastq.out" -M 40000 -R "rusage[mem=40000]" java -jar $picard"SamToFastq.jar" INPUT=$outpath$sample"/"$chr1".sam" FASTQ=$outpath$sample"/s_chr"$chr1"_1.fastq" SECOND_END_FASTQ=$outpath$sample"/s_chr"$chr1"_2.fastq" INCLUDE_NON_PF_READS=true VALIDATION_STRINGENCY=SILENT
    #bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -M 20000 -R "rusage[mem=20000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_" "null" "tumor" $chr1
    #bsub -o $bsubout$sample"/gmap_chr"$chr1".out" -M 25000 -R "rusage[mem=25000]" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole$chr1/Trinity.fasta > $outpath$sample/whole$chr1/Trinity.sam"
    #bsub -o $bsubout$sample"/igvtool_chr"$chr1".out" -M 8000 -R "rusage[mem=8000]" "$igvtools sort $outpath$sample/whole$chr1/Trinity.sam $outpath$sample/whole$chr1/Trinity.sorted.sam"
done

####normal

#B00E4H9,,B00E4HV,B00EXZY,B00EY0V,B00EY0S





chr1="19"
chr2="10"
#B00E4I4,B00EXZJ
#
for i in "B00E4I4/AC07UWACXX/s_3/" "B00EXZJ/AC0MJBACXX/s_5/"
do
    echo $i
    sample=`echo $i | cut -d '/' -f 1`
    echo $sample
    #mkdir $outpath$sample
    #$sampath view $path$i$bam $chr1 > $outpath$sample"/"$chr1"_"$chr2".sam"
    #$sampath view $path$i$unmapped | sed 's,/1,,g' | sed 's,/2,,g' >> $outpath$sample"/"$chr1"_"$chr2".sam"
    #$sampath view $path$i$bam $chr2 >> $outpath$sample"/"$chr1"_"$chr2".sam"
    
    #mkdir $bsubout$sample
    #bsub -o $bsubout$sample"/samTofastq"$chr1"_"$chr2".out" -M 60000 -R "rusage[mem=60000]" java -jar $picard"SamToFastq.jar" INPUT=$outpath$sample"/"$chr1"_"$chr2".sam" FASTQ=$outpath$sample"/s_chr"$chr1"_chr"$chr2"_1.fastq" SECOND_END_FASTQ=$outpath$sample"/s_chr"$chr1"_chr"$chr2"_2.fastq" INCLUDE_NON_PF_READS=true VALIDATION_STRINGENCY=SILENT
    
    #bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -J $sample"_"$chr1 -M 40000 -R "rusage[mem=40000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_chr"$chr2"_" "null" "tumor" $chr1"_"$chr2
    
    ###bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -J $sample"_"$chr1 -M 20000 -R "rusage[mem=20000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_" "null" "tumor" $chr1
    ###bsub -o $bsubout$sample"/trinity_chr"$chr2".out" -J $sample"_"$chr2 -M 20000 -R "rusage[mem=20000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr2"_" "null" "tumor" $chr2
    #bsub -o $bsubout$sample"/gmap_chr"$chr1$chr2".out" -M 35000 -R "rusage[mem=35000]" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole"$chr1"_"$chr2"/Trinity.fasta > $outpath$sample/whole"$chr1"_"$chr2"/Trinity.sam" # -w "done("$sample"_"$chr1")"
    ###bsub -o $bsubout$sample"/gmap_chr"$chr2".out" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole$chr2/Trinity.fasta > $outpath$sample/whole$chr2/Trinity.sam" # -w "done("$sample"_"$chr2")"
    #bsub -o $bsubout$sample"/igvtool_chr"$chr1".out" -M 8000 -R "rusage[mem=8000]" "$igvtools sort $outpath$sample/whole"$chr1"_"$chr2"/Trinity.sam $outpath$sample/whole"$chr1"_"$chr2"/Trinity.sorted.sam"
done
#
#
chr1="19"
#B00E4HE,B00E4I3,B00EY0R,B00F3GE

for i in "B00E4HE/BC07B5ACXX/s_6/" "B00E4I3/AC07UWACXX/s_2/" "B00EY0R/AC0MFTACXX/s_2/" "B00F3GE/C1246ACXX/s_6/s_6/"
do
    echo $i
    sample=`echo $i | cut -d '/' -f 1`
    echo $sample
    #mkdir $outpath$sample
    #$sampath view $path$i$bam $chr1 > $outpath$sample"/"$chr1".sam"
    #$sampath view $path$i$unmapped | sed 's,/1,,g' | sed 's,/2,,g' >> $outpath$sample"/"$chr1".sam" 
    #mkdir $bsubout$sample
    #bsub -o $bsubout$sample"/samTofastq"$chr1".out" -M 40000 -R "rusage[mem=40000]" java -jar $picard"SamToFastq.jar" INPUT=$outpath$sample"/"$chr1".sam" FASTQ=$outpath$sample"/s_chr"$chr1"_1.fastq" SECOND_END_FASTQ=$outpath$sample"/s_chr"$chr1"_2.fastq" INCLUDE_NON_PF_READS=true VALIDATION_STRINGENCY=SILENT
    #bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -M 20000 -R "rusage[mem=20000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_" "null" "tumor" $chr1
    #bsub -o $bsubout$sample"/gmap_chr"$chr1".out" -M 25000 -R "rusage[mem=25000]" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole$chr1/Trinity.fasta > $outpath$sample/whole$chr1/Trinity.sam"
    #bsub -o $bsubout$sample"/igvtool_chr"$chr1".out" -M 8000 -R "rusage[mem=8000]" "$igvtools sort $outpath$sample/whole$chr1/Trinity.sam $outpath$sample/whole$chr1/Trinity.sorted.sam"
done


chr1="2"
#B00E4IM,B00F3E1

for i in "B00E4IM/AD0P8HACXX/s_2/" "B00F3E1/D16U7ACXX/s_1/s_1/"
do
    echo $i
    sample=`echo $i | cut -d '/' -f 1`
    echo $sample
    #mkdir $outpath$sample
    #$sampath view $path$i$bam $chr1 > $outpath$sample"/"$chr1".sam"
    #$sampath view $path$i$unmapped | sed 's,/1,,g' | sed 's,/2,,g' >> $outpath$sample"/"$chr1".sam" 
    #mkdir $bsubout$sample
    #bsub -o $bsubout$sample"/samTofastq"$chr1".out" -M 40000 -R "rusage[mem=40000]" java -jar $picard"SamToFastq.jar" INPUT=$outpath$sample"/"$chr1".sam" FASTQ=$outpath$sample"/s_chr"$chr1"_1.fastq" SECOND_END_FASTQ=$outpath$sample"/s_chr"$chr1"_2.fastq" INCLUDE_NON_PF_READS=true VALIDATION_STRINGENCY=SILENT
    #bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -M 20000 -R "rusage[mem=20000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_" "null" "tumor" $chr1
    #bsub -o $bsubout$sample"/gmap_chr"$chr1".out" -M 25000 -R "rusage[mem=25000]" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole$chr1/Trinity.fasta > $outpath$sample/whole$chr1/Trinity.sam"
    bsub -o $bsubout$sample"/igvtool_chr"$chr1".out" -M 8000 -R "rusage[mem=8000]" "$igvtools sort $outpath$sample/whole$chr1/Trinity.sam $outpath$sample/whole$chr1/Trinity.sorted.sam"
done

chr1="10"
#B00F3G8,B00F3G9

for i in "B00F3G8/C1246ACXX/s_6/s_6/" "B00F3G9/C1246ACXX/s_5/s_5/"
do
    echo $i
    sample=`echo $i | cut -d '/' -f 1`
    #echo $sample
    #mkdir $outpath$sample
    #$sampath view $path$i$bam $chr1 > $outpath$sample"/"$chr1".sam"
    #$sampath view $path$i$unmapped | sed 's,/1,,g' | sed 's,/2,,g' >> $outpath$sample"/"$chr1".sam" 
    #mkdir $bsubout$sample
    #bsub -o $bsubout$sample"/samTofastq"$chr1".out" -M 40000 -R "rusage[mem=40000]" java -jar $picard"SamToFastq.jar" INPUT=$outpath$sample"/"$chr1".sam" FASTQ=$outpath$sample"/s_chr"$chr1"_1.fastq" SECOND_END_FASTQ=$outpath$sample"/s_chr"$chr1"_2.fastq" INCLUDE_NON_PF_READS=true VALIDATION_STRINGENCY=SILENT
    #bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -M 20000 -R "rusage[mem=20000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_" "null" "tumor" $chr1
    #bsub -o $bsubout$sample"/gmap_chr"$chr1".out" -M 25000 -R "rusage[mem=25000]" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole$chr1/Trinity.fasta > $outpath$sample/whole$chr1/Trinity.sam"
    bsub -o $bsubout$sample"/igvtool_chr"$chr1".out" -M 8000 -R "rusage[mem=8000]" "$igvtools sort $outpath$sample/whole$chr1/Trinity.sam $outpath$sample/whole$chr1/Trinity.sorted.sam"
done


chr1="17"
chr2="7"
#B00EXZG,B00EY18
#
for i in "B00EXZG/BC0MLYACXX/s_3/" "B00EY18/AC0MFTACXX/s_1/"
do
    echo $i
    sample=`echo $i | cut -d '/' -f 1`
    #echo $sample
    #mkdir $outpath$sample
    #$sampath view $path$i$bam $chr1 > $outpath$sample"/"$chr1"_"$chr2".sam"
    #$sampath view $path$i$unmapped | sed 's,/1,,g' | sed 's,/2,,g' >> $outpath$sample"/"$chr1"_"$chr2".sam"
    #$sampath view $path$i$bam $chr2 >> $outpath$sample"/"$chr1"_"$chr2".sam"
    
    #mkdir $bsubout$sample
    #bsub -o $bsubout$sample"/samTofastq"$chr1"_"$chr2".out" -M 60000 -R "rusage[mem=60000]" java -jar $picard"SamToFastq.jar" INPUT=$outpath$sample"/"$chr1"_"$chr2".sam" FASTQ=$outpath$sample"/s_chr"$chr1"_chr"$chr2"_1.fastq" SECOND_END_FASTQ=$outpath$sample"/s_chr"$chr1"_chr"$chr2"_2.fastq" INCLUDE_NON_PF_READS=true VALIDATION_STRINGENCY=SILENT
    
    #bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -J $sample"_"$chr1"_"$chr2 -M 40000 -R "rusage[mem=40000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_chr"$chr2"_" "null" "tumor" $chr1"_"$chr2
    
    ###bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -J $sample"_"$chr1 -M 20000 -R "rusage[mem=20000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_" "null" "tumor" $chr1
    ###bsub -o $bsubout$sample"/trinity_chr"$chr2".out" -J $sample"_"$chr2 -M 20000 -R "rusage[mem=20000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr2"_" "null" "tumor" $chr2
    #bsub -o $bsubout$sample"/gmap_chr"$chr1$chr2".out" -M 35000 -R "rusage[mem=35000]" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole"$chr1"_"$chr2"/Trinity.fasta > $outpath$sample/whole"$chr1"_"$chr2"/Trinity.sam" # -w "done("$sample"_"$chr1")"
    ###bsub -o $bsubout$sample"/gmap_chr"$chr2".out" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole$chr2/Trinity.fasta > $outpath$sample/whole$chr2/Trinity.sam" # -w "done("$sample"_"$chr2")"
    bsub -o $bsubout$sample"/igvtool_chr"$chr1".out" -M 8000 -R "rusage[mem=8000]" "$igvtools sort $outpath$sample/whole"$chr1"_"$chr2"/Trinity.sam $outpath$sample/whole"$chr1"_"$chr2"/Trinity.sorted.sam"
done


chr1="7"
#B00E4JD,B00E4JG,B00EXZQ,B00EY19,B00EY1K
for i in "B00E4JD/AC0MJBACXX/s_5/" "B00E4JG/BC0MMKACXX/s_7/" "B00EXZQ/BC0MMKACXX/s_7/" "B00EY19/C0MP5ACXX/s_5/s_5/" "B00EY1K/C0LM0ACXX/s_3/s_3/"
do
    echo $i
    sample=`echo $i | cut -d '/' -f 1`
    #echo $sample
    #mkdir $outpath$sample
    #$sampath view $path$i$bam $chr1 > $outpath$sample"/"$chr1".sam"
    #$sampath view $path$i$unmapped | sed 's,/1,,g' | sed 's,/2,,g' >> $outpath$sample"/"$chr1".sam" 
    #mkdir $bsubout$sample
    #bsub -o $bsubout$sample"/samTofastq"$chr1".out" -M 40000 -R "rusage[mem=40000]" java -jar $picard"SamToFastq.jar" INPUT=$outpath$sample"/"$chr1".sam" FASTQ=$outpath$sample"/s_chr"$chr1"_1.fastq" SECOND_END_FASTQ=$outpath$sample"/s_chr"$chr1"_2.fastq" INCLUDE_NON_PF_READS=true VALIDATION_STRINGENCY=SILENT
    #bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -M 20000 -R "rusage[mem=20000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_" "null" "tumor" $chr1
    #bsub -o $bsubout$sample"/gmap_chr"$chr1".out" -M 25000 -R "rusage[mem=25000]" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole$chr1/Trinity.fasta > $outpath$sample/whole$chr1/Trinity.sam"
    bsub -o $bsubout$sample"/igvtool_chr"$chr1".out" -M 8000 -R "rusage[mem=8000]" "$igvtools sort $outpath$sample/whole$chr1/Trinity.sam $outpath$sample/whole$chr1/Trinity.sorted.sam"
done


COMMENT2

chr1="X"
#B00E4HE

for i in "B00E4HE/BC07B5ACXX/s_6/"
do
    echo $i
    sample=`echo $i | cut -d '/' -f 1`
    echo $sample
    #mkdir $outpath$sample
    #$sampath view $path$i$bam $chr1 > $outpath$sample"/"$chr1".sam"
    #$sampath view $path$i$unmapped | sed 's,/1,,g' | sed 's,/2,,g' >> $outpath$sample"/"$chr1".sam" 
    #mkdir $bsubout$sample
    #bsub -o $bsubout$sample"/samTofastq"$chr1".out" -M 40000 -R "rusage[mem=40000]" java -jar $picard"SamToFastq.jar" INPUT=$outpath$sample"/"$chr1".sam" FASTQ=$outpath$sample"/s_chr"$chr1"_1.fastq" SECOND_END_FASTQ=$outpath$sample"/s_chr"$chr1"_2.fastq" INCLUDE_NON_PF_READS=true VALIDATION_STRINGENCY=SILENT
    #bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -M 20000 -R "rusage[mem=20000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_" "null" "tumor" $chr1
    #bsub -o $bsubout$sample"/gmap_chr"$chr1".out" -M 25000 -R "rusage[mem=25000]" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole$chr1/Trinity.fasta > $outpath$sample/whole$chr1/Trinity.sam"
    bsub -o $bsubout$sample"/igvtool_chr"$chr1".out" -M 8000 -R "rusage[mem=8000]" "$igvtools sort $outpath$sample/whole$chr1/Trinity.sam $outpath$sample/whole$chr1/"$sample"Trinity.sorted.sam"
done


chr1="16"
chr2="15"
#B00E4J5
for i in "B00E4J5/BC0GGFACXX/s_2/"
do
    echo $i
    sample=`echo $i | cut -d '/' -f 1`
    echo $sample
    #mkdir $outpath$sample
    #$sampath view $path$i$bam $chr1 > $outpath$sample"/"$chr1"_"$chr2".sam"
    #$sampath view $path$i$unmapped | sed 's,/1,,g' | sed 's,/2,,g' >> $outpath$sample"/"$chr1"_"$chr2".sam"
    #$sampath view $path$i$bam $chr2 >> $outpath$sample"/"$chr1"_"$chr2".sam"
    
    #mkdir $bsubout$sample
    #bsub -o $bsubout$sample"/samTofastq"$chr1"_"$chr2".out" -M 60000 -R "rusage[mem=60000]" java -jar $picard"SamToFastq.jar" INPUT=$outpath$sample"/"$chr1"_"$chr2".sam" FASTQ=$outpath$sample"/s_chr"$chr1"_chr"$chr2"_1.fastq" SECOND_END_FASTQ=$outpath$sample"/s_chr"$chr1"_chr"$chr2"_2.fastq" INCLUDE_NON_PF_READS=true VALIDATION_STRINGENCY=SILENT
    
    #bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -J $sample"_"$chr1"_"$chr2 -M 40000 -R "rusage[mem=40000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_chr"$chr2"_" "null" "tumor" $chr1"_"$chr2
    
    ###bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -J $sample"_"$chr1 -M 20000 -R "rusage[mem=20000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_" "null" "tumor" $chr1
    ###bsub -o $bsubout$sample"/trinity_chr"$chr2".out" -J $sample"_"$chr2 -M 20000 -R "rusage[mem=20000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr2"_" "null" "tumor" $chr2
    #bsub -o $bsubout$sample"/gmap_chr"$chr1$chr2".out" -M 35000 -R "rusage[mem=35000]" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole"$chr1"_"$chr2"/Trinity.fasta > $outpath$sample/whole"$chr1"_"$chr2"/Trinity.sam" # -w "done("$sample"_"$chr1")"
    ###bsub -o $bsubout$sample"/gmap_chr"$chr2".out" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole$chr2/Trinity.fasta > $outpath$sample/whole$chr2/Trinity.sam" # -w "done("$sample"_"$chr2")"
    bsub -o $bsubout$sample"/igvtool_chr"$chr1".out" -M 8000 -R "rusage[mem=8000]" "$igvtools sort $outpath$sample/whole"$chr1"_"$chr2"/Trinity.sam $outpath$sample/whole"$chr1"_"$chr2"/"$sample"Trinity.sorted.sam"
done

chr1="3"

#B00E4HZ,B00E4I0,B00E4I1,B00E4J2,B00E4JF,B00EXZM,B00EY11,B00EY12

for i in "B00E4HZ/BC08T1ACXX/s_2/" "B00E4I0/AC07UWACXX/s_4/" "B00E4I1/AC07UWACXX/s_4/" "B00E4J2/BC0GGFACXX/s_5/" "B00E4JF/BC0GGFACXX/s_5/" "B00EXZM/C0LM0ACXX/s_7/s_7/" "B00EY11/AC0RMCACXX/s_2/" "B00EY12/C0LM0ACXX/s_6/s_6/"
do
    echo $i
    sample=`echo $i | cut -d '/' -f 1`
    echo $sample
    #mkdir $outpath$sample
    #$sampath view $path$i$bam $chr1 > $outpath$sample"/"$chr1".sam"
    #$sampath view $path$i$unmapped | sed 's,/1,,g' | sed 's,/2,,g' >> $outpath$sample"/"$chr1".sam" 
    #mkdir $bsubout$sample
    #bsub -o $bsubout$sample"/samTofastq"$chr1".out" -M 40000 -R "rusage[mem=40000]" java -jar $picard"SamToFastq.jar" INPUT=$outpath$sample"/"$chr1".sam" FASTQ=$outpath$sample"/s_chr"$chr1"_1.fastq" SECOND_END_FASTQ=$outpath$sample"/s_chr"$chr1"_2.fastq" INCLUDE_NON_PF_READS=true VALIDATION_STRINGENCY=SILENT
    #bsub -o $bsubout$sample"/trinity_chr"$chr1".out" -M 20000 -R "rusage[mem=20000]" sh "/nfs/ma/home/shyama/code/CAGEKID/Shell/pre_post_trinityRun.sh" $sample "null" "s_chr"$chr1"_" "null" "tumor" $chr1
    #bsub -o $bsubout$sample"/gmap_chr"$chr1".out" -M 25000 -R "rusage[mem=25000]" "$gmap./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 $outpath$sample/whole$chr1/Trinity.fasta > $outpath$sample/whole$chr1/Trinity.sam"
    bsub -o $bsubout$sample"/igvtool_chr"$chr1".out" -M 8000 -R "rusage[mem=8000]" "$igvtools sort $outpath$sample/whole$chr1/Trinity.sam $outpath$sample/whole$chr1/"$sample"Trinity.sorted.sam"
done
