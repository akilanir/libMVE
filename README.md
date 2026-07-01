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
├── utils.py                        # All the helper methods
├── logger.py                       # Logging utilities
│
├── library_detection/
    │
    ├── faiss_version_index.py      # Helper script to generate faiss indexes
    ├── version_detection.py        # Helper script to perform version-level detection
├── faiss_data/                     # Stores embeddings and FAISS-related data
├── logs/                           # Execution logs
├── Old_Results/                    # Detection results
│
├── requirements.txt                # Python dependencies
├── setup.sh                        # Environment setup script
└── README.md
```

---

## Requirements

### Python Environment

* Python 3.10.12 (3.10 or higher recommended)
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
git clone https://anonymous.4open.science/r/libMVE-FB9F/
cd libMVE
```

### Automated Setup (using setup.sh)

Make executable:

```bash
chmod +x setup.sh
```

Run:

```bash
./setup.sh
```

IMPORTANT: If the above setup.sh failed refer to the manual installation steps below.


### Manual Setup (If the above automated process failed!!)

### I. Create Virtual Environment

```bash
python3.10 -m venv venv
source venv/bin/activate
```

Upgrade pip:

```bash
pip install --upgrade pip
```

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

IMPORTANT: After installation please ensure both tools are accessible from your terminal:

```bash
jadx --version
apktool --version
```
IF NOT: alter JADX_CMD, APKTOOL_CMD in config.py and direct it to the executable path of jadx and apktool

---

## Usage

### TPLs, APKs, and Other Dependencies neede to run libMVE

- TPLs: IN Datasets (TS1, TS2, TS3)

        `TS1`: .jar files of TS1 TPLs are provided. To run the libMVE, we need to decompile .jar files into java and smali 

        `TS2`: TPLs used with DS2 dataset (we have given the .jar/.aar files)

        `TS3AndTS4`: Vulenrable and Tracker TPLs (we have given the .jar/.aar files)

        IMPORTANT: Script to automatically decompile the .jar/.aar files are given in MISC/decompileLibFiles.py, and follow the steps given in the script. Java and smali should be decompiled into lib_java and lib_smali folders and the fodler structure should be lib_java/LIB_NAME/sources | lib_Smali/LIB_NAME/smali
    
- APKs: 

        `DS1`: We have given the same APKs provided by LibScan (For further details refer to Validation set: https://github.com/wyf295/LibScan/tree/master/data/ground_truth_threshold_apks Test set: https://github.com/wyf295/LibScan/tree/master/data/ground_truth_apks)

        `DS2`: R8 optimized APKs compiled from source code provided in Datasets/DS2 (Use APKs in validation directory to tune the hyperparameters and Use APKs in test folder to evaluate)
        
        `DS3`: APKs sha values provided in `{year}-APKs.csv` with their metadata, you can download the APKs directly from AndroZoo: "https://androzoo.uni.lu/"

- Supporting Files:

        `supportFilesLibScan`: provides the groundtruth.json, LibMap.csv, and tpl_system_apis.json that are used in results validation/evaluation, Mapping the TPL name with the high level TPL name, and list of System APIs for each TPL that we analys in TS1 dataset

        `supportFilesR8`: provides the groundtruth.json, LibMap.csv, and tpl_system_apis.json that are used in results validation/evaluation, Mapping the TPL name with the high level TPL name, and list of System APIs for each TPL that we analys in TS2 dataset

        `supportFilesVulnLib`: provides the groundtruth.json, LibMap.csv, and tpl_system_apis.json that are used in results validation/evaluation, Mapping the TPL name with the high level TPL name, and list of System APIs for each TPL that we analys in TS3 and TS4 datasets.

Make sure you have the correct dataset downloaded and ready to use!!!

### 1. Build Library Embeddings

From TS{n} datasets, first we need to generate the TPL Database (this should be done only once per dataset)

Make sure you change LIB_MAP_CSV = Path("supportFilesLibScan/LibMap.csv")  # CSV file mapping library JAR names to library info.

Run the following, changing the location of TS1, TS2, and TS3 based on the dataset you used (e.g., if you want to test DS1, you need to use TS1)

```bash
python main.py build-embeddings \
  --lib-java Datasets/TS1/lib_java \
  --lib-smali Datasets/TS1/lib_smali \
  --out faiss_data_TS1/TS1_Embeddings.pkl
```
logs/pipeline.log will print the main info, error, warn logs.

---
### 2. Detect TPLs in Multiple APKs (in a Directory)

```bash
python main.py detect-apks 
  --apk path/to/target_apk_folder 
  --lib-embeddings faiss_data/Embedding.pkl 
  --lib-index-dir TS1_Faiss_Data
  --th1 0.1 
  --th2 0.4 
  --apk-embedding-save-path TS1_APK_Embeddings 
  --groundtruth path/to/groundtruth.json 
  --out-dir Validation_Output 
  --workers 6
```

#### Parameters
- `--apk` : APK folder that need to analyse
- `--lib-embeddings` : Generated Library Embedding pickle File
- `--lib-index-dir`: Directory to save Faiss Library Indexes
- `--th1` : Threshold at package/TPL level  (tau_class)
- `--th2` : Threshold for system API-based validation  (tau_API)
- `--apk-embedding-save-path` : We can save the APK embeddings and use it again (If we need to perfrom tuning)
- `--workers` : Number of parallel processes  (Depending on the system GPU and CPU availabilty you can increase the number of workers, We used 6 workers in a Linux machine that had 13th Gen Intel(R) Core(TM) i7-13700K, 16 Cores, 128GB RAM, NVIDIA GeForce RTX 4090 (24GB))

Optional:

- `--groundtruth` : Path to ground truth JSON for evaluation  (For DS1 and DS2 datasets we have provided the grountruth.json and for DS3 since it is in-the-wild apps no groundtruths available)

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

- Ensure library datasets are properly decompiled before building embeddings.
- Detection performance depends on threshold selection.
- Results may vary depending on obfuscation and compilation settings.
- This is for POC of the paper, not suitable for commercial use.

---

## License

To be added
