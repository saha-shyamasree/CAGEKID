
bsub -o /nfs/ma/home/shyama/outputs/CAGEKID/gmap_align.out -M 24000 -R "rusage[mem=24000]" "/nfs/ma/home/shyama/installed_soft/gmap-2012-12-07/bin/./gmap -t 5 -f samse -D /nfs/ma/home/shyama/DATA/CAGEKID/reference/gmapDB/ -d HomoSapiens66 /nfs/ma/home/shyama/DATA/CAGEKID/reference/Trinity.fasta > /nfs/ma/home/shyama/DATA/CAGEKID/reference/Trinity.sam"