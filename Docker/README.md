# Example showing how to manage a Docker image

## **Introduction**
Docker is a powerful tool that allows you to run applications in isolated containers, making it easier to manage dependencies and software environments. This manual covers how to install and use Docker, with a practical example of running the bioinformatics tool **Bowtie2** in a Docker container.

---

## **System Requirements**
- **Windows 10/11**, **macOS**, or **Linux**
- **Admin privileges**
- **Internet connection**

---

## **Step 1: Install Docker**
### **Windows & macOS**
1. Download **Docker Desktop** from the official website: [https://www.docker.com/get-started](https://www.docker.com/get-started)
2. Run the installer and follow the instructions.
3. After installation, launch Docker and ensure it is running.
4. Verify the installation by running the following command in **PowerShell** or **Terminal**:
   ```sh
   docker --version
   ```

### **Linux (Ubuntu/Debian)**
1. Update existing packages:
   ```sh
   sudo apt update && sudo apt upgrade -y
   ```
2. Install dependencies:
   ```sh
   sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
   ```
3. Add Docker’s official GPG key:
   ```sh
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   ```
4. Add the Docker repository:
   ```sh
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```
5. Install Docker:
   ```sh
   sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io
   ```
6. Enable and start the Docker service:
   ```sh
   sudo systemctl enable --now docker
   ```
7. Verify the installation:
   ```sh
   docker --version
   ```

---

## **Step 2: Running Docker Without Root (Linux Only)**
To use Docker without `sudo`, add your user to the Docker group:
```sh
sudo usermod -aG docker $USER
newgrp docker
```

---

## **Step 3: Running a Test Container**
To verify Docker is working correctly, run:
```sh
docker run hello-world
```
This downloads a test image and runs a simple container that outputs a message.

---

## **Step 4: Using Docker for Bioinformatics – Running Bowtie2**
Bowtie2 is a bioinformatics tool for fast DNA sequence alignment. Instead of manually installing dependencies, we can run Bowtie2 using Docker.

### **Pull the Bowtie2 Docker Image**
```sh
docker pull biocontainers/bowtie2
```

### **Run Bowtie2 in a Docker Container**
```sh
docker run --rm biocontainers/bowtie2 bowtie2 --help
```
This command will display the help message for Bowtie2, indicating it is running correctly.

### **Example: Aligning a Sample FASTQ File**
If you have a reference genome (`ref.fa`) and a sample read file (`sample.fastq`), you can run:
```sh
docker run --rm -v $(pwd):/data biocontainers/bowtie2 bowtie2 -x /data/ref -U /data/sample.fastq -S /data/output.sam
```
- `-v $(pwd):/data` mounts your current directory to the `/data` directory inside the container.
- `-x /data/ref` specifies the reference genome index.
- `-U /data/sample.fastq` specifies the input reads.
- `-S /data/output.sam` saves the alignment results.

---

## **Step 5: Managing Docker Containers and Images**
### **List Running Containers**
```sh
docker ps
```

### **List All Containers (Including Stopped Ones)**
```sh
docker ps -a
```

### **Stop a Running Container**
```sh
docker stop <container_id>
```

### **Remove a Container**
```sh
docker rm <container_id>
```

### **List Downloaded Images**
```sh
docker images
```

### **Remove an Image**
```sh
docker rmi <image_id>
```

---

## **Step 6: Uninstalling Docker**
### **Windows & macOS**
1. Uninstall Docker from the system settings.
2. Delete Docker-related folders if needed.

### **Linux**
```sh
sudo apt remove -y docker-ce docker-ce-cli containerd.io
sudo rm -rf /var/lib/docker
```

---

## **Conclusion**
Docker provides a flexible way to run bioinformatics tools like Bowtie2 without dealing with dependencies and installation issues. You can now use Docker to manage various tools and workflows efficiently.

For more information, visit the [Docker Documentation](https://docs.docker.com/) and [BioContainers](https://biocontainers.pro/).
