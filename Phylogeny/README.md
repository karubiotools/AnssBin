# Phylogenetic Software Guide (Command Line)

## Introduction
This guide provides an easy-to-use reference for running phylogenetic analyses using **PhyML, RAxML, IQ-TREE, and FastTree** via the command line.

---

## 1. Installing the Tools

### Install PhyML
```bash
sudo apt install phyml  # Ubuntu/Debian
```

### Install RAxML
```bash
sudo apt install raxml  # Ubuntu/Debian
```

### Install IQ-TREE
```bash
sudo apt install iqtree  # Ubuntu/Debian
```

### Install FastTree
```bash
sudo apt install fasttree  # Ubuntu/Debian
```

For macOS, use Homebrew:
```bash
brew install phyml raxml iqtree fasttree
```

For other OS, download binaries from respective official websites.

---

## 2. Running PhyML

### Basic Command
```bash
phyml -i input.phy -d nt -m GTR -b 100
```

### Explanation:
- `-i input.phy` → Input alignment file in PHYLIP format.
- `-d nt` → Specifies nucleotide sequences.
- `-m GTR` → General Time Reversible model.
- `-b 100` → Bootstrap with 100 replicates.

---

## 3. Running RAxML

### Basic Command
```bash
raxmlHPC -s input.phy -n output_tree -m GTRGAMMA -p 12345 -# 100
```

### Explanation:
- `-s input.phy` → Input alignment file in PHYLIP format.
- `-n output_tree` → Output tree file name.
- `-m GTRGAMMA` → GTR model with gamma distribution.
- `-p 12345` → Random seed.
- `-# 100` → Bootstrap 100 replicates.

---

## 4. Running IQ-TREE

### Basic Command
```bash
iqtree -s input.phy -m GTR+G -bb 1000 -alrt 1000
```

### Explanation:
- `-s input.phy` → Input alignment file in PHYLIP or FASTA format.
- `-m GTR+G` → GTR model with gamma distribution.
- `-bb 1000` → Bootstrap 1000 ultrafast replicates.
- `-alrt 1000` → Approximate likelihood-ratio test with 1000 replicates.

---

## 5. Running FastTree

### Basic Command
```bash
FastTree -gtr -nt input.fasta > output.tree
```

### Explanation:
- `-gtr` → Uses the GTR model.
- `-nt` → Specifies nucleotide sequences.
- `input.fasta` → Input alignment file in FASTA format.
- `> output.tree` → Saves the output tree.

---

## Conclusion
Each of these phylogenetic tools has strengths in speed and accuracy. Choose based on dataset size and computational needs:
- **PhyML**: Simple, good for moderate datasets.
- **RAxML**: Powerful for large datasets.
- **IQ-TREE**: Advanced model selection and statistics.
- **FastTree**: Fastest for large alignments.

Keep practicing to optimize your analyses!
