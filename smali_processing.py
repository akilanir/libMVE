import re
from dataclasses import dataclass

def extract_semantic_smali(smali_text: str) -> str:
    keep_keywords = (
        r'^\.method', r'^\.end method', r'^\.super', r'^\.implements',
        r'^\.field', r'invoke-', r'const-string', r'iget', r'iput', r'sget', r'sput',
        r'L[\w/$]+;'
    )

    pattern = re.compile('|'.join(keep_keywords))
    selected_lines = []

    for line in smali_text.splitlines():
        if pattern.search(line.strip()):
            selected_lines.append(line.strip())

    return '\n'.join(selected_lines)


def preprocess_smali_code(smali: str) -> str:

    patterns = [
        # Remove source line
        r'\.source\s+".*?"',

        # Remove annotation blocks safely
        r'(?s)\.annotation.*?\.end annotation',

        # Remove debug info
        r'\.line \d+',
        r'\.prologue',
        r'\.epilogue',
        r'\.local .*',
        r'\.end local',
        r'\.restart local',
        r'\.param .*',
        r'\.end param',
    ]

    cleaned = smali
    for p in patterns:
        cleaned = re.sub(p, '', cleaned)

    # Remove single line comments ONLY
    cleaned = re.sub(r'#.*$', '', cleaned, flags=re.MULTILINE)

    # Clean whitespace
    cleaned = "\n".join(
        line.rstrip()
        for line in cleaned.splitlines()
        if line.strip()
    )

    return cleaned


def split_smali_class(smali_code: str):
    lines = smali_code.splitlines()
    header = []
    methods = []
    current = []
    in_method = False
    for line in lines:
        if line.startswith('.method'):
            in_method = True
            current = [line]
        elif line.startswith('.end method'):
            current.append(line)
            methods.append("\n".join(current))
            in_method = False
        elif in_method:
            current.append(line)
        else:
            header.append(line)
    return "\n".join(header), methods



def parse_smali_blocks(smali_code: str):
    lines = smali_code.splitlines()
    blocks = []

    rest_block = []          # everything that is NOT a method
    current_block = []
    in_method = False

    def flush_method():
        nonlocal current_block, in_method
        if current_block:
            method = "\n".join(current_block).strip()
            # Extracting method signature
            # sig = extract_smali_method_sigs(method)
            blocks.append({
                "type": "METHOD",
                "text": method 
            })
            # blocks.append({
            #     "type": "METHOD",
            #     "text": method,
            #     "method_sig": sig
            # })
            current_block = []
            in_method = False

    for line in lines:
        stripped = line.strip()

        # ---- method start ----
        if stripped.startswith(".method"):
            flush_method()
            in_method = True
            current_block = [line]
            continue

        # ---- method end ----
        if stripped.startswith(".end method") and in_method:
            current_block.append(line)
            flush_method()
            continue

        # ---- inside method ----
        if in_method:
            current_block.append(line)
        else:
            # everything else goes to REST
            rest_block.append(line)

    flush_method()

    # prepend REST block if non-empty
    rest_text = "\n".join(rest_block).strip()
    if rest_text:
        blocks.insert(0, {
            "type": "REST",
            "text": rest_text
        })

    return blocks


# SMALI Method signature extraction methods ----------------
@dataclass
class SmaliMethodSig:
    name: str
    param_types: list[str]      # smali descriptors
    return_type: str
    descriptor: str



SMALI_METHOD_RE = re.compile(
    r"""^\.method\s+
        (?:[\w\s-]+?\s+)?            # optional access flags
        (?P<name><init>|<clinit>|[\w$]+)
        \(
            (?P<params>[^\)]*)
        \)
        (?P<ret>
            V|                        # void
            Z|B|S|C|I|J|F|D|          # primitives
            L[^;]+;|                 # object
            \[[^\s]+                 # array
        )
        """,
    re.VERBOSE
)


def split_smali_params(param_str):
    if not param_str:
        return []

    params = []
    i = 0
    while i < len(param_str):
        c = param_str[i]
        if c in "ZBCSIJFD":
            params.append(c)
            i += 1
        elif c == 'L':
            j = param_str.index(';', i)
            params.append(param_str[i:j+1])
            i = j + 1
        elif c == '[':
            j = i
            while param_str[j] == '[':
                j += 1
            if param_str[j] == 'L':
                k = param_str.index(';', j)
                params.append(param_str[i:k+1])
                i = k + 1
            else:
                params.append(param_str[i:j+1])
                i = j + 1
        else:
            raise ValueError(f"Unknown smali param type at {i}: {param_str}")
    return params