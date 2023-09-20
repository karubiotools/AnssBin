# Conda user manual
You will first need to download and install [conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html) on your computer. 

To install conda (Miniconda) on your machine, you will need to download a Bash script (e.g. Miniconda3-latest-Linux-x86_64.sh), and run it. Then, you could add specific conda channels. 

You can use the following command lines (Bash shell) to install conda on Linux:
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
conda init
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict
```

You may also need to run the following command:
```bash
source ~/.bashrc
```

Once the installation is done, you should be able to use conda on your system. This "[Cheat sheet](https://docs.conda.io/projects/conda/en/stable/user-guide/cheatsheet.html)" page shows the main conda commands. 

To download a genome assembly FASTA file corresponding to an E. coli strain K-12, you can run the following command (using the accession number GCA_000005845.2 from [ENA](https://www.ebi.ac.uk/ena/browser/view/GCA_000005845) repository):
```bash
wget -O ecoli_sequence.fasta https://www.ebi.ac.uk/ena/browser/api/fasta/GCA_000005845.2?download=true&gzip=true
```


