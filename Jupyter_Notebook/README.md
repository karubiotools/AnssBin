# Jupyter Notebook Guide

## 1. Installing Jupyter Notebook

### Install Using pip
```bash
pip install notebook
```

### Install Using conda (if using Anaconda/Miniconda)
```bash
conda install -c conda-forge notebook
```

### Launch Jupyter Notebook
```bash
jupyter notebook
```
This will open Jupyter Notebook in your web browser.

---

## 2. Creating a New Notebook
1. Click **New** → **Python 3** to open a new notebook.
2. Use the code cells to write and execute Python code.

---

## 3. Loading Data from a CSV File

### Install pandas if not already installed
```bash
pip install pandas
```

### Read CSV in Jupyter Notebook
```python
import pandas as pd

data = pd.read_csv("data.csv")
print(data.head())  # View first few rows
```

---

## 4. Performing PCA Analysis

### Install Required Libraries
```bash
pip install matplotlib scikit-learn seaborn
```

### PCA Implementation in Jupyter Notebook with Class Visualization
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler

# Load data
data = pd.read_csv("data.csv")

# Extract class labels
labels = data['Class']

# Standardize the data (excluding Sample and Class columns)
scaler = StandardScaler()
data_scaled = scaler.fit_transform(data.iloc[:, 1:-1])

# Perform PCA
pca = PCA(n_components=2)
principal_components = pca.fit_transform(data_scaled)

# Create DataFrame
pca_df = pd.DataFrame(data=principal_components, columns=["PC1", "PC2"])
pca_df['Class'] = labels

# Plot PCA with Class Information
plt.figure(figsize=(8, 6))
sns.scatterplot(x="PC1", y="PC2", hue="Class", data=pca_df, palette="Set1", s=100, alpha=0.7)
plt.xlabel("Principal Component 1")
plt.ylabel("Principal Component 2")
plt.title("PCA Plot with Class Labels")
plt.legend(title="Class")
plt.show()
```

---

## 5. Creating a Barplot

### Install seaborn if not already installed
```bash
pip install seaborn
```

### Barplot Implementation in Jupyter Notebook
```python
import seaborn as sns

# Example dataset
data = {"Category": ["A", "B", "C", "D"], "Values": [10, 20, 15, 25]}
df = pd.DataFrame(data)

# Plot Bar Chart
plt.figure(figsize=(8, 6))
sns.barplot(x="Category", y="Values", data=df)
plt.xlabel("Category")
plt.ylabel("Values")
plt.title("Bar Plot Example")
plt.show()
```

---

## Conclusion
This guide covers installing Jupyter Notebook, loading CSV data, performing PCA with class visualization, and creating bar plots. Further analyses could be performed using this software tool.
