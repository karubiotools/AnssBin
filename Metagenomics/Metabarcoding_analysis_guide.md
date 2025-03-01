# Metabarcoding Analysis Guide

## Introduction
Metabarcoding is a powerful technique for studying microbial communities using high-throughput sequencing. This guide outlines an easy-to-follow workflow using well-known bioinformatics tools: **QIIME2, DADA2, phyloseq, and vegan**.

---

## 1. Data Preparation
Ensure you have your raw sequencing data (FASTQ files) ready. Typically, these include forward (`*_R1.fastq.gz`) and reverse (`*_R2.fastq.gz`) reads.

### Check Raw Reads Quality
Use `FastQC` to assess read quality:
```bash
fastqc *.fastq.gz -o fastqc_reports/
```

### Trim Adapters (Optional)
If necessary, trim adapters using `cutadapt`:
```bash
cutadapt -a AGATCGGAAGAG -A AGATCGGAAGAG -o trimmed_R1.fastq.gz -p trimmed_R2.fastq.gz raw_R1.fastq.gz raw_R2.fastq.gz
```

---

## 2. Sequence Processing with DADA2 (R)
DADA2 is used for denoising and generating ASVs (Amplicon Sequence Variants).

### Install and Load DADA2
```r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("dada2")
library(dada2)
```

### DADA2 Workflow
```r
# Define paths
path <- "./data"
fns <- list.files(path, pattern="fastq.gz", full.names=TRUE)

# Filter and trim reads
filtFs <- file.path(path, "filtered", basename(fns))
filterAndTrim(fns, filtFs, truncLen=c(240,160), maxN=0, maxEE=c(2,2), rm.phix=TRUE, compress=TRUE, multithread=TRUE)

# Learn error rates
errF <- learnErrors(filtFs, multithread=TRUE)

# Dereplicate sequences
derepFs <- derepFastq(filtFs)

dadaFs <- dada(derepFs, err=errF, multithread=TRUE)

# Create sequence table
seqtab <- makeSequenceTable(dadaFs)
```

---

## 3. Taxonomic Classification in QIIME2
Convert DADA2 output for use in QIIME2:

### Convert to BIOM Format
```r
library(phyloseq)
library(biomformat)

biom_table <- make_biom(seqtab)
write_biom(biom_table, "feature-table.biom")
```

### Import into QIIME2
```bash
qiime tools import \
  --input-path feature-table.biom \
  --type 'FeatureTable[Frequency]' \
  --output-path feature-table.qza
```

### Assign Taxonomy
```bash
qiime feature-classifier classify-sklearn \
  --i-classifier silva-138-99-classifier.qza \
  --i-reads rep-seqs.qza \
  --o-classification taxonomy.qza
```

---

## 4. Data Visualization with phyloseq
### Load Phyloseq and Import Data
```r
library(phyloseq)

# Import files
otu_table <- import_biom("feature-table.biom")
tax_table <- read.csv("taxonomy.tsv", sep="\t", row.names=1)

# Create phyloseq object
ps <- phyloseq(otu_table(otu_table, taxa_are_rows=TRUE), tax_table(as.matrix(tax_table)))

# Plot barplot
plot_bar(ps, fill="Phylum")
```

---

## 5. Alpha and Beta Diversity with vegan
### Install and Load vegan
```r
install.packages("vegan")
library(vegan)
```

### Alpha Diversity
```r
shannon <- diversity(otu_table(ps), index="shannon")
boxplot(shannon ~ sample_data(ps)$Group, main="Shannon Diversity")
```

### Beta Diversity (NMDS)
```r
dist_matrix <- vegdist(otu_table(ps), method="bray")
nmds <- metaMDS(dist_matrix)
plot(nmds, type="t")
```

---

## Conclusion
This guide provides an easy-to-follow workflow for metabarcoding analysis using QIIME2, DADA2, phyloseq, and vegan. Users can easily use these scripts in function of their research needs.
