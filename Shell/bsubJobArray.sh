file="/nfs/ma/home/shyama/DATA/CAGEKID/bam/B00EY0T/whole/chrysalis/quantifyGraph_commands"
no_of_line=`wc -l $file | cut -d " " -f1`
echo $no_of_line
#for ((  i = 1 ;  i <= $no_of_line;  i=i+50  ))
#do
#  echo "Welcome $i times"
#	j=`expr $i+49`
  bsub -q research-rh6 -n 10 -J quantity[70501-80500] -oo /nfs/ma/home/shyama/outputs/CAGEKID/B00EY0T/stdo.out -eo /nfs/ma/home/shyama/outputs/CAGEKID/B00EY0T/err.eout /nfs/ma/home/shyama/code/CAGEKID/Shell/./runQuantifyGraph.sh
#done
##bsub -q research-rh6 -M 60000 -R rusage[mem=60000] -J count[$i-186] -N -oo /nfs/ma/home/shyama/outputs/CAGEKID/$i.out -eo /homes/johan/ma-johan/DATA/CAGEKID/HTSEQ/logs/error/%I.eout .count_array_ens66b.sh
#done /nfs/ma/home/shyama/code/CAGEKID/Shell/
