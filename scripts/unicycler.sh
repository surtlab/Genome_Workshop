#!/usr/bin/bash -l
#SBATCH -p batch -N 1 -n 8 --mem 32gb --out unicycler_assemble.log
CPU=1
if [ $SLURM_CPUS_ON_NODE ]; then
  CPU=$SLURM_CPUS_ON_NODE
fi
module load unicycler/0.4.7


unicycler -l Nanopore_data_fastq.gz -o Burkholderia_unicycler