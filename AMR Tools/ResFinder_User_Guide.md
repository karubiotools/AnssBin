# ResFinder Command-Line Guide

## Introduction
ResFinder is a tool used for identifying antimicrobial resistance genes in bacterial genomes. It supports whole-genome sequencing (WGS) data and can be run via the command line.

---

## 1. Installation

### Install Dependencies
Ensure you have Python (>=3.6) and `pip` installed.

```bash
sudo apt update
sudo apt install python3 python3-pip git
```

### Clone the ResFinder Repository
```bash
git clone https://bitbucket.org/genomicepidemiology/resfinder.git
cd resfinder
```

### Install Required Python Packages
```bash
pip install -r requirements.txt
```

---

## 2. Downloading ResFinder Databases
ResFinder requires resistance gene databases. Download them using:

```bash
python3 install.py
```

This will download the necessary databases to the `resfinder_db` directory.

---

## 3. Running ResFinder

### Basic Command
```bash
python3 run_resfinder.py -i <input_file> -o <output_dir> -db_res <database_path>
```

### Example Usage (with FASTA File)
```bash
python3 run_resfinder.py -i example.fasta -o results/ -db_res resfinder_db/
```

### Specify Bacterial Species
```bash
python3 run_resfinder.py -i example.fasta -o results/ -db_res resfinder_db/ -s "Escherichia coli"
```

### Set Minimum Identity and Coverage Threshold
```bash
python3 run_resfinder.py -i example.fasta -o results/ -db_res resfinder_db/ -s "Escherichia coli" --threshold 90 --min_cov 60
```

---

## 4. Interpreting the Output
The results directory contains:
- **resfinder_results.txt**: Summary of detected resistance genes.
- **detailed_results.txt**: Comprehensive gene alignments and identity scores.
- **log.txt**: Log file of the analysis.

---

## 5. Running ResFinder with Assembled Genomes
If you have an assembled genome (e.g., contigs in FASTA format), you can directly run:

```bash
python3 run_resfinder.py -i contigs.fasta -o output/ -db_res resfinder_db/
```

---

## Conclusion
ResFinder is a powerful tool for detecting antimicrobial resistance genes in bacterial genomes. Users can easily use the command lines to launch ResFinder.
