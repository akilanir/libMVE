"""
How to Use:
To Build Embeddings: python main.py build-embeddings --lib-java lib_java --lib-smali lib_smali --out faiss_data/Embedding.pkl
To Build Faiss-Indexes: python main.py build-faiss --embeddings faiss_data/Embedding.pkl
To Detect TPL: python main.py detect-apk --apk path/to/target.apk --embeddings faiss_data/Embedding.pkl --compare both
"""
import argparse
import sys
from pathlib import Path

# Internal imports
from build_lib_embeddings import build_lib_embeddings
from detect_with_versions import run_version_detection_pipeline_cached_parallel
from config import (TPL_LIB_JAVA_DIR, TPL_LIB_SMALI_DIR, FAISS_DIR, EMBEDDINGS_FILE, OUTPUT_DIR, LOG_LEVEL)
from logger import get_file_logger
log_path = Path("logs/pipeline.log")
logger = get_file_logger(log_path)


def main():
    parser = argparse.ArgumentParser(description="TPL Detection pipeline (build embeddings, build index, analyze APK)")
    sub = parser.add_subparsers(dest="cmd")

    p_build = sub.add_parser("build-embeddings", help="Build fused embeddings from decompiled lib_java/lib_smali")
    p_build.add_argument("--lib-java", type=Path, default=TPL_LIB_JAVA_DIR)
    p_build.add_argument("--lib-smali", type=Path, default=TPL_LIB_SMALI_DIR)
    p_build.add_argument("--faiss-dir", type=Path, default=FAISS_DIR)
    p_build.add_argument("--out", type=Path, default=EMBEDDINGS_FILE)

    p_detect = sub.add_parser("detect-apk", help="Decompile APK and detect TPL presence")
    p_detect.add_argument("--apk", type=Path, required=True)
    p_detect.add_argument("--embeddings", type=Path, default=EMBEDDINGS_FILE)
    p_detect.add_argument("--out-prefix", type=Path, default=None)

    p_detect_multiple = sub.add_parser("detect-apks", help="Decompile APK and detect TPL presence of multiple APKs in a directory")
    p_detect_multiple.add_argument("--apk-folder", type=Path, required=True, help="Path to target APKs Folder")
    p_detect_multiple.add_argument("--embeddings", type=Path, required=True, help="Path to library embeddings pickle")
    p_detect_multiple.add_argument("--th1", type=float, required=True, help="First Threshold Package/TPL Level")
    p_detect_multiple.add_argument("--th2", type=float, required=True, help="Second Threshold for System API Detection")
    p_detect_multiple.add_argument("--apk-embedding-save-path", type=Path, required=True, help="Second Threshold for System API Detection")
    p_detect_multiple.add_argument("--groundtruth", type=Path, help="Optional: path to groundtruth JSON file")
    p_detect_multiple.add_argument("--out-dir", type=Path, default=OUTPUT_DIR, help="Output directory for results")
    p_detect_multiple.add_argument("--workers", type=int, default=1, help="Number of parallel workers for processing multiple APKs")
    
    
    args = parser.parse_args()
    if args.cmd == "build-embeddings":
        logger.info("[*] Building embeddings...")
        build_lib_embeddings(args.faiss_dir, args.lib_java, args.lib_smali, w1=0.25, w2=0.25, w3=0.25, w4=0.25, out_file=args.out)
    elif args.cmd == "detect-apk":
        logger.info("[*] Running TPL detection on APK...")
        out_prefix = args.out_prefix or (Path(OUTPUT_DIR) / args.apk.stem)
        # run_detection_pipeline(args.apk, args.embeddings, compare_method=args.compare, out_prefix=out_prefix)
    elif args.cmd == "detect-apks":
        logger.info("[*] Running TPL detection on APK Folder %s with %d workers...", args.apk_folder, args.workers)
        run_version_detection_pipeline_cached_parallel(
        args.apk_folder,
        args.embeddings,
        args.th1,
        args.th2,
        args.apk_embedding_save_path,
        args.groundtruth,
        args.out_dir,
        args.workers
        )
        
    else:
        parser.print_help()


if __name__ == "__main__":
    main()
    # sys.exit(0)   