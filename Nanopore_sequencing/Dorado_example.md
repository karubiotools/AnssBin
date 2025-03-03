# Oxford Nanopore Dorado Installation and Usage Manual

## **Introduction**
Dorado is Oxford Nanopore Technologies' high-performance basecalling software designed for processing nanopore sequencing data. This manual provides step-by-step instructions on installing Dorado and using it for basecalling.

---

## **System Requirements**
- **Operating System:** Linux, macOS, or Windows (via WSL)
- **Hardware:**
  - CPU-only support or GPU acceleration (NVIDIA GPU recommended for best performance)
  - Sufficient RAM and disk space for processing sequencing data
- **Software Dependencies:**
  - Python (if using additional scripts)
  - CUDA (for GPU acceleration)

---

## **Step 1: Install Dorado**
### **Linux (Ubuntu/Debian)**
1. Download the latest release from [Oxford Nanopore’s GitHub](https://github.com/nanoporetech/dorado):
   ```sh
   wget https://cdn.oxfordnanoportal.com/software/analysis/dorado-linux-x64.tar.gz
   ```
2. Extract the downloaded archive:
   ```sh
   tar -xvzf dorado-linux-x64.tar.gz
   ```
3. Navigate to the Dorado directory:
   ```sh
   cd dorado-linux-x64
   ```
4. (Optional) Move Dorado to a system-wide location:
   ```sh
   sudo mv dorado /usr/local/bin/
   ```
   Now, you can run `dorado` from any directory.

### **Windows (Using WSL)**
1. Ensure WSL 2 is installed:
   ```powershell
   wsl --install
   ```
2. Follow the Linux installation steps inside your WSL terminal.

### **macOS**
1. Download Dorado for macOS:
   ```sh
   wget https://cdn.oxfordnanoportal.com/software/analysis/dorado-macos.tar.gz
   ```
2. Extract the archive:
   ```sh
   tar -xvzf dorado-macos.tar.gz
   ```
3. Navigate to the directory:
   ```sh
   cd dorado-macos
   ```
4. (Optional) Move Dorado to a system-wide location:
   ```sh
   sudo mv dorado /usr/local/bin/
   ```

---

## **Step 2: Verify Installation**
To check if Dorado is installed correctly, run:
```sh
dorado --version
```
This should return the installed Dorado version.

---

## **Step 3: Download a Model**
Dorado requires a model for basecalling. Download a model using:
```sh
dorado download --model dna_r9.4.1_e8
```
This downloads a suitable model for R9.4.1 flow cells with E8 chemistry.

---

## **Step 4: Basecalling with Dorado**
### **Basic Basecalling Command**
To basecall a set of FAST5 files:
```sh
dorado basecall dna_r9.4.1_e8 my_reads/ > basecalls.fq
```
- `dna_r9.4.1_e8` specifies the model.
- `my_reads/` is the directory containing raw FAST5 files.
- `> basecalls.fq` outputs the basecalled sequences in FASTQ format.

### **Basecalling with GPU Acceleration**
If you have a compatible NVIDIA GPU and CUDA installed, use:
```sh
dorado basecall --device cuda dna_r9.4.1_e8 my_reads/ > basecalls.fq
```
This will significantly speed up the basecalling process.

---

## **Step 5: Additional Dorado Commands**
### **List Available Models**
```sh
dorado list
```

### **Convert Basecalls to BAM Format**
```sh
dorado basecall dna_r9.4.1_e8 my_reads/ | dorado align reference.fasta > output.bam
```

### **Basecalling with Pod5 Format (Newer FAST5 Alternative)**
```sh
dorado basecall dna_r9.4.1_e8 --recursive pod5/ > basecalls.fq
```

---

## **Step 6: Uninstalling Dorado**
### **Linux & macOS**
```sh
rm -rf /usr/local/bin/dorado
```

### **Windows (WSL)**
```sh
rm -rf ~/dorado-linux-x64
```

---

## **Conclusion**
Dorado is a powerful and efficient basecalling tool for Oxford Nanopore sequencing. By following this guide, you should be able to install and use Dorado effectively for basecalling your sequencing data.

For more information, visit the [official Dorado GitHub page](https://github.com/nanoporetech/dorado).
