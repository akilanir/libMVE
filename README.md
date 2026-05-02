# libMVE

libMVE is a pipeline for detecting Third-Party Libraries (TPLs) in Android applications using embedding-based similarity and version-aware analysis.

It supports obfuscation-resilient TPL detection using multiple code representations (Java + smali + semantic-filtered views) combined with embedding-based similarity search and version-aware validation.

---

## Overview

This project provides a workflow to:

1. Build embeddings from known third-party libraries
2. Construct an efficient similarity search space using FAISS
3. Detect TPL presence in Android APKs
4. Support scalable analysis of multiple APKs
5. Perform version-aware validation using system API overlap

---

## Project Structure

```text
libMVE/
│
├── main.py                         # Entry point for the pipeline
├── build_lib_embeddings.py         # Generate embeddings from library code
├── detect_with_versions.py         # Detection pipeline with version analysis
├── config.py                       # Default paths and configuration
├── logger.py                       # Logging utilities
│
├── library_detection/
    │
    ├── faiss_version_index.py      # Helper script to generate faiss indexes
    ├── version_detection.py        # Helper script to perform version level detection
├── faiss_data/                     # Stores embeddings and FAISS-related data
├── logs/                           # Execution logs
├── output/                         # Detection results
│
├── requirements.txt                # Python dependencies
├── setup.sh                        # Environment setup script
└── README.md
```

---

## Requirements

### Python Environment

* Python 3.10.12 (recommended)
* Ubuntu/Linux environment recommended

We strongly recommend using a Python virtual environment.

---

## Required External Tools

The following tools must be installed separately:

* JADX
* APKTool

These are required for APK decompilation and analysis.

Please ensure both tools are accessible from your terminal:

```bash
jadx --version
apktool --version
```

---

## Installation

### 1. Clone Repository

```bash
git clone <your_repo_url>
cd libMVE
```

---
### Automated Setup (using setup.sh)

Make executable:

```bash
chmod +x setup.sh
```

Run:

```bash
./setup.sh
```

IMPORTANT: If the above setup.sh failed refer to the below manual installation steps

---
## Manual Installation

### I. Create Virtual Environment

```bash
python3.10 -m venv venv
source venv/bin/activate
```

Upgrade pip:

```bash
pip install --upgrade pip
```

---

### II. Install Python Dependencies

```bash
pip install -r requirements.txt
```

---

## JADX and APKTOOL Insatallation (If not already available!)
### 1. Install JADX

Download from the official release page and extract:

```bash
https://github.com/skylot/jadx/releases
```

Add JADX to PATH:

```bash
export PATH=$PATH:/path/to/jadx/bin
```

You may place this in `.bashrc` or `.zshrc`.

---

### 2. Install APKTool

Download:

```bash
https://ibotpeaches.github.io/Apktool/
```

Example installation:

```bash
sudo apt install apktool
```

or install manually from the official website.

---

## Usage

### 1. Build Library Embeddings

```bash
python main.py build-embeddings \
  --lib-java lib_java \
  --lib-smali lib_smali \
  --out faiss_data/Embedding.pkl
```

---

### 2. Detect TPL in a Single APK

```bash
python main.py detect-apk \
  --apk path/to/target.apk \
  --embeddings faiss_data/Embedding.pkl
```

---

### 3. Detect TPLs in Multiple APKs

```bash
python main.py detect-apks \
  --apk-folder path/to/apk_folder \
  --embeddings faiss_data/Embedding.pkl \
  --th1 <threshold_1> \
  --th2 <threshold_2> \
  --apk-embedding-save-path <path> \
  --out-dir output/ \
  --workers 4
```

#### Parameters

- `--th1` : Threshold at package/TPL level  
- `--th2` : Threshold for system API-based validation  
- `--workers` : Number of parallel processes  

Optional:

- `--groundtruth` : Path to ground truth JSON for evaluation  

---

## Pipeline Description

### 1. Embedding Generation
- Extract multiple representations (Java, smali, filtered views)
- Generate embeddings for each class
- Combine into a unified representation

### 2. Indexing
- Store embeddings for efficient similarity search

### 3. Detection
- Decompile target APKs
- Generate embeddings for target code
- Match against known libraries
- Apply threshold-based filtering
- Perform version-aware validation

---

## Logging

Logs are stored in:

```
logs/pipeline.log
```

---

## Notes

- Ensure library datasets are properly decompiled before building embeddings
- Detection performance depends on threshold selection
- Results may vary depending on obfuscation and compilation settings

---

## Future Work

- Add dependency list and installation guide  
- Provide benchmark datasets  
- Include evaluation scripts and metrics  
- Improve configuration and tuning documentation  

---

## License

To be added
