# How to use:
# python decompileLibFiles.py --input-dir path/to/lib_jars_and_aars --output-dir output_dir  
# Can add the Build tools path and baksmali path (Both are provided in build-tools folder)
# make sure you can run jadx command from terminal OR provide the path to jadx in the script (currently it is set to "jadx" assuming it is in PATH)

import argparse
import csv
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

# ---------------------------
# Defaults you can change
# ---------------------------
BUILD_TOOLS_DIR="build-tools"
JADX_CMD = "jadx"
BAKSMALI_JAR = os.path.join(BUILD_TOOLS_DIR, "baksmali-3.0.9-fat-release.jar")  
DX_CMD = os.path.join(BUILD_TOOLS_DIR, 'dx')
D8_CMD = os.path.join(BUILD_TOOLS_DIR, 'd8')

# Regex to guess name and version from file basename (without extension)
# e.g. "tpl-name-1.2.3" -> name: tpl-name, version: 1.2.3
VERSION_RE = re.compile(r"^(?P<name>.+?)-(?P<version>\d+(?:[.-]\d+)*[A-Za-z0-9_]*)$")

# ---------------------------
# Helper functions
# ---------------------------

def run_cmd(cmd, check=True, capture_output=False):
    print(f"RUN: {' '.join(cmd)}")
    try:
        if capture_output:
            res = subprocess.run(cmd, check=check, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
            return res
        else:
            res = subprocess.run(cmd, check=check)
            return res
    except subprocess.CalledProcessError as e:
        print(f"Command failed: {' '.join(cmd)}")
        if hasattr(e, 'stdout') and e.stdout:
            print('STDOUT:', e.stdout)
        if hasattr(e, 'stderr') and e.stderr:
            print('STDERR:', e.stderr)
        if check:
            raise
        return e


def extract_name_version(basename):
    m = VERSION_RE.match(basename)
    if m:
        return m.group('name'), m.group('version')
    # fallback: try last '-' split but only if RHS looks like version-ish (contains digits)
    if '-' in basename:
        parts = basename.rsplit('-', 1)
        if any(c.isdigit() for c in parts[1]):
            return parts[0], parts[1]
    return basename, ''


def ensure_dir(p: Path):
    p.mkdir(parents=True, exist_ok=True)


def count_files_with_ext(p: Path, ext: str):
    return sum(1 for _ in p.rglob(f'*{ext}'))

# ---------------------------
# Main processing functions
# ---------------------------

def decompile_jar_with_jadx(jar_path: Path, out_dir: Path):
    """Run jadx on jar_path -> out_dir (directory). Returns True on success."""
    ensure_dir(out_dir)
    cmd = [JADX_CMD, '-d', str(out_dir), str(jar_path)]
    run_cmd(cmd, check=False)
    return True


def create_dex_with_d8_or_dx(jar_path: Path, work_dir: Path):
    """Try d8 first to create classes.dex in work_dir; fallback to dx -> cls.dex
       Returns path to produced dex file.
    """
    dex_path = work_dir / 'classes.dex'
    # try d8
    d8_path = os.environ.get('D8_PATH', D8_CMD)
    dx_path = os.environ.get('DX_PATH', DX_CMD)

    if Path(d8_path).exists():
        cmd = [d8_path, str(jar_path), '--output', str(work_dir)]
        try:
            run_cmd(cmd)
            if dex_path.exists():
                return dex_path
        except Exception:
            print('d8 failed, falling back to dx')
    # fallback to dx
    if Path(dx_path).exists():
        cls_dex = work_dir / 'cls.dex'
        cmd = [dx_path, '--dex', '--output=' + str(cls_dex), str(jar_path)]
        run_cmd(cmd)
        if cls_dex.exists():
            return cls_dex
    # If neither tool exists or failed, raise
    raise FileNotFoundError('Neither d8 nor dx succeeded or are present at the configured locations')


def run_baksmali(dex_path: Path, baksmali_jar: Path, out_dir: Path):
    ensure_dir(out_dir)
    cmd = ['java', '-jar', str(baksmali_jar), 'd', str(dex_path), '-o', str(out_dir)]
    run_cmd(cmd)
    return True

# ---------------------------
# Pipeline
# ---------------------------

def process_jar_file(jar_file: Path, lib_java_dir: Path, lib_smali_dir: Path, lib_dex_dir: Path, baksmali_jar: Path, csv_writer):
    basename = jar_file.stem  # without extension
    tpl_name, version = extract_name_version(basename)
    out_name = f"{tpl_name}-{version}" if version else tpl_name

    # 1) Decompile with jadx to lib_java/<out_name>/
    java_out = lib_java_dir / out_name
    print(f"Decompiling JAR: {jar_file.name} -> {java_out}")
    decompile_jar_with_jadx(jar_file, java_out)

    # 2) Count .java files
    java_count = count_files_with_ext(java_out, '.java')
    print(f"Java files: {java_count}")

    # 3) Create dex (in temp dir)
    with tempfile.TemporaryDirectory() as td:
        td_p = Path(td)
        try:
            dex_path = create_dex_with_d8_or_dx(jar_file, td_p)
            if dex_path:
                dex_out = lib_dex_dir / f"{out_name}.dex"
                shutil.copy(dex_path, dex_out)
                print(f"Saved dex: {dex_out}")
        except Exception as e:
            print(f"Failed to create dex for {jar_file}: {e}")
            dex_path = None

        # 4) baksmali -> lib_smali/<out_name>/smali
        if dex_path:
            smali_out = lib_smali_dir / out_name / 'smali'
            run_baksmali(dex_path, baksmali_jar, smali_out)
            smali_count = count_files_with_ext(smali_out, '.smali')
            print(f"Smali files: {smali_count}")
        else:
            smali_count = 0

    # write csv
    csv_writer.writerow([jar_file.name, tpl_name, version])

    return {
        'file': str(jar_file),
        'tpl_name': tpl_name,
        'version': version,
        'java_count': java_count,
        'smali_count': smali_count,
    }


def process_aar_file(aar_file: Path, lib_java_dir: Path, lib_smali_dir: Path, lib_dex_dir: Path, baksmali_jar: Path, csv_writer):
    basename = aar_file.stem
    tpl_name, version = extract_name_version(basename)
    out_name = f"{tpl_name}-{version}" if version else tpl_name

    print(f"Processing AAR: {aar_file.name} -> {out_name}")
    with tempfile.TemporaryDirectory() as td:
        td_p = Path(td)
        aar_copy = td_p / aar_file.name
        shutil.copy(aar_file, aar_copy)

        # ---- FIX: explicitly treat .aar as .zip ----
        zip_file = aar_copy.with_suffix(".zip")
        aar_copy.rename(zip_file)

        try:
            shutil.unpack_archive(str(zip_file), str(td_p), format="zip")
        except Exception as e:
            print(f"Failed to unpack AAR {aar_file}: {e}")
            raise

        # Unzip AAR
        # try:
        #     shutil.copy(aar_file, td_p / aar_file.name)
        #     # unzip using shutil
        #     shutil.unpack_archive(str(td_p / aar_file.name), str(td_p))
        # except Exception as e:
        #     print(f"Failed to unpack AAR {aar_file}: {e}")
        #     raise

        classes_jar = td_p / 'classes.jar'
        if not classes_jar.exists():
            # sometimes classes are inside libs or classes.jar nested
            # try to find any jar inside
            jars = list(td_p.rglob('*.jar'))
            if jars:
                classes_jar = jars[0]
            else:
                raise FileNotFoundError(f'No classes.jar found inside {aar_file}')

        # Now treat classes_jar like a jar
        # copy classes_jar to a temp jar file with a sensible name
        temp_jar = td_p / (out_name + '.jar')
        shutil.copy(classes_jar, temp_jar)

        # decompile with jadx
        java_out = lib_java_dir / out_name
        decompile_jar_with_jadx(temp_jar, java_out)
        java_count = count_files_with_ext(java_out, '.java')
        print(f"Java files: {java_count}")

        # create dex
        try:
            dex_path = create_dex_with_d8_or_dx(temp_jar, td_p)
            if dex_path:
                dex_out = lib_dex_dir / f"{out_name}.dex"
                shutil.copy(dex_path, dex_out)
                print(f"Saved dex: {dex_out}")
        except Exception as e:
            print(f"Failed to create dex for {aar_file}: {e}")
            dex_path = None

        # baksmali
        if dex_path:
            smali_out = lib_smali_dir / out_name / 'smali'
            run_baksmali(dex_path, baksmali_jar, smali_out)
            smali_count = count_files_with_ext(smali_out, '.smali')
            print(f"Smali files: {smali_count}")
        else:
            smali_count = 0

    csv_writer.writerow([aar_file.name, tpl_name, version])

    return {
        'file': str(aar_file),
        'tpl_name': tpl_name,
        'version': version,
        'java_count': java_count,
        'smali_count': smali_count,
    }

# ---------------------------
# CLI Entrypoint
# ---------------------------

def main():
    parser = argparse.ArgumentParser(description='Decompile .jar and .aar libs to java and smali, count classes, and log CSV')
    parser.add_argument('--input-dir', required=True)
    parser.add_argument('--output-dir', required=True)
    parser.add_argument('--baksmali-jar', required=True, default=BAKSMALI_JAR, help='Path to baksmali fat jar')
    parser.add_argument('--build-tools', default=BUILD_TOOLS_DIR, help='Android build-tools dir (containing d8 or dx)')
    parser.add_argument('--recursive', action='store_true', help='Search input dir recursively')
    parser.add_argument('--csv', default='libraries.csv', help='CSV filename to write inside output-dir')

    args = parser.parse_args()

    input_dir = Path(args.input_dir)
    out_dir = Path(args.output_dir)
    baksmali_jar = Path(args.baksmali_jar)

    if not input_dir.exists():
        print('Input directory does not exist')
        sys.exit(1)
    if not baksmali_jar.exists():
        print('Baksmali jar not found:', baksmali_jar)
        sys.exit(1)

    # update build-tools paths
    global D8_CMD, DX_CMD
    BUILD_TOOLS = Path(args.build_tools)
    D8_CMD = str(BUILD_TOOLS / 'd8')
    DX_CMD = str(BUILD_TOOLS / 'dx')

    lib_java_dir = out_dir / 'lib_java'
    lib_smali_dir = out_dir / 'lib_smali'
    lib_dex_dir = out_dir / 'lib_dex'
    ensure_dir(lib_dex_dir)
    ensure_dir(lib_java_dir)
    ensure_dir(lib_smali_dir)

    csv_path = out_dir / args.csv
    csv_file = open(csv_path, 'w', newline='', encoding='utf-8')
    csv_writer = csv.writer(csv_file)
    csv_writer.writerow(['original_filename', 'tpl_name', 'version'])

    # collect files
    if args.recursive:
        files = [p for p in input_dir.rglob('*') if p.suffix.lower() in ('.jar', '.aar')]
    else:
        files = [p for p in input_dir.iterdir() if p.is_file() and p.suffix.lower() in ('.jar', '.aar')]

    results = []
    for f in files:
        try:
            if f.suffix.lower() == '.jar':
                res = process_jar_file(f, lib_java_dir, lib_smali_dir, lib_dex_dir, baksmali_jar, csv_writer)
            else:
                res = process_aar_file(f, lib_java_dir, lib_smali_dir, lib_dex_dir, baksmali_jar, csv_writer)
            results.append(res)
        except Exception as e:
            print(f"Error processing {f}: {e}")

    csv_file.close()

    # summary
    print('\nSummary:')
    for r in results:
        print(f"{r['file']}: java={r['java_count']} smali={r['smali_count']}")

    print(f"CSV written to: {csv_path}")


if __name__ == '__main__':
    main()