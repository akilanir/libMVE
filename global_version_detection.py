"""
Global FAISS index + batch search detection pipeline.
This module builds/loads a single combined FAISS index containing all library class vectors
and performs one batched search per APK (all apk class vectors at once). Results are
aggregated to high-level libraries (mapping via LibMap.csv) and validated against
groundtruth.

This is an alternative to the existing version_detection/detect_with_versions flow.
"""
from pathlib import Path
import pickle
from collections import defaultdict, Counter
from typing import List, Dict, Optional, Tuple
import json

import numpy as np
import faiss

from config import FAISS_DIR, OUTPUT_DIR, LIB_PRESENCE_RATIO, WORK_DIR
import os
from utils import normalize_vec
from tpl_detection import build_apk_embeddings, decompile_apk


def load_library_map(csv_path: str) -> Dict[str, Dict[str, str]]:
    import csv
    library_map = {}
    with open(csv_path, newline='') as csvfile:
        reader = csv.reader(csvfile)
        for jar, library, version in reader:
            library_map[jar.strip()] = {"library": library.strip(), "version": version.strip()}
    return library_map


LIB_MAP = load_library_map("LibMap.csv")


def build_global_index(embeddings_pkl: Path) -> Path:
    """Build a combined FAISS index from embeddings.pkl. Returns index path."""
    with open(embeddings_pkl, "rb") as fh:
        embeddings = pickle.load(fh)

    if not embeddings:
        raise RuntimeError("No embeddings found in embeddings pkl")

    vecs = []
    meta = []  # list of dicts per vector: {package_name, class_name, version}
    for e in embeddings:
        fused = e.get("fused")
        if fused is None:
            continue
        vecs.append(normalize_vec(fused))
        meta.append({
            "package_name": e.get("package_name"),
            "class_name": e.get("class_name"),
            "version": e.get("version")
        })

    if not vecs:
        raise RuntimeError("No fused vectors available in embeddings")

    mat = np.array(vecs).astype(np.float32)
    dim = mat.shape[1]
    index = faiss.IndexFlatIP(dim)
    index.add(mat)

    FAISS_DIR.mkdir(parents=True, exist_ok=True)
    index_file = FAISS_DIR / "global_class_index.index"
    meta_file = FAISS_DIR / "global_class_index_meta.pkl"

    faiss.write_index(index, str(index_file))
    with open(meta_file, "wb") as fh:
        pickle.dump(meta, fh)

    # also save a small index map
    index_map = FAISS_DIR / "global_index_map.pkl"
    with open(index_map, "wb") as fh:
        pickle.dump({"index_file": index_file, "meta_file": meta_file}, fh)

    return index_map


def load_global_index(index_map_file: Path) -> Tuple[faiss.Index, List[Dict[str, str]]]:
    with open(index_map_file, "rb") as fh:
        mapping = pickle.load(fh)
    index = faiss.read_index(str(mapping["index_file"]))
    # Configure FAISS threading (optionally via environment variable)
    try:
        nthreads = int(os.environ.get("FAISS_NUM_THREADS", os.cpu_count() or 1))
        faiss.omp_set_num_threads(max(1, nthreads))
    except Exception:
        pass

    # Optionally move index to GPU if available and requested via env var
    use_gpu = os.environ.get("USE_FAISS_GPU", "0")
    if use_gpu.lower() in ("1", "true", "yes"):
        try:
            # create GPU resources and transfer
            res = faiss.StandardGpuResources()
            index = faiss.index_cpu_to_gpu(res, 0, index)
            print("[*] FAISS index moved to GPU (device 0)")
        except Exception as e:
            print(f"[!] Could not move FAISS index to GPU: {e}")
    with open(mapping["meta_file"], "rb") as fh:
        meta = pickle.load(fh)
    return index, meta


def aggregate_matches_by_highlib(assigned_matches: List[Dict], global_meta: List[Dict]) -> List[Dict]:
    """Aggregate assigned matches (best per APK class) into high-level libraries.

    assigned_matches: list of {apk_class, best_lib (high-level), best_version, best_lib_class, score}
    global_meta: list of metadata dicts for all vectors (used to compute per-version totals)
    Returns list of result dicts similar to previous detect outputs.
    """
    # Group matches by high-level lib
    agg_by_lib = defaultdict(list)
    for m in assigned_matches:
        agg_by_lib[m["best_lib"]].append(m)

    results = []
    # Precompute version totals per high-level lib from global_meta
    # Map package_name -> high-lib
    pkg_to_high = {}
    for entry in global_meta:
        pkg = entry.get("package_name")
        high = LIB_MAP.get(f"{pkg}.jar", {}).get("library") if pkg else None
        if high:
            pkg_to_high.setdefault(high, []).append(entry)

    for high_lib, matches in agg_by_lib.items():
        # compute version totals (number of distinct lib classes per version)
        version_meta = defaultdict(set)
        for e in pkg_to_high.get(high_lib, []):
            version_meta[e.get("version")].add(e.get("class_name"))
        version_totals = {v: len(s) for v, s in version_meta.items()}

        # compute version_matches: unique matched lib classes per version
        version_matches_sets = defaultdict(set)
        matched_classes = []
        for m in matches:
            ver = m.get("best_version")
            lib_cls = m.get("best_lib_class")
            version_matches_sets[ver].add(lib_cls)
            matched_classes.append({
                "apk_class": m.get("apk_class"),
                "lib_class": lib_cls,
                "version": ver,
                "score": m.get("score")
            })

        version_matches = {v: len(s) for v, s in version_matches_sets.items()}

        # calculate version percentages and aggregated ratio (sum of percentages)
        version_percentages = {}
        for v, matched_count in version_matches.items():
            total = version_totals.get(v, 0)
            if total > 0:
                version_percentages[v] = matched_count / total

        best_version = max(version_percentages.items(), key=lambda x: x[1], default=(None, 0))[0]
        agg_ratio = sum(version_percentages.values())

        results.append({
            "library": high_lib,
            "is_present": agg_ratio >= LIB_PRESENCE_RATIO,
            "aggregated_ratio": agg_ratio,
            "best_version": best_version,
            "version_matches": version_matches,
            "version_totals": version_totals,
            "matched_classes": matched_classes
        })

    # sort by aggregated ratio desc
    results.sort(key=lambda x: x["aggregated_ratio"], reverse=True)
    return results


def map_groundtruth_to_highlibs(apk_name: str, groundtruth_file: Path) -> Dict[str, str]:
    """Load groundtruth json and map library names to high-level names using LibMap.csv"""
    if not groundtruth_file.exists():
        raise FileNotFoundError(f"Groundtruth file not found: {groundtruth_file}")
    with open(groundtruth_file) as f:
        data = json.load(f)

    # normalize apk_name like previous code
    n = apk_name.replace('allatori-', '')
    n = n.replace('dasho-', '')
    n = n.replace('proguard-', '')
    n = n.replace('-ctrl', '')
    n = n.replace('-fltn-rnm', '')
    n = n.replace('-rmv', '')
    n = n.replace('-R8MinOpt', '')

    gt = data.get(f"{n}.apk", {"libraries": []})

    mapped = {}
    for lib in gt["libraries"]:
        # try to map using lib_map values
        name = lib.get("name")
        ver = lib.get("version")
        # find mapping entry where mapping['library'] == name
        high = None
        for k, v in LIB_MAP.items():
            if v.get("library") == name:
                high = v.get("library")
                break
        if high is None:
            high = name
        mapped[high] = ver
    return mapped


def validate_detection_results(results: List[Dict], groundtruth: Dict) -> Dict:
    """Compare detection results against groundtruth (both using high-level lib names)."""
    gt_libs = groundtruth
    detected_libs = {r["library"]: r["best_version"] for r in results if r["is_present"]}

    tp = sum(1 for lib in detected_libs if lib in gt_libs)
    fp = sum(1 for lib in detected_libs if lib not in gt_libs)
    fn = sum(1 for lib in gt_libs if lib not in detected_libs)

    precision = tp / (tp + fp) if (tp + fp) > 0 else 0
    recall = tp / (tp + fn) if (tp + fn) > 0 else 0
    f1 = 2 * (precision * recall) / (precision + recall) if (precision + recall) > 0 else 0

    return {
        "metrics": {"precision": precision, "recall": recall, "f1_score": f1},
        "counts": {"true_positives": tp, "false_positives": fp, "false_negatives": fn},
        "detected": detected_libs,
        "groundtruth": gt_libs
    }


def detect_with_global_index(
    apk_path: Path,
    embeddings_pkl: Path,
    groundtruth_file: Optional[Path] = None,
    out_dir: Path = OUTPUT_DIR,
    top_k: int = 10
):
    """Main pipeline using a single global FAISS index and batch search."""
    out_dir.mkdir(parents=True, exist_ok=True)

    # Load or build global index
    index_map = FAISS_DIR / "global_index_map.pkl"
    if not index_map.exists():
        print("[*] Building global class index...")
        index_map = build_global_index(embeddings_pkl)

    print("[*] Loading global index and metadata...")
    index, meta = load_global_index(index_map)

    # Process APK -> embeddings
    print(f"[*] Processing APK: {apk_path}")
    work_dir = WORK_DIR / apk_path.stem
    jadx_out, apktool_out = decompile_apk(apk_path, work_dir)
    apk_embeddings = build_apk_embeddings(jadx_out, apktool_out)

    # Build normalized vectors for all APK classes
    apk_vecs = []
    apk_class_names = []
    for e in apk_embeddings:
        fused = e.get("fused")
        if fused is None:
            continue
        apk_vecs.append(normalize_vec(fused))
        apk_class_names.append(e.get("class_name"))

    if not apk_vecs:
        print("[!] No APK embeddings found")
        return [], None

    vecs = np.array(apk_vecs).astype(np.float32)

    # Batch search: get top_k hits per APK class
    print(f"[*] Running batch search for {len(vecs)} classes (k={top_k})...")
    D, I = index.search(vecs, top_k)

    # For each APK class, reduce top_k hits to best per high-level library
    best_matches = []
    for i_row, (dists, idxs) in enumerate(zip(D, I)):
        per_lib_best = {}  # high_lib -> (score, hit_meta)
        for score, idx in zip(dists, idxs):
            if idx < 0:
                continue
            hit_meta = meta[idx]
            pkg = hit_meta.get("package_name")
            high_lib = LIB_MAP.get(f"{pkg}.jar", {}).get("library", pkg)
            # choose highest score for this high_lib
            cur = per_lib_best.get(high_lib)
            if cur is None or score > cur[0]:
                per_lib_best[high_lib] = (score, hit_meta)
        # choose global best among per_lib_best
        if not per_lib_best:
            continue
        best_high, (best_score, best_meta) = max(per_lib_best.items(), key=lambda x: x[1][0])
        best_matches.append({
            "apk_class": apk_class_names[i_row],
            "best_lib": best_high,
            "best_version": best_meta.get("version"),
            "best_lib_class": best_meta.get("class_name"),
            "score": float(best_score)
        })

    # Aggregate by high-level library
    results = aggregate_matches_by_highlib(best_matches, meta)

    # Validate if requested
    validation = None
    if groundtruth_file:
        print("[*] Validating against groundtruth...")
        gt_mapped = map_groundtruth_to_highlibs(apk_path.stem, groundtruth_file)
        validation = validate_detection_results(results, gt_mapped)

    # Save results
    out_prefix = out_dir / apk_path.stem
    with open(f"{out_prefix}_global_detection.json", "w") as fh:
        json.dump({"detection_results": results, "validation": validation}, fh, indent=2)

    # Print brief summary
    print("\n=== Library Detection Results (Global Index) ===")
    for r in results:
        print(f"\nLibrary: {r['library']}")
        print(f"Total Presence Score: {r['aggregated_ratio']:.2%}")
        print("Version Distribution:")
        for ver, matches_count in r["version_matches"].items():
            total = r["version_totals"].get(ver, 0)
            pct = matches_count / total if total > 0 else 0
            print(f"  - {ver}: {matches_count}/{total} ({pct:.2%})")
        print(f"Best Version: {r['best_version']}")

    if validation:
        print("\n=== Validation Metrics ===")
        m = validation["metrics"]
        print(f"Precision: {m['precision']:.2%}")
        print(f"Recall: {m['recall']:.2%}")
        print(f"F1 Score: {m['f1_score']:.2%}")

    return results, validation
