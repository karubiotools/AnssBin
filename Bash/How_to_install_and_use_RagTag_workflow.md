# How to install and use RagTag workflow

This guide will help you install **RagTag** and run a basic pipeline (`correction → scaffolding → patching`) using a provided shell script.

---

## 🧬 What is RagTag?

[RagTag](https://github.com/malonge/RagTag) is a toolkit for genome assembly scaffolding and patching using a reference genome.

---

## 🛠 Installation

RagTag requires Python ≥3.6 and can be installed using `conda` (recommended) or `pip`.

### Option 1: Using conda (recommended)
```bash
conda create -n ragtag-env -c bioconda -c conda-forge ragtag minimap2 samtools
conda activate ragtag-env

### Option 2: Using pip
```bash
pip install git+https://github.com/malonge/RagTag.git

---

## Use RagTag workflow (bash script)

Make the bash script executable with the "chmod" command:
```bash
chmod +x ragtag_workflow.sh

Run the workflow script using both reference and query FASTA files:
```bash
./ragtag_workflow.sh reference.fasta query.fasta

