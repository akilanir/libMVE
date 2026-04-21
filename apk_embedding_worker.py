import numpy as np
from typing import List

# Internal Imports
from utils import embed_java_blocks_batch, embed_smali_blocks_batch
from embedding_fusion import averaged_fusion_all
from config import ALPHA, BETA, GAMMA, DELTA
from miniLM_embedder import MiniLMEmbedder


def embed_classes_gpu(class_data_list: List[dict]):
    """
    Sequential GPU embedding, batched per class.
    """
    embedder = MiniLMEmbedder()

    for class_data in class_data_list:
        yield embed_single_class(embedder, class_data)


def embed_single_class(embedder, class_data):
    cname = class_data["class_name"]
    package_name = class_data["package_name"]

    java_blocks = class_data["java_blocks"]
    smali_blocks = class_data["smali_blocks"]

    java_raw_cls, java_filt_cls = embed_java_blocks_batch(java_blocks,embedder)
    smali_raw_cls, smali_filt_cls = embed_smali_blocks_batch(smali_blocks,embedder)
    fused_emb = averaged_fusion_all(java_raw_cls, java_filt_cls, smali_raw_cls, smali_filt_cls, ALPHA, BETA, GAMMA, DELTA)

    # print("IMPORTANT: FUSED EMB for 0.8 pos decay alpha.....")
    data = {"class_name": cname,
            "package_name": package_name,
            "java_raw": java_raw_cls,
            "java_filtered": java_filt_cls,
            "smali_raw": smali_raw_cls,
            "smali_filtered": smali_filt_cls,
            "fused": fused_emb}
    
    return data