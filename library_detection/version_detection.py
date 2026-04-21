"""
Enhanced library detection with version support and validation
"""
from pathlib import Path
from collections import defaultdict
from typing import Dict, List, Optional
import json
import csv
import numpy as np

from utils import normalize_vec

from logger import get_file_logger
log_path = Path("logs/pipeline.log")
logger = get_file_logger(log_path)


def load_library_map(csv_path: str) -> Dict[str, Dict[str, str]]:
    library_map = {}
    with open(csv_path, newline='') as csvfile:
        reader = csv.reader(csvfile)
        for jar, library, version in reader:
            library_map[jar.strip()] = {"library": library.strip(), "version": version.strip()}
    return library_map

lib_map = load_library_map("LibMap.csv") 


def detect_library_with_versions(lib_name: str, 
                               lib_index: Dict, threshold_1: float, assigned_matches=None) -> Dict:
    """
    Search APK against all versions of a library and aggregate results.
    Returns detailed detection results including version-specific matches.
    """
    # logger.info("[*] Detecting library: %s with version support...", lib_name)
    # Extract index and metadata
    index = lib_index["index"]
    meta = lib_index["meta"]
    
    # Group metadata by version
    version_meta = defaultdict(list)
    for m in meta:
        version_meta[m["version"]].append(m)

    # logger.info("Found versions: %s",list(version_meta.keys()))
    
    # Process the pre-computed matches for this library
    version_matches_sets = defaultdict(set)
    version_totals = {v: len(items) for v, items in version_meta.items()}
    # logger.info("Version totals: %d", version_totals)
    matched_classes = []
    if assigned_matches is not None:
        for m in assigned_matches:
            version = m["best_version"]
            lib_cls = m["best_lib_class"]
            version_matches_sets[version].add(lib_cls)
            matched_classes.append({
                "apk_class": m["apk_class"],
                "lib_class": lib_cls,
                "version": version,
                "score": float(m["score"])
            })
    
    # Convert sets to counts (unique matched lib classes per version)
    version_matches = {v: len(s) for v, s in version_matches_sets.items()}

    # Calculate percentage matched for each version
    version_percentages = {}
    for version, matches in version_matches.items():
        total = version_totals.get(version, 0)
        if total > 0:
            version_percentages[version] = matches / total

    # Find best matching version (highest percentage matched)
    best_version = max(
        version_percentages.items(),
        key=lambda x: x[1],
        default=(None, 0)
    )[0]

    # Calculate aggregated ratio by summing percentages from all versions
    # This way if we match 25% of v24.0.0 + 20% of v22.2.1 + 30% of v21.0.3 = 75% total
    agg_ratio = sum(version_percentages.values())
    # logger.info("Aggregated presence ratio for %s: %d", lib_name, agg_ratio:.2%)

    # This is the package/TPL level threshold
    # logger.info("#----- Important Debug Log: Threshold_1 = %d ------#", threshold_1)
    return {
        "library": lib_name,
        "is_present": agg_ratio >= threshold_1,
        "aggregated_ratio": agg_ratio,
        "best_version": best_version,
        "version_matches": version_matches,
        "version_totals": version_totals,
        "matched_classes": matched_classes
    }


def load_groundtruth(apk_name: str, groundtruth_file: Path) -> Dict:
    if not groundtruth_file.exists():
        raise FileNotFoundError(f"Groundtruth file not found: {groundtruth_file}")
        
    with open(groundtruth_file) as f:
        data = json.load(f)
    
    apk_name=apk_name.replace('allatori-','')
    apk_name=apk_name.replace('dasho-','')
    apk_name=apk_name.replace('proguard-','')
    apk_name=apk_name.replace('-ctrl','')
    apk_name=apk_name.replace('-fltn-rnm','')
    apk_name=apk_name.replace('-rmv','')
    apk_name=apk_name.replace('-R8MinOpt','')
    apk_name=apk_name.replace('-R8-non','')
    apk_name=apk_name.replace('-R8-obf-shr-opt','')
    apk_name=apk_name.replace('-R8-obf-shr-rcs-opt','')
    apk_name=apk_name.replace('-R8-obf-shr-rcs','')
    
    logger.info("####"*20)
    logger.info("Loading groundtruth for APK: %s.apk", apk_name)

    return data.get(f'{apk_name}.apk', {"libraries": []})


def validate_detection_results(results: List[Dict], groundtruth: Dict) -> Dict:
    """
    Compare detection results against groundtruth data.
    Returns detection accuracy metrics.
    """
    # Map groundtruth libraries to their high-level names using lib_map
    gt_libs_mapped = {}
    for lib in groundtruth["libraries"]:
        # Try to find the high-level library name from lib_map
        for jar_name, mapping in lib_map.items():
            if mapping["library"] == lib["name"] or jar_name.startswith(lib["name"]):
                gt_libs_mapped[mapping["library"]] = lib["version"]
                break
        else:
            # If no mapping found, use the original name
            gt_libs_mapped[lib["name"]] = lib["version"]

    # Get detected libraries (already mapped to high-level names)
    detected_libs = {r["library"]: r["best_version"] for r in results if r["is_present"]}

    logger.info("Detected Libraries: %s", detected_libs)
    logger.info("Groundtruth Libraries (mapped): %s", gt_libs_mapped)
    
    # True positives: correctly detected libs (using mapped names)
    tp = sum(1 for lib in detected_libs if lib in gt_libs_mapped)
    
    # False positives: incorrectly detected libs
    fp = sum(1 for lib in detected_libs if lib not in gt_libs_mapped)
    
    # False negatives: missed libs
    fn = sum(1 for lib in gt_libs_mapped if lib not in detected_libs)
    
    # Calculate library-level metrics (ignore version accuracy)
    precision = tp / (tp + fp) if (tp + fp) > 0 else 0
    recall = tp / (tp + fn) if (tp + fn) > 0 else 0
    f1 = 2 * (precision * recall) / (precision + recall) if (precision + recall) > 0 else 0

    logger.info("Validation Results: TP=%d, FP=%d, FN=%d, Precision=%d, Recall=%d, F1=%d", tp, fp, fn, precision, recall, f1)

    return {
        "metrics": {
            "precision": precision,
            "recall": recall,
            "f1_score": f1
        },
        "counts": {
            "true_positives": tp,
            "false_positives": fp,
            "false_negatives": fn
        },
        "detected_vs_truth": {
            "groundtruth": gt_libs_mapped,
            "detected": detected_libs
        }
    }