#!/usr/bin/bash -l
#SBATCH -p batch -N 1 -n 8 --mem 32gb --out prokka.log
CPU=1
if [ $SLURM_CPUS_ON_NODE ]; then
  CPU=$SLURM_CPUS_ON_NODE
fi
module load prokka/1.14.6


prokka -o Burkholderia_prokka Burkholderia_assembly.fasta