#!/usr/bin/env python3
"""
config.py
Configurations for the Project
"""
from pathlib import Path
import logging

LOG_LEVEL = logging.INFO

LOG_FILE = "logs/pipeline.log"

# ---------------- CONFIG ----------------
# Tools
JADX_CMD = "/mnt/SATA_3/akila/LLMTest/class-level/jadx_ins/jadx/build/jadx/bin/jadx"  # Ensure jadx is in your PATH or provide full path
APKTOOL_CMD = "apktool"  # Ensure apktool is in your PATH or provide full path


LOCAL_MODEL = "MiniLM"
MINI_LM_EMB_DIM=384
LOCAL_MODEL_DIR=f"local_models/{LOCAL_MODEL}"
MODEL_MAX_LENGTH=256
# Embedding model
EMB_DTYPE = "float32"
NUM_PROCESSES = 1
BATCH_SIZE = 8

# Input / output defaults
TPL_LIB_JAVA_DIR = Path("Datasets/TS1/lib_java")
TPL_LIB_SMALI_DIR = Path("Datasets/TS1/lib_smali")

FUSED_WEIGHT = 0.25

FUSED_EMB_TYPE = False

# Default Directories and Files
APK_DIR= Path("Datasets/DS2/validation")  # where target APKs are stored for detection
WORK_DIR = Path("work")           # working directory for decompiles and temporary files
FAISS_DIR = Path("faiss_data")    # where embeddings and index are stored
OUTPUT_DIR = Path("Validation_Output")       # where CSV/XLSX reports will be written
LIB_MAP_CSV = Path("supportFilesLibScan/LibMap.csv")  # CSV file mapping library JAR names to library info
GROUNDTRUTH_JSON = Path("supportFilesLibScan/groundtruth.json")  # Optional: Groundtruth for evaluation
TPL_SYSTEM_APIS_FILE = Path("supportFilesLibScan/tpl_system_apis.json") # JSON file mapping TPLs to their system API lists for validation

FUSION_MODE = "fused"

# FAISS and search settings
FAISS_INDEX_FILE = FAISS_DIR / "tpl_classes.index"
FAISS_META_FILE = FAISS_DIR / "tpl_classes_meta.pkl"
EMBEDDINGS_FILE = Path(f"{FAISS_DIR}/Embedding.pkl")
APK_EMBEDDINGS_DIR = Path("LibScan_APK_Embeddings")
LIB_INDEX_DIR = Path("Libscan_Faiss_Data") #Use to map FAISS indexes to library names and versions
                       
# Detection thresholds
# DS1 dataset thresholds
POS_DECAY_ALPHA = 0.8
TH_CLS = 0.1
TH_API = 0.4
MODE = f"LIBSCAN-{FUSION_MODE}-ALPHA-{POS_DECAY_ALPHA}"

# DS2 Optimized dataset thresholds
# POS_DECAY_ALPHA = 0.4
# TH_CLS = 0.1
# TH_API = 0.1
# MODE = f"R8-{FUSION_MODE}-ALPHA-{POS_DECAY_ALPHA}"

# DS2 Non-Optimized dataset thresholds
# POS_DECAY_ALPHA = 0.3
# TH_CLS = 0.27
# TH_API = 0.16
# MODE = f"VULNTPL-{FUSION_MODE}-ALPHA-{POS_DECAY_ALPHA}"


