#!/usr/bin/perl -w
#use strict;

my $file="/nfs/ma/home/shyama/DATA/CAGEKID/bam/B00EY0T/whole/chrysalis/quantifyGraph_commands";
open(FILE,"<",$file) or die "Could not open ".$file ;

my @jobs=<FILE>;
for(my $i=0;$i<@jobs;$i=$i+10)
{
    my $command="bsub -o /nfs/ma/home/shyama/outputs/CAGEKID/B00EY0T/".$i." -M 24000 -R \"rusage[mem=24000]\" -J \"".$jobs[$i-($i+9)]."\"";
    my $ret=system($command);
    if($ret==0)
    {
        print "\nsubmitted";
    }
    else
    {
        print "EROOR";
        die("Could not submit ".$_);
    }
    $i++;
}

