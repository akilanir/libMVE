"""
How to Use:
To Build Embeddings: python main.py build-embeddings --lib-java lib_java --lib-smali lib_smali --out faiss_data/Embedding.pkl
To Detect TPL: python main.py detect-apks 
--apk path/to/target_apk_folder 
--lib-embeddings faiss_data/Embedding.pkl 
--lib-index-dir Libscan_Faiss_Data
--th1 0.1 
--th2 0.4 
--embedding-save-path LibScan_APK_Embeddings 
--groundtruth path/to/groundtruth.json 
--out-dir Validation_Output 
--workers 6
"""

import argparse
import sys
from pathlib import Path

# Internal imports
from build_lib_embeddings import build_lib_embeddings
from detect_with_versions import run_version_detection_pipeline_cached_parallel
from config import (TPL_LIB_JAVA_DIR, TPL_LIB_SMALI_DIR, FAISS_DIR, 
                    EMBEDDINGS_FILE, OUTPUT_DIR, FUSED_WEIGHT, POS_DECAY_ALPHA, 
                    LOG_FILE, APK_DIR, EMBEDDINGS_FILE, TH_CLS, TH_API, 
                    APK_EMBEDDINGS_DIR, GROUNDTRUTH_JSON, LIB_INDEX_DIR)

#This enable logging
from logger import get_file_logger
log_path = Path(LOG_FILE)
logger = get_file_logger(log_path)


def main():
    parser = argparse.ArgumentParser(description="TPL Detection pipeline (build embeddings, build index, analyze APK)")
    sub = parser.add_subparsers(dest="cmd")

    p_build = sub.add_parser("build-embeddings", help="Build fused embeddings from decompiled lib_java/lib_smali")
    p_build.add_argument("--lib-java", type=Path, default=TPL_LIB_JAVA_DIR)
    p_build.add_argument("--lib-smali", type=Path, default=TPL_LIB_SMALI_DIR)
    p_build.add_argument("--faiss-dir", type=Path, default=FAISS_DIR)
    p_build.add_argument("--out", type=Path, default=EMBEDDINGS_FILE)

    
    p_detect_multiple = sub.add_parser("detect-apks", help="Decompile APK and detect TPL presence of multiple APKs in a directory")
    p_detect_multiple.add_argument("--apk-folder", type=Path, required=True, default=APK_DIR, help="Path to target APKs Folder")
    p_detect_multiple.add_argument("--lib-embeddings", type=Path, required=True, default=EMBEDDINGS_FILE, help="Path to library embeddings pickle")
    p_detect_multiple.add_argument("--lib-index-dir", type=Path, default=LIB_INDEX_DIR, help="Path to FAISS library indexes directory")
    p_detect_multiple.add_argument("--th1", type=float, required=True, default=TH_CLS, help="First Threshold Package/TPL Level")
    p_detect_multiple.add_argument("--th2", type=float, required=True, default=TH_API, help="Second Threshold for System API Detection")
    p_detect_multiple.add_argument("--embedding-save-path", type=Path, required=True, default=APK_EMBEDDINGS_DIR, help="Path to save APK embeddings")
    p_detect_multiple.add_argument("--groundtruth", type=Path, default=GROUNDTRUTH_JSON, help="Optional: path to groundtruth JSON file")
    p_detect_multiple.add_argument("--out-dir", type=Path, default=OUTPUT_DIR, help="Output directory for results")
    p_detect_multiple.add_argument("--workers", type=int, default=6, help="Number of parallel workers for processing multiple APKs")
    
    
    args = parser.parse_args()
    if args.cmd == "build-embeddings":
        logger.info("[*] Building embeddings...")
        # We run Lib Embedding generation sequentially with batch processing since it is one time run. You can change the batch processing and include parallel processing if you want to speed it up.
        # But make sure to monitor GPU memory usage since it can easily run out of memory with large batch sizes.
        build_lib_embeddings(args.faiss_dir, args.lib_java, args.lib_smali, POS_DECAY_ALPHA, w1=FUSED_WEIGHT, w2=FUSED_WEIGHT, w3=FUSED_WEIGHT, w4=FUSED_WEIGHT, out_file=args.out)
    elif args.cmd == "detect-apks":
        logger.info("[*] Running TPL detection on APK Folder %s with %d workers...", args.apk_folder, args.workers)
        run_version_detection_pipeline_cached_parallel(
        args.apk_folder,
        args.lib_embeddings,
        args.lib_index_dir,
        args.th1,
        args.th2,
        args.embedding_save_path,
        args.groundtruth,
        args.out_dir,
        args.workers
        )
        
    else:
        parser.print_help()


if __name__ == "__main__":
    main()  