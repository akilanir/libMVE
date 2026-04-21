# logger.py
import logging
from pathlib import Path

def get_file_logger(log_file: Path, name: str = "apk_pipeline", level: int = logging.INFO) -> logging.Logger:
    """
    Returns a logger that writes ONLY to a file (no console output).
    """
    logger = logging.getLogger(name)
    
    if not logger.hasHandlers():
        log_file.parent.mkdir(parents=True, exist_ok=True)
        
        # File handler only
        file_handler = logging.FileHandler(log_file, mode='a')  # 'a' for append
        formatter = logging.Formatter('[%(levelname)s] %(asctime)s - %(message)s', 
                                      datefmt='%Y-%m-%d %H:%M:%S')
        file_handler.setFormatter(formatter)
        
        logger.addHandler(file_handler)
        logger.setLevel(level)
    
    return logger