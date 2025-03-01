# SLURM Guide for HPC Use

## Introduction
SLURM (Simple Linux Utility for Resource Management) is a workload manager for high-performance computing (HPC) clusters. It is used to allocate resources and manage jobs efficiently.

---

## 1. Basic SLURM Commands

### Check Available Nodes
```bash
sinfo
```

### Check Running and Pending Jobs
```bash
squeue
```

### Check Job Status
```bash
scontrol show job <job_id>
```

### Cancel a Job
```bash
scancel <job_id>
```

### Show User Jobs
```bash
squeue -u $USER
```

---

## 2. Submitting Jobs with `sbatch`

### Basic Job Script (`job.sh`)
```bash
#!/bin/bash
#SBATCH --job-name=my_job          # Job name
#SBATCH --output=output.txt         # Output file
#SBATCH --error=error.txt           # Error file
#SBATCH --time=01:00:00             # Time limit hh:mm:ss
#SBATCH --ntasks=1                  # Number of tasks
#SBATCH --cpus-per-task=4           # CPUs per task
#SBATCH --mem=4G                    # Memory per node
#SBATCH --partition=standard        # Partition name

module load python
python my_script.py
```

### Submit the Job
```bash
sbatch job.sh
```

---

## 3. Interactive Jobs
To request an interactive session:
```bash
srun --ntasks=1 --cpus-per-task=4 --mem=4G --time=01:00:00 --partition=standard --pty bash
```

---

## 4. Managing Job Resources

### Check Resource Usage
```bash
sacct -j <job_id>
```

### View Job Efficiency
```bash
seff <job_id>
```

### Hold and Release Jobs
```bash
scontrol hold <job_id>
scontrol release <job_id>
```

---

## 5. Job Dependencies
Run a job only after another job completes successfully:
```bash
sbatch --dependency=afterok:<job_id> job2.sh
```

---

## Conclusion
SLURM is a powerful tool for managing jobs on HPC systems. 
These commands and scripts will help you optimize resource usage and job scheduling on a HPC system.
