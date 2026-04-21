# libMVE

libMVE is a pipeline for detecting Third-Party Libraries (TPLs) in Android applications using embedding-based similarity and version-aware analysis.

---

## Overview

This project provides a workflow to:

1. Build embeddings from known third-party libraries (Java + smali)
2. Construct an efficient similarity search space
3. Detect TPL presence in Android APKs
4. Support scalable analysis of multiple APKs

The pipeline is designed to support obfuscation-resilient detection using multiple code representations.

---

## Project Structure

- `main.py` – Entry point for the pipeline  
- `build_lib_embeddings.py` – Generates embeddings from library code  
- `detect_with_versions.py` – Detection pipeline with version analysis  
- `config.py` – Default paths and configuration  
- `logger.py` – Logging utilities  
- `faiss_data/` – Stores embeddings and FAISS-related data  
- `logs/` – Execution logs  
- `output/` – Detection results  

---

## Requirements

- Python 3.8+
- Required Python packages (to be added)
- Android decompilation tools (e.g., JADX, APKTool)

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
