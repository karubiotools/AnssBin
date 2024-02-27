# Examples of bioinformatics analyses
This page offers further examples for bioinformatics analysis. Examples include but are not limited to bacterial genomics.

## Bacterial genomics
A wide variety of bioinformatics tools can be used in bacterial genomics. The analysis steps commonly performed in the lab are:
- checking sequence reads quality (usually using FastQC)
  `fastqc -t 12 *.fastq -o fastqc`
- genome assembly (using SPAdes for Illumina reads, Dragonflye for Oxford Nanopore reads, or hybrid tools such as Unicycler to deal with both Illumina and Nanopre reads)
-  
