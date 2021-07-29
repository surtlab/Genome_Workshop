## Welcome to Bacterial Genome Assembly and Annotation Module

### Setting up the environment

A PDF of the shared slides can be found [HERE](https://github.com/surtlab/Genome_Workshop/raw/main/GenomeWorkshop.pdf)

I have set up everything in my shared folder on the hpc.ilri.cgiar.org system so that the paths all point towards this shared folder for files. 

There are also a few basic scripts from running unicycler and prokka in the SLURM environment, which can be copied by the following command into the same directory as the sequence read and data files

```
git clone https://github.com/surtlab/Genome_Workshop.git
```

### Genome Assembly

There are numerous types of genome assemlbers that can be used on bacterial genomes, and which can take short and long reads as input as well as providing hybrid assembly options.

Today we'll use `unicycler`, which is a wrapper program that's pretty flexible in terms of how assemblies are built and does a decent job of correcting some underlying assembly errors if using only long reads. 

If run in hybrid mode, `unicycler` will first build an assembly from the short Illumina reads, which presumably have high depth and relatively low errors. It will then independently assemble the long reads and use this as a scaffold to place the short read contigs. Once this is completed, it will polish the assembly with long reads to fix structural issues (using `racon`) and short reads to fix nucleotide erris (using `pilon`).

If only using long reads, `unicycler` will assemble the genome using the long reads and `miniasm` and then polish with `racon`.

To run unicycler from the shared directory paste the following

```
sbatch Genome_Workshop/scripts/unicycler.sh
```

### Genome Annotation

Genome annotation is much more straightforward for bacterial genomes than eukaryotes (there really aren't many introns to worry about). Therefore, what the annotation pipelines are doing is placing start and stop codons in proximity to predicted ribosomal binding sites, while also pulling data from other annotated genomes to improve the annotation.

If you'll be submitting genomes to the NCBI and Genbank as a public repository, there is a built in annotation pipeline called PGAP (Prokaryotic Genome Annotation Pipeline) that does a very good streamlined job to annotate assemblies.

Today we'll use `prokka` as a tool, which is a bit more useful than PGAP given that you can tune the annotations in more specific ways depending on taxa you're working with. To run `prokka` from the shared directory paste the following

```
sbatch Genome_Workshop/scripts/prokka.sh
```

