import os
import subprocess
import re
import json
import pickle
import csv
import hashlib
import numpy as np
from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Optional, Tuple


# Internal imports
from java_processing import preprocess_java_code, semantic_filter_java_v2
from smali_processing import preprocess_smali_code, extract_semantic_smali
from config import EMB_DTYPE, JADX_CMD, APKTOOL_CMD, MINI_LM_EMB_DIM

from logger import get_file_logger
log_path = Path("logs/pipeline.log")
logger = get_file_logger(log_path)


# Simple in-memory cache for smali indexes per directory
_SMALI_INDEX_CACHE: Dict[str, Dict[str, List[Path]]] = {}

# Regex to capture method references inside invoke instructions
INVOKE_RE = re.compile(
    r"L(?P<class>[A-Za-z0-9_/]+);->(?P<method>[A-Za-z0-9_$]+)"
    r"\((?P<args>[^)]*)\)(?P<ret>[\[A-Za-z0-9_/;]+)"
)


# Helper Functions ------
def normalize_vec(v: np.ndarray) -> np.ndarray:
    v = v.astype(np.float32)
    norm = np.linalg.norm(v)
    if norm == 0:
        return v
    return (v / norm).astype(EMB_DTYPE)


def collect_files(base_dir: Path, ext: str) -> List[Path]:
    files = []
    for root, _, filenames in os.walk(base_dir):
        for fn in filenames:
            if fn.endswith(ext) and not ("/resources") in root: # Exclude resource files which can be very large and noisy
                files.append(Path(root) / fn)
    return files


def class_name_from_path(file_path: Path, base_dir: Path):
    rel = file_path.relative_to(base_dir)
    # Important: We need to extract the package name from the path to handle JADX renaming issues. The package name is the first directory after lib_java or lib_smali in the path.
    # All the libs should be organized as lib_java/package_name/... and lib_smali/package_name/...
    if "lib_java" in str(file_path):
        package_name = str(file_path).split("lib_java/")[1].split("/")[0]
    elif "lib_smali" in str(file_path):
        package_name = str(file_path).split("lib_smali/")[1].split("/")[0]
    else:
        package_name = "This is APK"
    parts = rel.with_suffix("").parts
    # remove common noise directories and any smali subfolder variants like
    # smali, smali_classes2, smali_classes3, etc., and lib markers
    parts = [p for p in parts if p not in ("sources", "src", "java") and not (p == "smali" or p.startswith("smali_classes"))]
    # replace file system separators with dot
    return ".".join(parts), package_name


def read_file_text(path: Path) -> str:
    try:
        text = path.read_text(errors="ignore")
        return text
    except Exception as e:
        logger.info("[!] Failed to read file: %s Error: %s", path, e)
        return ""


def get_smali_index(smali_dir: Path) -> Dict[str, List[Path]]:
    """
    Return a mapping normalized_class_name -> list[Path] for all .smali files
    under smali_dir. Uses an in-memory cache to avoid repeated filesystem scans.
    """
    key = str(smali_dir)
    if key in _SMALI_INDEX_CACHE:
        return _SMALI_INDEX_CACHE[key]

    index: Dict[str, List[Path]] = {}
    smali_files = collect_files(smali_dir, ".smali")
    for p in smali_files:
        cname, _ = class_name_from_path(p, smali_dir)
        norm = re.sub(r'^smali(_classes\d+)?\.', '', cname)
        index.setdefault(norm, []).append(p)

    _SMALI_INDEX_CACHE[key] = index
    return index


def clear_smali_index(smali_dir: Path = None):
    if smali_dir:
        _SMALI_INDEX_CACHE.pop(str(smali_dir), None)
    else:
        _SMALI_INDEX_CACHE.clear()


def read_and_merge_smali_for_class(class_name: str, smali_dir: Path, smali_index: Dict[str, List[Path]] = None) -> str:
    """
    Given a class name, read and merge smali files belonging to that class
    (including inner classes).
    Returns the combined smali text.
    """
    # Build or use provided index to avoid rescanning filesystem repeatedly
    if smali_index is None:
        logger.info("[!WARN! -- ]Empty Smali Index")
        # build index and cache it per smali_dir
        key = str(smali_dir)
        if key in _SMALI_INDEX_CACHE:
            smali_index = _SMALI_INDEX_CACHE[key]
        else:
            smali_index = {}
            smali_files = collect_files(smali_dir, ".smali")
            for p in smali_files:
                cname, _ = class_name_from_path(p, smali_dir)
                norm = re.sub(r'^smali(_classes\d+)?\.', '', cname)
                smali_index.setdefault(norm, []).append(p)
            _SMALI_INDEX_CACHE[key] = smali_index

    merged_texts: List[str] = []
    seen_paths = set()

    primary_files = smali_index.get(class_name, [])
    
    # Inner class files: keys that start with class_name + '$'
    inner_files = []
    if class_name:
        prefix = class_name + "$"
    else:
        prefix = "$"  # unlikely case, but to avoid error
    for key in smali_index.keys():
        if key.startswith(prefix):
            inner_files.extend(smali_index[key])

    # Order: primary first, then inner classes (sorted for determinism)
    ordered_files = list(primary_files) + sorted(inner_files)
    # logger.info("Java Class Name: %s", class_name)

    for f in ordered_files:
        # logger.info("[INFO:] Related smali file: %s, f)
        pstr = str(Path(f).resolve())
        if pstr in seen_paths:
            continue
        seen_paths.add(pstr)
        # logger.info("[INFO: ]Reading smali file: %s, f)
        merged_texts.append(read_file_text(f))

    return "\n".join(merged_texts)


def extract_original_class_name(text: str) -> str | None:
    """
    Extracts the original class name from JADX-decompiled Java file content.
    Looks for the first 'renamed from:' comment and returns the class name.
    """
    pattern = re.compile(r"renamed from:\s*([a-zA-Z0-9_.\$]+)")
    match = pattern.search(text)
    if match:
        return match.group(1)
    return None


def load_apk_embeddings(save_path: Path):
    """
    Load previously saved fused embeddings from disk.
    """
    if not save_path.exists():
        raise FileNotFoundError(f"Embeddings file not found: {save_path}")
    
    with open(save_path, "rb") as f:
        apk_fused_embeddings = pickle.load(f)
    
    logger.info(f"[i] Loaded %d fused embeddings from %s", len(apk_fused_embeddings), save_path)
    return apk_fused_embeddings


def is_jadx_decompiled(jadx_out: Path) -> bool:
    return (
        (jadx_out / "sources").exists()
        and any(jadx_out.rglob("*.java"))
    )


def is_apktool_decompiled(apktool_out: Path) -> bool:
    return (
        (apktool_out / "AndroidManifest.xml").exists()
        and any(apktool_out.glob("smali*"))
    )


def decompile_apk(
    apk_path: Path,
    out_base: Path,
    force: bool = False
):
    """
    Decompile APK with JADX (Java) and apktool (smali).
    Skips decompilation if outputs already exist unless force=True.
    Returns (jadx_out_dir, apktool_out_dir)
    """
    out_base.mkdir(parents=True, exist_ok=True)

    jadx_out = out_base / "jadx"
    apktool_out = out_base / "apktool"

    jadx_out.mkdir(parents=True, exist_ok=True)
    apktool_out.mkdir(parents=True, exist_ok=True)

    # ----- JADX -----
    if not force and is_jadx_decompiled(jadx_out):
        logger.info("[✓] JADX already decompiled → %s", jadx_out)
    else:
        logger.info("[i] Running JADX → %s", jadx_out)
        try:
            run([JADX_CMD, "-d", str(jadx_out), str(apk_path)], check=False)
        except Exception:
            logger.info("[!] JADX failed or produced warnings. Continuing.")

    # ----- apktool -----
    if not force and is_apktool_decompiled(apktool_out):
        logger.info("[✓] apktool already decompiled → %s", apktool_out)
    else:
        logger.info("[i] Running apktool → %s", apktool_out)
        try:
            run([APKTOOL_CMD, "d", str(apk_path), "-o", str(apktool_out), "--force"], check=True)
        except Exception:
            logger.info("[!] apktool failed. Aborting. - for APKOUT: %s", apktool_out)
            raise

    return jadx_out, apktool_out


def run(cmd, check=True):
    """Run subprocess command; raise on failure if check True"""
    try:
        subprocess.run(cmd, check=check)
    except subprocess.CalledProcessError as e:
        logger.info("[!] Command failed: {' '.join(cmd)}\n    %s", e)
        if check:
            raise


def load_library_map(csv_path: str) -> Dict[str, Dict[str, str]]:
    library_map = {}
    with open(csv_path, newline='') as csvfile:
        reader = csv.reader(csvfile)
        for jar, library, version in reader:
            library_map[jar.strip()] = {"library": library.strip(), "version": version.strip()}
    return library_map


def load_library_map_fast(csv_path: str) -> Dict[Tuple[str, str], str]:
    """
    Returns a dictionary mapping (library_name, version) -> jar_name_without_extension
    """
    library_map = {}
    with open(csv_path, newline='') as csvfile:
        reader = csv.reader(csvfile)
        for jar, library, version in reader:
            jar_name_no_ext = jar.strip().rsplit(".jar", 1)[0]
            key = (library.strip(), version.strip())
            library_map[key] = jar_name_no_ext
    return library_map


def weighted_average(vectors, weights):
    if vectors is None or len(vectors) == 0:
        # logger.info("[!WARN!]: Empty Weights for avearaging blocks. Returning zero vector of size: %s", MINI_LM_EMB_DIM)
        return np.zeros(MINI_LM_EMB_DIM, dtype=EMB_DTYPE)
    w = np.array(weights, dtype=np.float32)
    w = w / (w.sum() + 1e-8)

    averaged_vector = (w[:, None] * vectors).sum(axis=0)

    # We normalise the averaged vector
    norm_vector = normalize_vec(averaged_vector)
    return norm_vector    


def embed_java_blocks_batch(java_blocks, java_embedder, pos_decay_alpha):
    java_weights = []
    raw_texts = []
    fil_texts = []
    block_id = 1

    for block in java_blocks:
        processed = preprocess_java_code(block["text"])
        semantic = semantic_filter_java_v2(processed)

        raw_texts.append(processed)
        fil_texts.append(semantic)
        
        positional_decay_8 = calculate_positional_decay(pos_decay_alpha, block_id)
        java_weights.append(len(semantic) * positional_decay_8)
        block_id += 1

    raw_emb = java_embedder.embed_batch(raw_texts)
    fil_emb = java_embedder.embed_batch(fil_texts)    
    
    java_raw_cls_8   = weighted_average(raw_emb, java_weights)
    java_filt_cls_8  = weighted_average(fil_emb, java_weights)

    return java_raw_cls_8, java_filt_cls_8


def calculate_positional_decay(alpha, i):
    weight_i = 1 / (1 + alpha * (i - 1))
    return weight_i
    

def embed_smali_blocks_batch(smali_blocks, smali_embedder, pos_decay_alpha):
    smali_weights = []
    raw_texts = []
    fil_texts = []
    block_id = 1

    for block in smali_blocks:
        processed = preprocess_smali_code(block["text"])
        semantic = extract_semantic_smali(processed)

        raw_texts.append(processed)
        fil_texts.append(semantic)
        
        positional_decay_8 = calculate_positional_decay(pos_decay_alpha, block_id)
        smali_weights.append(len(semantic) * positional_decay_8)
        block_id += 1
        
    raw_emb = smali_embedder.embed_batch(raw_texts)
    fil_emb = smali_embedder.embed_batch(fil_texts)    
    
    smali_raw_cls   = weighted_average(raw_emb, smali_weights)
    smali_filt_cls  = weighted_average(fil_emb, smali_weights)

    return smali_raw_cls, smali_filt_cls
    

def save_apk_embeddings(apk_fused_embeddings, save_path: Path):
    """
    Save fused embeddings to disk for later reuse.
    """
    save_path.parent.mkdir(parents=True, exist_ok=True)
    with open(save_path, "wb") as f:
        pickle.dump(apk_fused_embeddings, f)
    logger.info("[i] Saved fused embeddings to %s", save_path)


def extract_api_list(smali_code):
    api_calls = set()
    for line in smali_code:
        if "invoke-" not in line:
                continue
        match = INVOKE_RE.search(line)
        if not match:
            continue
        raw_class = match.group("class")
        method = match.group("method")
        class_name = raw_class.replace("/", ".")
        signature = f"{class_name}.{method}"
        api_calls.add(signature)
    return api_calls


def load_tpl_apis(json_path, tpl_name):
    with open(json_path, "r") as f:
        data = json.load(f)
    return set(data.get(tpl_name, []))


def compute_api_match_percentage(tpl_apis, apk_apis):
    """
    tpl_apis: set of API signatures from TPL
    apk_apis: set of API signatures extracted from APK classes
    Returns: (number_of_matches, total_tpl_apis, percentage_match)
    """
    matches = tpl_apis & apk_apis  # set intersection
    num_matches = len(matches)
    total_tpl = len(tpl_apis)
    
    percentage = (num_matches / total_tpl) if total_tpl > 0 else 0
    return num_matches, total_tpl, percentage


def get_smali_cache_path(jadx_out: Path, apktool_out: Path):
    """
    Create unique cache filename based on APK path.
    """
    unique_string = str(jadx_out) + str(apktool_out)
    cache_key = hashlib.md5(unique_string.encode()).hexdigest()

    cache_dir = apktool_out.parent / "S_CODES"
    cache_dir.mkdir(exist_ok=True)

    return cache_dir / f"{cache_key}_smali.pkl"


def get_smali_classes(jadx_out: Path, apktool_out: Path):
    cache_file = get_smali_cache_path(jadx_out, apktool_out)
    # -------------------------
    # LOAD CACHE IF EXISTS
    # -------------------------
    if cache_file.exists():
        logger.info("[SMALI] Loading from cache: %s", cache_file)
        with open(cache_file, "rb") as f:
            return pickle.load(f)

    logger.info("[SMALI] Cache not found. Building smali map...")
    class_map = {}
    java_files = collect_files(jadx_out, ".java")
    smali_dir = apktool_out
    smali_index = get_smali_index(smali_dir)

    SMALI_MISSES = 0

    for jfile in tqdm(java_files, desc="SMALI: APK classes concatenating"):
        cname, package_name = class_name_from_path(jfile, jadx_out)
        java_text = read_file_text(jfile)

        smali_raw = read_and_merge_smali_for_class(cname, smali_dir, smali_index)
        new_cname = cname

        if not smali_raw:
            new_cname = extract_original_class_name(java_text)
            smali_raw = read_and_merge_smali_for_class(new_cname, smali_dir, smali_index)

        if not smali_raw:
            logger.info("[!] No smali found for class: %s and New class name: %s", cname, new_cname)
            SMALI_MISSES +=1

        class_map[cname] = smali_raw

    clear_smali_index(smali_dir)

    # -------------------------
    # SAVE CACHE
    # -------------------------
    logger.info("[SMALI] Saving cache:", cache_file)
    with open(cache_file, "wb") as f:
        pickle.dump(class_map, f)

    logger.info("[!IMPORTANT:] WE MISSED %d SMALI CLASSES IN THIS APK: %s", SMALI_MISSES, apktool_out)
    return class_map


def get_stage1_cache_path(work_dir: Path, apk_path: Path, TH_1: float, MODE: str):
    """
    Create unique cache filename based on APK name and TH1.
    """
    cache_dir = work_dir / "STAGE1_CACHE"
    cache_dir.mkdir(parents=True, exist_ok=True)

    key_string = f"{apk_path.stem}_{TH_1}_{MODE}"
    cache_hash = hashlib.md5(key_string.encode()).hexdigest()

    return cache_dir / f"{cache_hash}_stage1.pkl"
