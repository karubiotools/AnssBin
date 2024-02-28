# Examples of bioinformatics analyses
This page offers further examples for bioinformatics analysis. Examples include but are not limited to bacterial genomics.
The tools mentioned in the following examples can be installed via conda/bioconda or other means (apt-get, homebrew, from source, etc.).

## Bacterial genomics
A wide variety of bioinformatics tools can be used in bacterial genomics. The analysis steps commonly performed in the lab are:
- checking sequence reads quality (usually using [FastQC](https://github.com/s-andrews/FastQC)):
  
  `fastqc -t 12 *.fastq -o fastqc`
- genome assembly (using [SPAdes](https://github.com/ablab/spades) for Illumina reads, [Dragonflye](https://github.com/rpetit3/dragonflye) for Oxford Nanopore reads, or hybrid tools such as [Unicycler](https://github.com/rrwick/Unicycler) to deal with both Illumina and Nanopre reads). Genome assembly step is usually performed directly on several paired-end files as follows:
  
  `for i in $(ls *.fastq | rev | cut -c 10- | rev | uniq); do spades.py -1 ${i}_R1.fastq -2 ${i}_R2.fastq -t 6 --cov-cutoff auto --careful -o $i; done`

  `dragonflye --reads my-ont.fastq.gz --outdir dragonflye --gsize 5000000`

  `unicycler -1 reads_R1.fastq -2 reads_R2.fastq -l ont_read.fastq -o resultUnicyler`
- checking genome assembly quality using [QUAST](https://github.com/ablab/quast) (once the assmebled genome files are available):

  `for i in *.fasta; do quast -o $i.QUAST_RESULT -r referenceSequence.fasta -t 16  $i ; done`
- [ABRicate](https://github.com/tseemann/abricate) tool can be used to search for resistance, virulence, and plasmid genes:

  `for i in *.fasta; do abricate --db resfinder $i > $i.resfinder.tab; done`
  
  `for i in *.fasta; do abricate --db vfdb $i > $i.vfdb.tab; done`

  `for i in *.fasta; do abricate --db plasmidfinder $i > $i.plasmidfinder.tab; done`

  `abricate --summary *.resfinder.tab > Summary_resfinder.xls`

  `abricate --summary *.vfdb.tab > Summary_vfdb.xls`

  `abricate --summary *.plasmidfinder.tab > Summary_plasmidfinder.xls`
  
