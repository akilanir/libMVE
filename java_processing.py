from dataclasses import dataclass
import re
from sys import prefix
import javalang

# --- Placeholders ---
CLS_TOKEN = "CLS"
METHOD_TOKEN = "MTH"
FIELD_TOKEN = "FLD"
VAR_TOKEN = "VAR"
PARAM_TOKEN = "PAR"
NUM_TOKEN = "NUM"
STR_TOKEN = "STR"

# --- Keywords & common types ---
JAVA_KEYWORDS = set([
    "abstract", "assert", "boolean", "break", "byte", "case", "catch", "char",
    "class", "const", "continue", "default", "do", "double", "else", "enum",
    "extends", "final", "finally", "float", "for", "goto", "if", "implements",
    "import", "instanceof", "int", "interface", "long", "native", "new",
    "package", "private", "protected", "public", "return", "short", "static",
    "strictfp", "super", "switch", "synchronized", "this", "throw", "throws",
    "transient", "try", "void", "volatile", "while", "true", "false", "null"
])
COMMON_TYPES = set(["int", "float", "double", "boolean", "char", "long", "short", "byte", "String", "Object"])

# --- Regex patterns ---
IDENT = r'[A-Za-z_]\w*'

def semantic_filter_java_v2(code: str, api_tokens: set = None) -> str:
    # print("Java Semantic Filter V2 is used")
    """
    Filter Java source code semantically (Smali Filter1 style):
    - Keeps API/library packages, imports, class names, and public API methods.
    - Replaces local variables, private methods, constants, literals.
    """
    if api_tokens is None:
        api_tokens = set()

    # --- Normalize newlines ---
    code = code.replace("\r\n", "\n").replace("\r", "\n") #Pre Processing
    code = "\n".join(line for line in code.splitlines() if line.strip())

    # --- Remove comments ---
    code = re.sub(r'/\*.*?\*/', ' ', code, flags=re.DOTALL) #Pre Processing
    code = re.sub(r'//.*?$', ' ', code, flags=re.MULTILINE)

    # --- Replace literals ---
    code = re.sub(r'"(?:\\.|[^"\\])*"', STR_TOKEN, code)
    code = re.sub(r"'\w'", STR_TOKEN, code)
    code = re.sub(r'\b\d+(\.\d+)?\b', NUM_TOKEN, code)

    # --- Keep meaningful packages/imports ---
    def repl_package_import(m):
        stmt = m.group(1)
        full_name = m.group(2)
        
        m_root = re.match(r'^(android|androidx|java|javax|kotlin|com|org)(\..+)?', full_name)
        if m_root:
            root = m_root.group(1)
            return m.group(0).split()[0] + f" {root}.*;"
        return f'{stmt} ' + '.'.join([VAR_TOKEN]*len(full_name.split('.'))) + ';'


    code = re.sub(r'(package)\s+([^\s;]+);', repl_package_import, code)
    code = re.sub(r'(import)\s+([^\s;]+);', repl_package_import, code)
    

    # --- Replace class/interface names ---
    class_map = {}
    def repl_class(m):
        cls_name = m.group(2)
        class_map[cls_name] = CLS_TOKEN
        return f"{m.group(1)} {CLS_TOKEN}"
    code = re.sub(r'\b(class|interface)\s+(' + IDENT + r')\b', repl_class, code)

    def repl_extends_implements(m):
        names = m.group(1)  # e.g., "b, SomeOtherClass"
        # Replace each class/interface with CLS_TOKEN
        new_names = ', '.join([CLS_TOKEN for _ in names.split(',')])
        return f"{m.group(0).split()[0]} {new_names}"
    
    # Replace after 'extends'
    code = re.sub(r'\bextends\s+([^\s{]+)', lambda m: f"extends {CLS_TOKEN}", code)
    # Replace after 'implements' (comma-separated)
    code = re.sub(r'\bimplements\s+([^\{]+)', lambda m: "implements " + ', '.join([CLS_TOKEN for _ in m.group(1).split(',')]), code)

    # print(code)
    # --- Replace method declarations (keep API tokens intact) ---
    # ToDo: We need to pass this api_tokens to keep the system APIs
    # Something we have missed and need to rectify ASAP
    method_map = {}
    def repl_method(m):
        prefix = m.group(1) or ""
        ret_type = m.group(2) or ""
        name = m.group(3)
        if name in api_tokens:
            method_map[name] = name
            return f"{prefix}{ret_type} {name}("
        method_map[name] = METHOD_TOKEN
        return f"{prefix}{ret_type} {METHOD_TOKEN}("
    code = re.sub(
        r'((?:public|private|protected|static|final|synchronized|native|abstract|transient|volatile)\s+)*'
        r'(' + IDENT + r'(?:\<.*?\>)?\s+)\s*(' + IDENT + r')(\s*\()', repl_method, code)

    # --- Replace method parameters ---
    def repl_params(m):
        params = m.group(1)
        if not params.strip():
            return "()"
        parts = []
        for p in re.split(r',\s*', params):
            tokens = re.findall(IDENT, p)
            name = next((t for t in reversed(tokens) if t not in JAVA_KEYWORDS and t not in COMMON_TYPES and t not in api_tokens), None)
            parts.append(PARAM_TOKEN if name else VAR_TOKEN)
        return "(" + ", ".join(parts) + ")"
    code = re.sub(r'\(\s*([^\)]*?)\s*\)', repl_params, code)

    # --- Replace field declarations ---
    field_map = {}
    def repl_field(m):
        typename, name = m.group(1), m.group(2)
        if name not in api_tokens:
            field_map[name] = FIELD_TOKEN
            return f"{typename} {FIELD_TOKEN}{m.group(3)}"
        return m.group(0)
    code = re.sub(r'\b(' + IDENT + r'(?:\<.*?\>)?)\s+(' + IDENT + r')\s*([=;,\)])', repl_field, code)

    # --- Replace member accesses ---
    def repl_member(m):
        name = m.group(1)
        if name in method_map:
            return "." + method_map[name]
        if name in field_map:
            return "." + FIELD_TOKEN
        if name in class_map:
            return "." + CLS_TOKEN
        if name in api_tokens:
            return "." + name
        return "." + VAR_TOKEN
    code = re.sub(r'\.(' + IDENT + r')\b', repl_member, code)

    # --- Cleanup extra whitespace ---
    code = re.sub(r'[ \t]+', ' ', code)
    code = re.sub(r'\n+', '\n', code)

    return code.strip()


def preprocess_java_code(java_code: str) -> str:
    """
    Apply regex filters to remove decompiler-generated artefacts.
    """
    patterns = [
        r"(?s)/\*.*?JADX.*?\*/",       # Remove multi-line JADX comments
        r"//\s*JADX[^\n]*",             # Remove single-line JADX notes
        r"//\s*(synthetic|bridge)\b.*", # Remove synthetic/bridge comments
        r"//\s*(Code|Instructions):.*", # Remove placeholder markers
        r"/\*\s*compiled from:.*?\*/",  # Remove compiled from metadata
        r"/\*\s*renamed from:.*?\*/",
        r"/\*\s*loaded from:.*?\*/",
        r"//.*",
    ]
    
    cleaned_code = java_code
    for pattern in patterns:
        cleaned_code = re.sub(pattern, "", cleaned_code, flags=re.MULTILINE)
    
    # Remove empty lines and trailing whitespace
    cleaned_code = "\n".join(line.rstrip() for line in cleaned_code.splitlines() if line.strip())
    return cleaned_code


def strip_java_comments(code: str) -> str:
    # remove /* */ comments
    code = re.sub(r"/\*.*?\*/", "", code, flags=re.S)
    # remove // comments
    code = re.sub(r"//.*?$", "", code, flags=re.M)
    return code

# Support method for javalang method descriptor parsing
def type_to_str(t):
    if t is None:
        return "void"
    
    # Handle basic types and simple reference types
    # javalang nodes for types usually have a 'name' attribute
    base = getattr(t, 'name', str(t))

    # If the type has multiple parts (e.g., java.lang.String)
    # ReferenceType nodes often have a 'subpackage' or 'path'
    if hasattr(t, 'subpackage') and t.subpackage:
        base = f"{t.subpackage}.{base}"

    # Handling Dimensions (Arrays)
    # t.dimensions is a list, e.g., [None] for String[], [None, None] for String[][]
    if hasattr(t, 'dimensions') and t.dimensions:
        base += "[]" * len(t.dimensions)
        
    return base

@dataclass
class JavaMethodSig:
    name: str
    param_types: list[str]      # Java types (no generics)
    return_type: str            # Java type

# Compile ONCE (important for speed)
METHOD_START_RE = re.compile(
    r"""
    ^\s*
    (?:@[\w\.]+(?:\([^)]*\))?\s*)*   # annotations
    (?:
        public|protected|private|
        static|final|abstract|
        synchronized|native|
        strictfp
    )*\s*
    (?:<[^>]+>\s*)?                  # generics
    (?:[\w\[\]<>?,\s]+\s+)?          # return type (absent for constructors)
    \w+\s*                           # method / constructor name
    \([^;]*\)                        # parameters
    (?:\s+throws\s+[\w\.,\s]+)?      # throws clause
    \s*\{                            # opening brace
    """,
    re.VERBOSE
)

CONTROL_KEYWORDS = ("if", "for", "while", "switch", "catch", "do", "else", "try", "synchronized")


def parse_java_blocks_one_rest(java_code: str):
    """
    Deterministic Java block parser:
    - Guarantees exactly 1 REST block
    - Preserves METHOD order (first-appearance order)
    - Uses brace depth tracking
    - Returns blocks with positional indexing
    """

    java_code = java_code.strip()
    if not java_code:
        return []

    lines = java_code.splitlines()

    blocks = []
    rest_parts = []
    methods = []

    in_method = False
    brace_depth = 0
    method_buffer = []

    for line in lines:
        stripped = line.strip()

        open_braces = line.count("{")
        close_braces = line.count("}")

        # Detect method start (only if not inside method)
        if not in_method:
            if (
                METHOD_START_RE.search(line)
                and not stripped.startswith(CONTROL_KEYWORDS)
            ):
                in_method = True
                method_buffer = [line]
                brace_depth = open_braces - close_braces
                continue
            else:
                rest_parts.append(line)
                continue

        # Inside method
        method_buffer.append(line)
        brace_depth += open_braces - close_braces

        if brace_depth == 0:
            methods.append("\n".join(method_buffer).strip())
            method_buffer = []
            in_method = False

    # Handle unclosed method (edge case)
    if method_buffer:
        methods.append("\n".join(method_buffer).strip())

    # ------------------------------------
    # Build final ordered block list
    # ------------------------------------

    blocks.append({
        "index": 0,
        "type": "REST",
        "text": "\n".join(rest_parts).strip()
    })

    for i, method_text in enumerate(methods, start=1):
        blocks.append({
            "index": i,
            "type": "METHOD",
            "text": method_text
        })

    return blocks


def parse_java_blocks(java_code: str):
    """
    Fast Java block parser:
    - Extracts METHOD blocks
    - Everything else goes into REST
    - Regex + brace depth only
    """

    java_code = java_code.strip()
    if not java_code:
        return []

    lines = java_code.splitlines()
    blocks = []

    rest_buffer = []
    method_buffer = []

    in_method = False
    brace_depth = 0

    for line in lines:
        stripped = line.strip()

        # Count braces early (important)
        open_braces = line.count("{")
        close_braces = line.count("}")

        # Detect method start
        if not in_method:
            if (
                METHOD_START_RE.match(line)
                and not stripped.startswith(CONTROL_KEYWORDS)
            ):
                # Flush REST
                if rest_buffer:
                    blocks.append({
                        "type": "REST",
                        "text": "\n".join(rest_buffer).strip()
                    })
                    rest_buffer = []

                in_method = True
                method_buffer = [line]
                brace_depth = open_braces - close_braces
                continue
            else:
                rest_buffer.append(line)
                continue

        # Inside method
        method_buffer.append(line)
        brace_depth += open_braces - close_braces

        if brace_depth == 0:
            blocks.append({
                "type": "METHOD",
                "text": "\n".join(method_buffer).strip()
            })
            method_buffer = []
            in_method = False

    # Flush leftovers
    if method_buffer:
        blocks.append({
            "type": "METHOD",
            "text": "\n".join(method_buffer).strip()
        })

    if rest_buffer:
        blocks.append({
            "type": "REST",
            "text": "\n".join(rest_buffer).strip()
        })

    return blocks