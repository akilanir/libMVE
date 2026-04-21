from utils import normalize_vec

from config import EMB_DTYPE

def averaged_fusion(emb1,emb2, w1, w2):
    # Weighted fusion
    fused_emb = (
                w1 * emb1 +
                w2 * emb2
        ).astype(EMB_DTYPE)
    fused_emb = normalize_vec(fused_emb)
    return fused_emb

def averaged_fusion_all(emb1,emb2,emb3,emb4, w1, w2, w3, w4):
    # Weighted fusion
    fused_emb = (
                w1 * emb1 +
                w2 * emb2 +
                w3 * emb3 +
                w4 * emb4
        ).astype(EMB_DTYPE)
    fused_emb = normalize_vec(fused_emb)
    return fused_emb