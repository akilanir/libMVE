"""
Enhanced FAISS indexing with per-library and version support
"""
import pickle
from pathlib import Path
from collections import defaultdict
import faiss
import csv
import numpy as np
from typing import Dict, List, Tuple, Optional

from config import FAISS_DIR, EMB_DTYPE
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


def build_library_specific_index(embeddings: list, lib_name: str, out_dir: Path) -> Tuple[Optional[Path], Optional[Path]]:
    """Builds a FAISS index for a specific library and its versions."""
    logger.info("LIB NAME READ FROM PACKAGE NAME: %s", lib_name)
    # Filter embeddings for this library
    lib_embeddings = [e for e in embeddings if e['package_name'] == lib_name]

    if not lib_embeddings:
        return None, None
    
    # Here loads the FUSED EMBEDDINGS
    vecs = np.array([normalize_vec(e['fused_emb']) for e in lib_embeddings], dtype=EMB_DTYPE)
    dim = vecs.shape[1]
    index = faiss.IndexFlatIP(dim)
    index.add(vecs)
    
    # Create library-specific files
    ### ---- NOTE: out_dir -- FAISS Directory ---- ###
    index_file = out_dir / f"{lib_name.replace('.', '_')}.index"
    meta_file = out_dir / f"{lib_name.replace('.', '_')}_meta.pkl"
    
    out_dir.mkdir(parents=True, exist_ok=True)
    faiss.write_index(index, str(index_file))
    
    # Save meta with class names and version info
    meta = [
        {
            "class_name": e['class_name'],
            "package_name": e['package_name'],
            "version": lib_map.get(f"{e['package_name']}.jar", {}).get('version', 'unknown_version')
        }
        for e in lib_embeddings
    ]
    
    with open(meta_file, "wb") as fh:
        pickle.dump(meta, fh)
    
    return index_file, meta_file


def build_faiss_indexes(embeddings_pkl: Path) -> Path:
    """Builds separate FAISS indexes for each library from embeddings."""
    if not embeddings_pkl.exists():
        raise FileNotFoundError(f"Embeddings file not found: {embeddings_pkl}")

    with open(embeddings_pkl, "rb") as fh:
        embeddings = pickle.load(fh)

    if not embeddings:
        raise RuntimeError("No embeddings in file")

    # Group by library name
    libraries = {e['package_name'] for e in embeddings}
    # Ex: one library is one .jar file (internal_impl-21.0.3)

    # libraries = {
    #     lib_map.get(f"{e['package_name']}.jar", {}).get('library', 'unknown_lib')
    #     for e in embeddings
    # }

    library_indexes = {}

    for lib in libraries:
        logger.info("Library: %s - Building index... ", lib)
        index_file, meta_file = build_library_specific_index(embeddings, lib, FAISS_DIR)
        if index_file:
            library_indexes[lib] = {
                "index_file": index_file,
                "meta_file": meta_file
            }

    # Save library index mapping
    index_map_file = FAISS_DIR / "library_indexes.pkl"
    with open(index_map_file, "wb") as fh:
        pickle.dump(library_indexes, fh)

    logger.info("[+] Built %d library-specific indexes in %s", len(library_indexes), FAISS_DIR)
    for lib, files in library_indexes.items():
        logger.info("  - %s: %s", lib, files['index_file'].name)
    
    return index_map_file


def load_library_indexes(index_map_file: Path) -> Dict[str, Dict]:
    """Load all library indexes and their metadata."""
    with open(index_map_file, "rb") as fh:
        library_indexes = pickle.load(fh)
    
    loaded_indexes = {}
    for lib_name, files in library_indexes.items():
        index = faiss.read_index(str(files["index_file"]))
        with open(files["meta_file"], "rb") as fh:
            meta = pickle.load(fh)
        loaded_indexes[lib_name] = {"index": index, "meta": meta}
    
    return loaded_indexes


def build_faiss_indexes_new(faiss_dir, embeddings_pkl: Path) -> Path:
    """Builds separate FAISS indexes for each library from embeddings."""
    if not embeddings_pkl.exists():
        raise FileNotFoundError(f"Embeddings file not found: {embeddings_pkl}")

    with open(embeddings_pkl, "rb") as fh:
        embeddings = pickle.load(fh)

    if not embeddings:
        raise RuntimeError("No embeddings in file")

    # Group by library name
    libraries = {e['package_name'] for e in embeddings}
    # Ex: one library is one .jar file (internal_impl-21.0.3)

    # libraries = {
    #     lib_map.get(f"{e['package_name']}.jar", {}).get('library', 'unknown_lib')
    #     for e in embeddings
    # }

    library_indexes = {}

    for lib in libraries:
        logger.info("Library: %s - Building index... ", lib)
        index_file, meta_file = build_library_specific_index(embeddings, lib, faiss_dir)
        if index_file:
            library_indexes[lib] = {
                "index_file": index_file,
                "meta_file": meta_file
            }

    # Save library index mapping
    index_map_file = faiss_dir / "library_indexes.pkl"
    with open(index_map_file, "wb") as fh:
        pickle.dump(library_indexes, fh)

    logger.info("[+] Built %d library-specific indexes in %s", len(library_indexes), faiss_dir)
    for lib, files in library_indexes.items():
        logger.info("  - %s: %s", lib, files['index_file'].name)
    
    return index_map_file