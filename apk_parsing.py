import pickle
from tqdm import tqdm
from pathlib import Path

from java_processing import parse_java_blocks, preprocess_java_code, semantic_filter_java_v2
from smali_processing import parse_smali_blocks, preprocess_smali_code, extract_semantic_smali
from utils import (
    collect_files,
    class_name_from_path,
    read_file_text,
    read_and_merge_smali_for_class,
    extract_original_class_name,
    get_smali_index,
    get_smali_cache_path
)
from logger import get_file_logger
log_path = Path("logs/pipeline.log")
logger = get_file_logger(log_path)


def build_apk_classes(jadx_out: Path, apktool_out: Path):
    # This will return all the java and smali parsed blocks without doing any processing as class_data_list
    class_data_list = []

    # We need to get the smali texts for each class after inner class merging to extract the list of APIs later
    # We first extract them and store in a cache so we can use it later if we redo the analysis
    smali_class_map = {}
    cache_file = get_smali_cache_path(jadx_out, apktool_out)
    
    smali_index = get_smali_index(apktool_out)
    java_files = collect_files(jadx_out, ".java")

    for jfile in tqdm(java_files, desc="Parsing APK classes", mininterval=1):
        cname, package_name = class_name_from_path(jfile, jadx_out)
        java_text = read_file_text(jfile)

        smali_text = read_and_merge_smali_for_class(cname, apktool_out, smali_index)
        if not smali_text:
            """ FOR JADX compilation issues where the .java name is different from smali class name """
            new_cname = extract_original_class_name(java_text)
            # print(f"[i] Extracted original class name from java comments: {new_cname}")
            smali_text = read_and_merge_smali_for_class(new_cname, apktool_out, smali_index)
        if not smali_text:
            logger.info(f"[!IMPORTANT]- Missing Smali File FOR: {package_name} - {cname}")

        smali_class_map[cname] = smali_text

        # Important: Initial Block Segmentation: This takes around 10-20 seconds for a large APK
        java_blocks = parse_java_blocks(java_text)
        smali_blocks = parse_smali_blocks(smali_text)

        java_processed = []
        smali_processed = []

        for i, b in enumerate(java_blocks):
            java_processed.append({
                "type": b["type"],
                "block_id": i,
                "text": b["text"]
            })

        for i, b in enumerate(smali_blocks):
            smali_processed.append({
                "type": b["type"],
                "block_id": i,
                "text": b["text"]
            })

        class_data_list.append({
            "class_name": cname,
            "package_name": package_name,
            "java_blocks": java_processed,
            "smali_blocks": smali_processed
        })

    # -------------------------
    # SAVE CACHE
    # -------------------------
    logger.info("[SMALI] Saving cache map: %s", cache_file)
    with open(cache_file, "wb") as f:
        pickle.dump(smali_class_map, f)

    return class_data_list, smali_class_map