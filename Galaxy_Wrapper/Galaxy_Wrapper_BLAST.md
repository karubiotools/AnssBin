# Writing a Galaxy Wrapper for BLAST

## Introduction
This guide will help you create a Galaxy wrapper for the BLAST bioinformatics tool. The wrapper will define how BLAST is executed within Galaxy and can be shared in the Galaxy ToolShed.

---

## 1. Install Galaxy (if not already installed)
```bash
git clone -b release_23.0 https://github.com/galaxyproject/galaxy.git
cd galaxy
sh run.sh
```
Galaxy should now be running at `http://localhost:8080/`.

---

## 2. Install BLAST
```bash
conda install -c bioconda blast
```
Verify installation:
```bash
blastn -help
```

---

## 3. Create a Tool Directory
Navigate to the `tools` directory in your Galaxy installation:
```bash
mkdir -p tools/blast
cd tools/blast
```

---

## 4. Write the Tool Definition File (`blast.xml`)
Create a file named `blast.xml`:
```xml
<tool id="blast" name="BLAST" version="1.0">
    <description>Basic Local Alignment Search Tool</description>
    
    <command><![CDATA[
        blastn -query '$input' -db nt -out '$output'
    ]]></command>

    <inputs>
        <param name="input" type="data" format="fasta" label="Input FASTA file"/>
    </inputs>

    <outputs>
        <data name="output" format="txt" label="BLAST Output"/>
    </outputs>
    
    <requirements>
        <requirement type="package" version="2.12.0">blast</requirement>
    </requirements>
</tool>
```

---

## 5. Add the Tool to Galaxy
Modify `config/tool_conf.xml` to include:
```xml
<tool file="tools/blast/blast.xml"/>
```

Restart Galaxy:
```bash
sh run.sh --daemon stop
sh run.sh
```

---

## 6. Test the Wrapper
1. Open Galaxy at `http://localhost:8080/`
2. Upload a FASTA file
3. Run BLAST from the Galaxy tool panel

---

## 7. Submit to Galaxy Toolshed
1. Create a `.shed.yml` file in `tools/blast/`:
```yaml
name: blast
author: your_name
description: Galaxy wrapper for BLAST
homepage_url: https://blast.ncbi.nlm.nih.gov/
```
2. Upload to the **Galaxy Toolshed** (`https://toolshed.g2.bx.psu.edu/`)
3. Follow the instructions to register and submit your tool

---

## Conclusion
This guide provides the steps to create and share a Galaxy wrapper for BLAST, making it easier to integrate bioinformatics tools into Galaxy workflows. 🚀
