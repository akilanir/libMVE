"""
Main entry point for version-aware library detection (parallelised)
"""
import argparse
import csv
import pickle
import multiprocessing
from pathlib import Path
from typing import Optional, Dict, Tuple
import numpy as np
from collections import defaultdict
from concurrent.futures import ProcessPoolExecutor, as_completed

from library_detection.faiss_version_index import (
    build_faiss_indexes_new,
    load_library_indexes
)
from library_detection.version_detection import (
    detect_library_with_versions,
    load_groundtruth,
    validate_detection_results
)
from utils import (
    normalize_vec, 
    load_apk_embeddings, 
    save_apk_embeddings, 
    extract_api_list, 
    load_tpl_apis, 
    compute_api_match_percentage,
    decompile_apk,
    get_smali_classes,
    load_library_map,
    load_library_map_fast,
    get_stage1_cache_path
)

from apk_embedding_builder import build_apk_embeddings

from config import FAISS_DIR, OUTPUT_DIR, LIB_MAP_CSV, WORK_DIR

from logger import get_file_logger
log_path = Path("logs/pipeline.log")
logger = get_file_logger(log_path)


lib_map = load_library_map(LIB_MAP_CSV)
lib_map_fast = load_library_map_fast(LIB_MAP_CSV)


def process_single_apk(
    apk_path: Path,
    embeddings_pkl: Path,
    TH_1: float,
    TH_2: float,
    apk_embedding_save_path: Path,
    groundtruth_file: Optional[Path],
    out_dir: Path,
    lib_indexes,
    n: int
):
    """
    Worker function to process a single APK.
    """
    is_from_saved_apk = False
    apk_e_read = "fused"
    smali_codes = {}
    MODE = f"POSITIONAL_DECAY-LIBSCAN_TEST-ALPHA-{n}"
    work_dir = WORK_DIR / apk_path.stem
    work_dir.mkdir(parents=True, exist_ok=True)

    logger.info("[*] Processing APK: %s", apk_path)

    stage1_cache_file = get_stage1_cache_path(work_dir, apk_path, TH_1, MODE)
    results = []

    # ---- Stage 1 cache ----
    if stage1_cache_file.exists():
        logger.info("[*] Loading Stage-1 cache from %s", stage1_cache_file)
        with open(stage1_cache_file, "rb") as f:
            results = pickle.load(f)
        is_from_saved_apk = True
    else:
        save_fused_embedding_path = Path(f"{apk_embedding_save_path}/MiniLM_256_CLSMTH_LEVEL_{apk_path.stem}.pkl")

        if save_fused_embedding_path.exists():
            logger.info("[*] Loading cached fused APK embeddings from %s", save_fused_embedding_path)
            apk_embeddings = load_apk_embeddings(save_fused_embedding_path)
            is_from_saved_apk = True
        else:
            logger.info("[*] Building APK embeddings...")
            apk_embeddings, smali_codes = build_apk_embeddings(
                apk_path=apk_path,
                work_dir=work_dir,
                out_path=save_fused_embedding_path,
                resume=False
            )

        # ---- Best match per APK class ----
        # logger.info("[*] Finding best library matches for each APK class........")
        best_matches = []
        apk_vectors = []
        import time
        start_time = time.time()
        for apk_emb in apk_embeddings:
            try:
                apk_vectors.append(apk_emb[apk_e_read])
            except KeyError:
                raise KeyError(f"Missing {apk_e_read} embedding in apk_emb")
        logger.info("[*] Total APK classes with embeddings: %d", len(apk_vectors))
        for apk_emb, apk_vec in zip(apk_embeddings, apk_vectors):
            best_score = -1
            best_lib = None
            best_version = None
            best_lib_class = None

            for lib_name, lib_index in lib_indexes.items():
                index = lib_index["index"]
                meta = lib_index["meta"]
                vec = np.array([apk_vec]).astype(np.float32)
                D, I = index.search(vec, 1)
                if I[0][0] >= 0 and D[0][0] > best_score:
                    match_meta = meta[I[0][0]]
                    best_score = D[0][0]
                    best_lib = lib_map.get(f"{lib_name}.jar", {}).get("library", "unknown_lib")
                    if best_lib == "unknown_lib":
                        logger.info("[!WARN] ----------------- Unknown Library detected: %s.jar", lib_name)
                    best_version = match_meta.get("version", "unknown")
                    best_lib_class = match_meta.get("class_name", "unknown")
            if best_lib is not None and best_score >= 0:
                best_matches.append({
                    "apk_class": apk_emb["class_name"],
                    "best_lib": best_lib,
                    "best_version": best_version,
                    "best_lib_class": best_lib_class,
                    "score": float(best_score)
                })
        # logger.info("[1] Total APK classes with valid library matches: %d", len(best_matches))
        # ---- Aggregate per library ----
        agg_by_lib = defaultdict(list)
        for m in best_matches:
            agg_by_lib[m["best_lib"]].append(m)

        high_level_indexes = defaultdict(list)
        # logger.info("[2] Aggregating matches by high-level library names...")
        for lib_name, lib_index in lib_indexes.items():
            high_lib = lib_map.get(f"{lib_name}.jar", {}).get("library", "unknown_lib")
            high_level_indexes[high_lib].append((lib_name, lib_index))

        # logger.info("[3] Running version-aware detection for each high-level library...")
        for high_lib, version_indexes in high_level_indexes.items():
            matches_for_lib = agg_by_lib[high_lib]
            if not matches_for_lib:
                continue

            combined_meta = []
            for _, lib_index in version_indexes:
                combined_meta.extend(lib_index["meta"])

            combined_index = {"meta": combined_meta, "index": version_indexes[0][1]["index"]}

            result = detect_library_with_versions(
                high_lib,
                combined_index,
                threshold_1=TH_1,
                assigned_matches=matches_for_lib
            )

            if result["is_present"]:
                results.append(result)
        # logger.info("[4] Detected %d libraries after Stage-1 version-aware detection.", len(results))
        results.sort(key=lambda x: x["aggregated_ratio"], reverse=True)
        logger.info("[*INFO] Saving Stage-1 cache to %s", stage1_cache_file)
        with open(stage1_cache_file, "wb") as f:
            pickle.dump(results, f, protocol=pickle.HIGHEST_PROTOCOL)

    # ---- Second stage API filter ----
    # logger.info("[5] Running second-stage API validation with threshold %.2f...", TH_2)
    second_stage_validated_results = []
    
    logger.info("[xxxx]Is it from saved APK? %s", is_from_saved_apk)
    if is_from_saved_apk:
        logger.info("[6] Loading smali classes from cache for API validation...")  
        jadx_out = work_dir / "jadx"
        apktool_out = work_dir / "apktool"
        smali_codes = get_smali_classes(jadx_out, apktool_out)

    for r in results:
        # logger.info("[*] Validating %s %s via API analysis...", r['library'], r['best_version'])
        detected_library = r['library']
        detected_lib_best_version = r['best_version']
        jar_name = lib_map_fast.get((detected_library, detected_lib_best_version))
        TPL_API_list = load_tpl_apis("tpl_system_apis.json", jar_name)

        detected_class_names = [cl['apk_class'] for cl in r['matched_classes']]
        api_call_list = set()
        for det_class in detected_class_names:
            smali_code = smali_codes.get(det_class)
            if smali_code:
                api_call_list.update(extract_api_list(smali_code.splitlines()))

        num_matches, total_tpl, percentage = compute_api_match_percentage(TPL_API_list, api_call_list)

        if total_tpl == 0 or (total_tpl > 0 and percentage > TH_2):
            second_stage_validated_results.append(r)
    detection_time = time.time()
    logger.info("[✓] TIME- Second-stage API validation completed for %s in %.2f seconds", apk_path, detection_time - start_time)
    # ---- Groundtruth validation ----
    validation = None
    if groundtruth_file:
        try:
            groundtruth = load_groundtruth(apk_path.stem, groundtruth_file)
            validation = validate_detection_results(second_stage_validated_results, groundtruth)
        except FileNotFoundError:
            logger.info("[!] Groundtruth file not found: %s", groundtruth_file)

    out_prefix = out_dir / apk_path.stem
    save_detection_results(second_stage_validated_results, validation, out_prefix)

    return second_stage_validated_results, validation


def run_version_detection_pipeline_cached_parallel(
    apk_folder: Path,
    embeddings_pkl: Path,
    TH_1: float,
    TH_2: float,
    apk_embedding_save_path: Path,
    groundtruth_file: Optional[Path] = None,
    out_dir: Path = OUTPUT_DIR,
    max_workers: int = 1
):
    """
    Run the detection pipeline in parallel across APKs.
    """
    out_dir.mkdir(parents=True, exist_ok=True)
    logger.info("[*] Processing Folder: %s", apk_folder)

    apk_files = list(apk_folder.glob("*.apk"))
    logger.info("[*] Found %d APK files.", len(apk_files))

    n = 8
    faiss_dir = Path(f"libscan_faiss_data_vulnTrack_alpha_{n}")
    #Libscan
    # faiss_dir = Path(f"libscan_faiss_data_correct_alpha_{n}")
    index_map = faiss_dir / "library_indexes.pkl"

    if not index_map.exists():
        logger.info("[*] Building FAISS library indexes in %s", faiss_dir)
        build_faiss_indexes_new(faiss_dir, embeddings_pkl)
    lib_indexes = load_library_indexes(index_map)

    results_all = []

    max_workers = min(max_workers, multiprocessing.cpu_count())
    with ProcessPoolExecutor(max_workers=max_workers) as executor:
        futures = {
            executor.submit(
                process_single_apk,
                apk_path,
                embeddings_pkl,
                TH_1,
                TH_2,
                apk_embedding_save_path,
                groundtruth_file,
                out_dir,
                lib_indexes,
                n
            ): apk_path for apk_path in apk_files
        }

        for future in as_completed(futures):
            apk_path = futures[future]
            try:
                res, val = future.result()
                results_all.append((apk_path, res, val))
            except Exception as e:
                logger.info("[!] Error processing %s : %s", apk_path, e)

    return results_all


def save_detection_results(results, validation, out_prefix: Path):
    """Save detection and validation results to files."""
    import json
    
    # Save detailed results
    with open(f"{out_prefix}_version_detection.json", "w") as f:
        json.dump({
            "detection_results": results,
            "validation": validation
        }, f, indent=2)
    
    # Print summary
    # print("\n=== Library Detection Results ===")
    # for r in results:
    #     print(f"\nLibrary: {r['library']}")
    #     print(f"Total Presence Score: {r['aggregated_ratio']:.2%}")
    #     print("Version Distribution:")
    #     for ver, matches in r["version_matches"].items():
    #         total = r["version_totals"][ver]
    #         percentage = matches/total
    #         print(f"  - {ver}: {matches}/{total} ({percentage:.2%})")
    #     print(f"Best Version: {r['best_version']} (highest individual match percentage)")
    
    # if validation:
    #     print("\n=== Validation Metrics (library-level) ===")
    #     metrics = validation["metrics"]
    #     print(f"Precision: {metrics['precision']:.2%}")
    #     print(f"Recall: {metrics['recall']:.2%}")
    #     print(f"F1 Score: {metrics['f1_score']:.2%}")
