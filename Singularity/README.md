# Singularity Guide

## 1. Installing Singularity

### Install Dependencies
```bash
sudo apt update && sudo apt install -y build-essential libseccomp-dev pkg-config squashfs-tools cryptsetup 
```

### Install Go (Required for Singularity)
```bash
wget https://go.dev/dl/go1.20.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.20.3.linux-amd64.tar.gz
export PATH=/usr/local/go/bin:$PATH
```

### Install SingularityCE
```bash
git clone https://github.com/sylabs/singularity.git
cd singularity
./mconfig && make -C builddir && sudo make -C builddir install
```

### Verify Installation
```bash
singularity --version
```

---

## 2. Pulling a Snippy Container with Singularity (to perform Variant Calling Analysis)

### Download Snippy Singularity Image (as an example to show the use of an existing bioinformatics tool)
```bash
singularity pull docker://staphb/snippy
```
This will create a `snippy_latest.sif` file.

### Verify the Image
```bash
singularity exec snippy_latest.sif snippy --help
```

---

## 3. Running Snippy for a simple Variant Calling Analysis

### Prepare Input Files
You need a reference genome and a sequencing file in FASTQ format. Example:
```bash
wget -O reference.gbk https://zenodo.org/record/582600/files/wildtype.gbk
wget -O mutant_R1.fastq https://zenodo.org/record/582600/files/mutant_R1.fastq
wget -O mutant_R2.fastq https://zenodo.org/record/582600/files/mutant_R2.fastq
```

### Run Snippy in Singularity
```bash
singularity exec snippy_latest.sif snippy --ref reference.gbk --R1 mutant_R1.fastq --R2 mutant_R2.fastq --outdir snippy_results
```

### View Snippy Output
```bash
ls snippy_results/
```

---

## Conclusion
This guide covered installing Singularity, pulling a Snippy container, and performing a basic variant calling analysis.
