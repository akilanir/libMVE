import pickle
from pathlib import Path
from tqdm import tqdm
import time

from utils import decompile_apk
from apk_parsing import build_apk_classes
from apk_embedding_worker import embed_classes_gpu
from config import LOG_LEVEL
from logger import get_file_logger
log_path = Path("logs/pipeline.log")
logger = get_file_logger(log_path)

def build_apk_embeddings(
    apk_path: Path,
    work_dir: Path,
    out_path: Path,
    resume: bool = True
):
    """
    End-to-end APK embedding with resume support.
    """
    out_path.parent.mkdir(parents=True, exist_ok=True)

    # ---- Load previous progress if exists ----
    if resume and out_path.exists():
        logger.info("[✓] Resuming from %s", out_path)
        with open(out_path, "rb") as f:
            done_classes = pickle.load(f)
        done_class_names = {c["class_name"] for c in done_classes}
    else:
        done_classes = []
        done_class_names = set()

    # ---- Decompile ----
    start_time = time.time()
    jadx_out, apktool_out = decompile_apk(apk_path, work_dir)
    time_taken = time.time()
    logger.info("[✓] TIME- Decompilation completed for %s in %.2f seconds", apk_path, time_taken - start_time)

    # ---- Parse classes (CPU) ----
    class_data_list, smali_class_map = build_apk_classes(jadx_out, apktool_out)
    parsing_time = time.time()
    logger.info("[✓] TIME- Class parsing completed for %s in %.2f seconds", apk_path, parsing_time - time_taken)

    pending = [
        c for c in class_data_list
        if c["class_name"] not in done_class_names
    ]

    logger.info("[i] Total classes: %d", len(class_data_list))
    logger.info("[i] Pending classes: %d", len(pending))

    if not pending:
        logger.info("[✓] Nothing to do.")
        return done_classes

    # ---- Embed (GPU, batched) ----
    for embedded_class in tqdm(
        embed_classes_gpu(pending),
        total=len(pending),
        desc="Embedding classes"
    ):
        done_classes.append(embedded_class)
    embedding_time = time.time()
    logger.info("[✓] TIME- Class embedding completed for %s in %.2f seconds", apk_path, embedding_time - parsing_time)

    # One write per APK
    with open(out_path, "wb") as f:
        pickle.dump(done_classes, f)

    logger.info("[✓] APK embeddings saved to %s", out_path)
    return done_classes, smali_class_map