# **Shotgun Metagenomic Analysis Workflow**

Shotgun metagenomics allows for the comprehensive analysis of microbial communities by sequencing all genetic material in a sample. The workflow involves several key steps, from raw sequencing data processing to functional and taxonomic analysis.

---

## **1. Raw Data Preprocessing**
**Tools:** `FastQC`, `Trimmomatic`, `BBTools`, `Cutadapt`  
- **Quality Check:** Use `FastQC` to assess read quality.  
- **Trimming & Filtering:** Use `Trimmomatic`, `Cutadapt`, or `BBTools` to remove adapters, low-quality bases, and short reads.  

---

## **2. Host DNA Removal**
**Tools:** `Bowtie2`, `BWA`, `Kraken2`, `DeconSeq`  
- If working with host-associated samples (e.g., human gut microbiome), remove host DNA using `Bowtie2` or `BWA` by mapping reads to the host genome and filtering out aligned reads.  

---

## **3. Taxonomic Classification**
**Tools:** `Kraken2`, `MetaPhlAn3`, `Kaiju`, `Centrifuge`  
- **Kraken2:** Uses k-mers for taxonomic classification.  
- **MetaPhlAn3:** Marker gene-based approach for profiling microbial composition.  
- **Kaiju:** Classifies reads based on protein-level similarities (useful for highly divergent organisms).  
- **Centrifuge:** Efficient for classifying large datasets with a compressed database.  

---

## **4. De Novo Assembly (Optional)**
**Tools:** `MEGAHIT`, `SPAdes (metagenomic mode)`  
- If studying novel microbes, assemble metagenomes to reconstruct genomes from the reads.  
- **MEGAHIT:** Ultra-fast assembler for large metagenomic datasets.  
- **SPAdes:** Better for high-quality assemblies but requires more computational power.  

---

## **5. Metagenome-Assembled Genomes (MAGs) (Optional)**
**Tools:** `MetaBAT2`, `CONCOCT`, `MaxBin2`  
- Used for **binning** assembled contigs into individual microbial genomes.  
- **CheckM:** Assesses completeness and contamination of bins.  

---

## **6. Functional Annotation**
**Tools:** `HUMAnN3`, `PROKKA`, `EggNOG-mapper`, `KEGG`, `GhostKOALA`  
- **HUMAnN3:** Predicts pathways and gene families in metagenomic samples.  
- **PROKKA:** Annotates assembled genomes.  
- **EggNOG-mapper:** Assigns orthologous groups to genes.  
- **KEGG/GhostKOALA:** Maps genes to metabolic pathways.  

---

## **7. Antibiotic Resistance & Virulence Gene Identification**
**Tools:** `CARD (ResFinder)`, `VFDB`, `AMRFinder`  
- **CARD (ResFinder):** Identifies antibiotic resistance genes.  
- **VFDB:** Detects virulence factors in microbial genomes.  
- **AMRFinder:** Predicts antimicrobial resistance genes.  

---

## **8. Statistical and Comparative Analysis**
**Tools:** `R (phyloseq, vegan, DESeq2)`, `QIIME2`, `MicrobiomeAnalyst`  
- **phyloseq:** R package for microbiome statistical analysis.  
- **vegan:** Computes alpha and beta diversity.  
- **DESeq2:** Finds differentially abundant microbial species.  
- **MicrobiomeAnalyst:** Web-based tool for interactive analysis.  

---

## **9. Visualization**
**Tools:** `Krona`, `Pavian`, `ggplot2`, `GraphLan`  
- **Krona:** Interactive hierarchical taxonomy visualization.  
- **Pavian:** Web-based taxonomic visualization.  
- **ggplot2:** R package for custom visualizations.  
- **GraphLan:** Circular microbial community visualization.  

---

## **Summary of Key Steps**
1. **Quality Control** (`FastQC`, `Trimmomatic`)  
2. **Host DNA Removal** (`Bowtie2`, `DeconSeq`)  
3. **Taxonomic Classification** (`Kraken2`, `MetaPhlAn3`)  
4. **Assembly (Optional)** (`MEGAHIT`, `SPAdes`)  
5. **Binning (Optional)** (`MetaBAT2`, `MaxBin2`)  
6. **Functional Annotation** (`HUMAnN3`, `KEGG`)  
7. **Resistance & Virulence Analysis** (`CARD`, `VFDB`)  
8. **Statistical & Diversity Analysis** (`phyloseq`, `vegan`, `DESeq2`)  
9. **Visualization** (`Krona`, `ggplot2`, `GraphLan`)  
