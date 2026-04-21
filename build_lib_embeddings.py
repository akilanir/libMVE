from collections import defaultdict
import pickle
from tqdm import tqdm
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import time

# Local imports
from java_processing import parse_java_blocks
from smali_processing import parse_smali_blocks
from utils import collect_files, get_smali_index, read_and_merge_smali_for_class, class_name_from_path, read_file_text, extract_original_class_name, embed_java_blocks_batch, embed_smali_blocks_batch
from embedding_fusion import averaged_fusion_all


def build_lib_embeddings(faiss_dir, tpl_lib_java_dir, tpl_lib_smali_dir, w1, w2, w3, w4, out_file: Path = None):
    faiss_dir.mkdir(parents=True, exist_ok=True)

    if out_file is None:
        out_file = faiss_dir / "lib_embeddings_unknwn.pkl"

    lib_embeddings = []
    java_files = collect_files(tpl_lib_java_dir, ".java")
    
    # Initialize Embedders
    from miniLM_embedder import MiniLMEmbedder
    embedder = MiniLMEmbedder()

    for jfile in tqdm(java_files, desc="Lib classes processing:"):
        cname, package_name = class_name_from_path(jfile, tpl_lib_java_dir)
        java_text = read_file_text(jfile)
        smali_index = get_smali_index(tpl_lib_smali_dir)
        smali_text = read_and_merge_smali_for_class(cname, tpl_lib_smali_dir, smali_index)
        # print(f"Processing class: {cname} in package: {package_name}")
        if not smali_text:
            """ FOR JADX compilation issues where the .java name is different from smali class name """
            renamed_cname = extract_original_class_name(java_text) # This gives com.google.a.b.c - But we need gson-2.8.2.com.google.a.b.c
            try:
                new_cname = package_name + "." + renamed_cname
            except Exception as e:
                print(f"[!FAIL!] Failed to extract original class name from java comments for class: {cname} in package: {package_name} with error: {e}")
                new_cname = renamed_cname
            print(f"[i] Extracted original class name from java comments: {new_cname}")
            smali_text = read_and_merge_smali_for_class(new_cname, tpl_lib_smali_dir, smali_index)

        if not smali_text:
            print(f"[!FAIL!] No smali found for class: {cname} and New class name: {new_cname}")

        # Block Segmentation and Preprocessing with Semantic Filtering
        java_blocks = parse_java_blocks(java_text)
        smali_blocks = parse_smali_blocks(smali_text)

        # Embedding Segmented Blocks and Block Fusion (Positional Decay Mean Pooling)
        java_raw_emb, java_fil_emb = embed_java_blocks_batch(java_blocks, embedder)
        smali_raw_emb, smali_fil_emb = embed_smali_blocks_batch(smali_blocks, embedder)
     
        # Simple Mean Pooling with (0.25, 0.25, 0.25, 0.25) weights for all 4 views (java_raw, java_fil, smali_raw, smali_fil)
        fused_emb = averaged_fusion_all(java_raw_emb, java_fil_emb, smali_raw_emb, smali_fil_emb, w1, w2, w3, w4)

        lib_embeddings.append({
            "class_name": cname,
            "package_name": package_name,
            # ---- 4 canonical views ----
            "java_raw": java_raw_emb,
            "java_filtered": java_fil_emb,
            "smali_raw": smali_raw_emb,
            "smali_filtered": smali_fil_emb,
            # ---- optional ----
            "fused_emb": fused_emb
        })

    with open(out_file, "wb") as fh:
        pickle.dump(lib_embeddings, fh)
        print(f"[+] Saved embeddings -> {out_file}")
        