# Nextflow Guide (with SPAdes example)

## 1. Installing Nextflow

### Install Java (Required for Nextflow)
```bash
sudo apt update && sudo apt install -y openjdk-11-jdk
```

### Install Nextflow
```bash
curl -s https://get.nextflow.io | bash
mv nextflow ~/bin/
export PATH=~/bin:$PATH
```

### Verify Installation
```bash
nextflow -v
```

---

## 2. Installing SPAdes
```bash
conda install -c bioconda spades
```

### Verify SPAdes Installation
```bash
spades.py --help
```

---

## 3. Creating a Nextflow Pipeline for SPAdes Assembly

### Define Input Files
Create a file named `samples.tsv` with the list of strains and their corresponding FASTQ files:
```
strain	reads_1	reads_2
strain1	reads/strain1_1.fastq.gz	reads/strain1_2.fastq.gz
strain2	reads/strain2_1.fastq.gz	reads/strain2_2.fastq.gz
strain3	reads/strain3_1.fastq.gz	reads/strain3_2.fastq.gz
```

### Create a Nextflow Script `spades.nf`
```nextflow
nextflow.enable.dsl=2

process SPADES {
    input:
        tuple val(strain), path(reads_1), path(reads_2)
    output:
        path("assemblies/${strain}/contigs.fasta")
    script:
    """
    mkdir -p assemblies/${strain}
    spades.py --pe1-1 ${reads_1} --pe1-2 ${reads_2} -o assemblies/${strain}
    """
}

workflow {
    samples = file("samples.tsv")
        .splitCsv(header: true, sep: '\t')
        .map { row -> tuple(row.strain, file(row.reads_1), file(row.reads_2)) }
    
    SPADES(samples)
}
```

---

## 4. Running the Nextflow Pipeline

### Prepare Input Files
```bash
mkdir -p reads
wget -O reads/strain1_1.fastq.gz https://example.com/strain1_1.fastq.gz
wget -O reads/strain1_2.fastq.gz https://example.com/strain1_2.fastq.gz
wget -O reads/strain2_1.fastq.gz https://example.com/strain2_1.fastq.gz
wget -O reads/strain2_2.fastq.gz https://example.com/strain2_2.fastq.gz
wget -O reads/strain3_1.fastq.gz https://example.com/strain3_1.fastq.gz
wget -O reads/strain3_2.fastq.gz https://example.com/strain3_2.fastq.gz
```

### Execute Nextflow
```bash
nextflow run spades.nf -profile standard
```

### View SPAdes Output for Each Strain
```bash
ls assemblies/
ls assemblies/strain1/
ls assemblies/strain2/
ls assemblies/strain3/
```

---

## Conclusion
This guide covers installing Nextflow, setting up a pipeline, and running SPAdes for genome assembly across multiple strains. 

