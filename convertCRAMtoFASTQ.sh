#!/bin/bash
#$ -cwd
# error = Merged with joblog
#$ -o collate_and_fastq_error_log.$JOB_ID
#$ -j y
# Email address to notify
#$ -M $USER@mail
# Notify when
#$ -m bea
 
## Edit the line below as needed:
#$ -l h_rt=2:00:00,h_data=8G
 
# echo job info on joblog:
echo "Job $JOB_ID started on:   " `hostname -s`
echo "Job $JOB_ID started on:   " `date `
echo " "
 
# load the job environment:
. /u/local/Modules/default/init/modules.sh
## Edit the line below as needed:
module load samtools
 
samtools collate /u/home/d/dercelen/bigsummer2021/"2006264_23153_0_0.cram" -o ~/bigs
ummer2021/collatedFiles/"collated_2006264_23153_0_0.cram"

samtools fastq ~/bigsummer2021/collatedFiles/"collated_2006264_23153_0_0.cram" > /u/
scratch/d/dercelen/"2006264_23153_0_0.fastq"
 
# echo job info on joblog:
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
 
