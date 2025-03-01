# Snakemake Guide (with SPAdes example)

## 1. Installing Snakemake

### Install Conda (if not already installed)
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
source ~/.bashrc
```

### Install Mamba (Faster Package Manager)
```bash
conda install -c conda-forge mamba
```

### Install Snakemake
```bash
mamba create -c conda-forge -c bioconda -n snakemake snakemake
conda activate snakemake
```

### Verify Installation
```bash
snakemake --help
```

---

## 2. Installing SPAdes
```bash
mamba install -c bioconda spades
```

### Verify SPAdes Installation
```bash
spades.py --help
```

---

## 3. Creating a Snakemake Workflow for SPAdes Assembly

### Define Input Files
Create a file named `samples.tsv` with the list of strains and their corresponding FASTQ files:
```
strain	reads_1	reads_2
strain1	reads/strain1_1.fastq.gz	reads/strain1_2.fastq.gz
strain2	reads/strain2_1.fastq.gz	reads/strain2_2.fastq.gz
strain3	reads/strain3_1.fastq.gz	reads/strain3_2.fastq.gz
```

### Define a Snakemake Rule for SPAdes
Create a file named `Snakefile`:
```python
import pandas as pd

# Read sample information
samples = pd.read_csv("samples.tsv", sep="\t")

rule all:
    input:
        expand("assemblies/{strain}/contigs.fasta", strain=samples["strain"].tolist())

rule spades:
    input:
        reads_1=lambda wildcards: samples.loc[samples["strain"] == wildcards.strain, "reads_1"].values[0],
        reads_2=lambda wildcards: samples.loc[samples["strain"] == wildcards.strain, "reads_2"].values[0]
    output:
        directory("assemblies/{strain}")
    shell:
        "spades.py --pe1-1 {input.reads_1} --pe1-2 {input.reads_2} -o {output}"
```

---

## 4. Running the Snakemake Workflow

### Prepare Input Files (these fictive files could be replaced by user's files)
```bash
mkdir -p reads
wget -O reads/strain1_1.fastq.gz https://example.com/strain1_1.fastq.gz
wget -O reads/strain1_2.fastq.gz https://example.com/strain1_2.fastq.gz
wget -O reads/strain2_1.fastq.gz https://example.com/strain2_1.fastq.gz
wget -O reads/strain2_2.fastq.gz https://example.com/strain2_2.fastq.gz
wget -O reads/strain3_1.fastq.gz https://example.com/strain3_1.fastq.gz
wget -O reads/strain3_2.fastq.gz https://example.com/strain3_2.fastq.gz
```

### Execute Snakemake using 4 cores
```bash
snakemake --cores 4
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
This guide now allows running SPAdes on multiple strains using Snakemake. 
The workflow is scalable and can be expanded for larger datasets.
