#!/usr/bin/env python3
"""
config.py
Configurations for the Project
"""
from pathlib import Path
import logging

LOG_LEVEL = logging.INFO

# ---------------- CONFIG ----------------
# Tools
JADX_CMD = "/mnt/SATA_3/akila/LLMTest/class-level/jadx_ins/jadx/build/jadx/bin/jadx"  # Ensure jadx is in your PATH or provide full path
APKTOOL_CMD = "apktool"  # Ensure apktool is in your PATH or provide full path


# LOCAL_MODEL = "codesage-large"
LOCAL_MODEL = "MiniLM"
# LOCAL_MODEL = "codesage-small"
MINI_LM_EMB_DIM=384
# MINI_LM_EMB_DIM=1024
LOCAL_MODEL_DIR=f"/mnt/SATA_3/akila/LibraryDetection/EmbeddingNewIdea/{LOCAL_MODEL}"
MODEL_MAX_LENGTH=256
# Embedding model
EMB_DTYPE = "float32"
NUM_PROCESSES = 1
BATCH_SIZE = 8

# Input / output defaults
TPL_LIB_JAVA_DIR = Path("/mnt/SATA_3/akila/LibraryDetection/PaperAnalysis/NewVulnTrackerLibDataset/lib_java")
TPL_LIB_SMALI_DIR = Path("/mnt/SATA_3/akila/LibraryDetection/PaperAnalysis/NewVulnTrackerLibDataset/lib_smali")

ALPHA = 0.25  # For weighted fusion, can be tuned based on validation results
BETA = 0.25   # For weighted fusion, can be tuned based on validation results
GAMMA = 0.25  # For weighted fusion, can be tuned based on validation results
DELTA = 0.25  # For weighted fusion, can be tuned based on validation

POS_DECAY_ALPHA = 0.8

FUSED_EMB_TYPE = False

# WORK_DIR = Path("/mnt/SATA_3/akila/LibraryDetection/EmbeddingNewIdea/work")           # working directory for decompiles and temporary files

# We change the work dir to SATA_2
WORK_DIR = Path("/mnt/SATA_2/akila/LibraryDetection/work")           # working directory for decompiles and temporary files
FAISS_DIR = Path("faiss_data")    # where embeddings and index are stored
OUTPUT_DIR = Path("Validation_Output")       # where CSV/XLSX reports will be written
LIB_MAP_CSV = Path("LibMap.csv")  # CSV file mapping library JAR names to library info

FUSION_MODE = "fused"

# FAISS and search settings
FAISS_INDEX_FILE = FAISS_DIR / "tpl_classes.index"
FAISS_META_FILE = FAISS_DIR / "tpl_classes_meta.pkl"
EMBEDDINGS_FILE = FAISS_DIR / "class_embeddings.pkl"
