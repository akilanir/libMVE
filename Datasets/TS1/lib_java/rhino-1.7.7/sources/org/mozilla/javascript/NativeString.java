package org.mozilla.javascript;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/NativeString.class */
final class NativeString extends IdScriptableObject {
    static final long serialVersionUID = 920268368584188687L;
    private static final Object STRING_TAG = "String";
    private static final int Id_length = 1;
    private static final int MAX_INSTANCE_ID = 1;
    private static final int ConstructorId_fromCharCode = -1;
    private static final int Id_constructor = 1;
    private static final int Id_toString = 2;
    private static final int Id_toSource = 3;
    private static final int Id_valueOf = 4;
    private static final int Id_charAt = 5;
    private static final int Id_charCodeAt = 6;
    private static final int Id_indexOf = 7;
    private static final int Id_lastIndexOf = 8;
    private static final int Id_split = 9;
    private static final int Id_substring = 10;
    private static final int Id_toLowerCase = 11;
    private static final int Id_toUpperCase = 12;
    private static final int Id_substr = 13;
    private static final int Id_concat = 14;
    private static final int Id_slice = 15;
    private static final int Id_bold = 16;
    private static final int Id_italics = 17;
    private static final int Id_fixed = 18;
    private static final int Id_strike = 19;
    private static final int Id_small = 20;
    private static final int Id_big = 21;
    private static final int Id_blink = 22;
    private static final int Id_sup = 23;
    private static final int Id_sub = 24;
    private static final int Id_fontsize = 25;
    private static final int Id_fontcolor = 26;
    private static final int Id_link = 27;
    private static final int Id_anchor = 28;
    private static final int Id_equals = 29;
    private static final int Id_equalsIgnoreCase = 30;
    private static final int Id_match = 31;
    private static final int Id_search = 32;
    private static final int Id_replace = 33;
    private static final int Id_localeCompare = 34;
    private static final int Id_toLocaleLowerCase = 35;
    private static final int Id_toLocaleUpperCase = 36;
    private static final int Id_trim = 37;
    private static final int Id_trimLeft = 38;
    private static final int Id_trimRight = 39;
    private static final int Id_includes = 40;
    private static final int Id_startsWith = 41;
    private static final int Id_endsWith = 42;
    private static final int Id_normalize = 43;
    private static final int Id_repeat = 44;
    private static final int Id_codePointAt = 45;
    private static final int MAX_PROTOTYPE_ID = 45;
    private static final int ConstructorId_charAt = -5;
    private static final int ConstructorId_charCodeAt = -6;
    private static final int ConstructorId_indexOf = -7;
    private static final int ConstructorId_lastIndexOf = -8;
    private static final int ConstructorId_split = -9;
    private static final int ConstructorId_substring = -10;
    private static final int ConstructorId_toLowerCase = -11;
    private static final int ConstructorId_toUpperCase = -12;
    private static final int ConstructorId_substr = -13;
    private static final int ConstructorId_concat = -14;
    private static final int ConstructorId_slice = -15;
    private static final int ConstructorId_equalsIgnoreCase = -30;
    private static final int ConstructorId_match = -31;
    private static final int ConstructorId_search = -32;
    private static final int ConstructorId_replace = -33;
    private static final int ConstructorId_localeCompare = -34;
    private static final int ConstructorId_toLocaleLowerCase = -35;
    private CharSequence string;

    static void init(Scriptable scope, boolean sealed) {
        NativeString obj = new NativeString("");
        obj.exportAsJSClass(45, scope, sealed);
    }

    NativeString(CharSequence s) {
        this.string = s;
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public String getClassName() {
        return "String";
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected int getMaxInstanceId() {
        return 1;
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected int findInstanceIdInfo(String s) {
        if (s.equals("length")) {
            return instanceIdInfo(7, 1);
        }
        return super.findInstanceIdInfo(s);
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected String getInstanceIdName(int id) {
        return id == 1 ? "length" : super.getInstanceIdName(id);
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected Object getInstanceIdValue(int id) {
        if (id == 1) {
            return ScriptRuntime.wrapInt(this.string.length());
        }
        return super.getInstanceIdValue(id);
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected void fillConstructorProperties(IdFunctionObject ctor) {
        addIdFunctionProperty(ctor, STRING_TAG, -1, "fromCharCode", 1);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_charAt, "charAt", 2);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_charCodeAt, "charCodeAt", 2);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_indexOf, "indexOf", 2);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_lastIndexOf, "lastIndexOf", 2);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_split, "split", 3);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_substring, "substring", 3);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_toLowerCase, "toLowerCase", 1);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_toUpperCase, "toUpperCase", 1);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_substr, "substr", 3);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_concat, "concat", 2);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_slice, "slice", 3);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_equalsIgnoreCase, "equalsIgnoreCase", 2);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_match, "match", 2);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_search, "search", 2);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_replace, "replace", 2);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_localeCompare, "localeCompare", 2);
        addIdFunctionProperty(ctor, STRING_TAG, ConstructorId_toLocaleLowerCase, "toLocaleLowerCase", 1);
        super.fillConstructorProperties(ctor);
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected void initPrototypeId(int id) {
        int arity;
        String s;
        switch (id) {
            case 1:
                arity = 1;
                s = "constructor";
                break;
            case 2:
                arity = 0;
                s = "toString";
                break;
            case 3:
                arity = 0;
                s = "toSource";
                break;
            case 4:
                arity = 0;
                s = "valueOf";
                break;
            case 5:
                arity = 1;
                s = "charAt";
                break;
            case 6:
                arity = 1;
                s = "charCodeAt";
                break;
            case 7:
                arity = 1;
                s = "indexOf";
                break;
            case 8:
                arity = 1;
                s = "lastIndexOf";
                break;
            case 9:
                arity = 2;
                s = "split";
                break;
            case 10:
                arity = 2;
                s = "substring";
                break;
            case 11:
                arity = 0;
                s = "toLowerCase";
                break;
            case 12:
                arity = 0;
                s = "toUpperCase";
                break;
            case 13:
                arity = 2;
                s = "substr";
                break;
            case 14:
                arity = 1;
                s = "concat";
                break;
            case 15:
                arity = 2;
                s = "slice";
                break;
            case 16:
                arity = 0;
                s = "bold";
                break;
            case 17:
                arity = 0;
                s = "italics";
                break;
            case 18:
                arity = 0;
                s = "fixed";
                break;
            case 19:
                arity = 0;
                s = "strike";
                break;
            case 20:
                arity = 0;
                s = "small";
                break;
            case 21:
                arity = 0;
                s = "big";
                break;
            case 22:
                arity = 0;
                s = "blink";
                break;
            case 23:
                arity = 0;
                s = "sup";
                break;
            case 24:
                arity = 0;
                s = "sub";
                break;
            case 25:
                arity = 0;
                s = "fontsize";
                break;
            case 26:
                arity = 0;
                s = "fontcolor";
                break;
            case 27:
                arity = 0;
                s = "link";
                break;
            case 28:
                arity = 0;
                s = "anchor";
                break;
            case 29:
                arity = 1;
                s = "equals";
                break;
            case 30:
                arity = 1;
                s = "equalsIgnoreCase";
                break;
            case 31:
                arity = 1;
                s = "match";
                break;
            case 32:
                arity = 1;
                s = "search";
                break;
            case 33:
                arity = 2;
                s = "replace";
                break;
            case 34:
                arity = 1;
                s = "localeCompare";
                break;
            case 35:
                arity = 0;
                s = "toLocaleLowerCase";
                break;
            case 36:
                arity = 0;
                s = "toLocaleUpperCase";
                break;
            case 37:
                arity = 0;
                s = "trim";
                break;
            case 38:
                arity = 0;
                s = "trimLeft";
                break;
            case 39:
                arity = 0;
                s = "trimRight";
                break;
            case 40:
                arity = 1;
                s = "includes";
                break;
            case 41:
                arity = 1;
                s = "startsWith";
                break;
            case 42:
                arity = 1;
                s = "endsWith";
                break;
            case 43:
                arity = 0;
                s = "normalize";
                break;
            case 44:
                arity = 1;
                s = "repeat";
                break;
            case 45:
                arity = 1;
                s = "codePointAt";
                break;
            default:
                throw new IllegalArgumentException(String.valueOf(id));
        }
        initPrototypeMethod(STRING_TAG, id, s, arity);
    }

    /* JADX WARN: Code restructure failed: missing block: B:97:0x036c, code lost:
    
        return org.mozilla.javascript.ScriptRuntime.wrapInt(js_lastIndexOf(org.mozilla.javascript.ScriptRuntime.toString(r11), r12));
     */
    @Override // org.mozilla.javascript.IdScriptableObject, org.mozilla.javascript.IdFunctionCall
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object execIdCall(org.mozilla.javascript.IdFunctionObject r8, org.mozilla.javascript.Context r9, org.mozilla.javascript.Scriptable r10, org.mozilla.javascript.Scriptable r11, java.lang.Object[] r12) {
        /*
            Method dump skipped, instructions count: 1836
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.NativeString.execIdCall(org.mozilla.javascript.IdFunctionObject, org.mozilla.javascript.Context, org.mozilla.javascript.Scriptable, org.mozilla.javascript.Scriptable, java.lang.Object[]):java.lang.Object");
    }

    private static NativeString realThis(Scriptable thisObj, IdFunctionObject f) {
        if (!(thisObj instanceof NativeString)) {
            throw incompatibleCallError(f);
        }
        return (NativeString) thisObj;
    }

    private static String tagify(Object thisObj, String tag, String attribute, Object[] args) {
        String str = ScriptRuntime.toString(thisObj);
        StringBuilder result = new StringBuilder();
        result.append('<');
        result.append(tag);
        if (attribute != null) {
            result.append(' ');
            result.append(attribute);
            result.append("=\"");
            result.append(ScriptRuntime.toString(args, 0));
            result.append('\"');
        }
        result.append('>');
        result.append(str);
        result.append("</");
        result.append(tag);
        result.append('>');
        return result.toString();
    }

    public CharSequence toCharSequence() {
        return this.string;
    }

    public String toString() {
        return this.string instanceof String ? (String) this.string : this.string.toString();
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public Object get(int index, Scriptable start) {
        if (0 <= index && index < this.string.length()) {
            return String.valueOf(this.string.charAt(index));
        }
        return super.get(index, start);
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public void put(int index, Scriptable start, Object value) {
        if (0 <= index && index < this.string.length()) {
            return;
        }
        super.put(index, start, value);
    }

    private static int js_indexOf(int methodId, String target, Object[] args) {
        String searchStr = ScriptRuntime.toString(args, 0);
        double position = ScriptRuntime.toInteger(args, 1);
        if (position > target.length() && methodId != 41 && methodId != 42) {
            return -1;
        }
        if (position < 0.0d) {
            position = 0.0d;
        } else if (position > target.length()) {
            position = target.length();
        } else if (methodId == 42 && (position != position || position > target.length())) {
            position = target.length();
        }
        if (42 != methodId) {
            return methodId == 41 ? target.startsWith(searchStr, (int) position) ? 0 : -1 : target.indexOf(searchStr, (int) position);
        }
        if (args.length == 0 || args.length == 1 || (args.length == 2 && args[1] == Undefined.instance)) {
            position = target.length();
        }
        return target.substring(0, (int) position).endsWith(searchStr) ? 0 : -1;
    }

    private static int js_lastIndexOf(String target, Object[] args) {
        String search = ScriptRuntime.toString(args, 0);
        double end = ScriptRuntime.toNumber(args, 1);
        if (end != end || end > target.length()) {
            end = target.length();
        } else if (end < 0.0d) {
            end = 0.0d;
        }
        return target.lastIndexOf(search, (int) end);
    }

    private static CharSequence js_substring(Context cx, CharSequence target, Object[] args) {
        double end;
        int length = target.length();
        double start = ScriptRuntime.toInteger(args, 0);
        if (start < 0.0d) {
            start = 0.0d;
        } else if (start > length) {
            start = length;
        }
        if (args.length <= 1 || args[1] == Undefined.instance) {
            end = length;
        } else {
            end = ScriptRuntime.toInteger(args[1]);
            if (end < 0.0d) {
                end = 0.0d;
            } else if (end > length) {
                end = length;
            }
            if (end < start) {
                if (cx.getLanguageVersion() != 120) {
                    double temp = start;
                    start = end;
                    end = temp;
                } else {
                    end = start;
                }
            }
        }
        return target.subSequence((int) start, (int) end);
    }

    int getLength() {
        return this.string.length();
    }

    private static CharSequence js_substr(CharSequence target, Object[] args) {
        double end;
        if (args.length < 1) {
            return target;
        }
        double begin = ScriptRuntime.toInteger(args[0]);
        int length = target.length();
        if (begin < 0.0d) {
            begin += length;
            if (begin < 0.0d) {
                begin = 0.0d;
            }
        } else if (begin > length) {
            begin = length;
        }
        if (args.length == 1) {
            end = length;
        } else {
            double end2 = ScriptRuntime.toInteger(args[1]);
            if (end2 < 0.0d) {
                end2 = 0.0d;
            }
            end = end2 + begin;
            if (end > length) {
                end = length;
            }
        }
        return target.subSequence((int) begin, (int) end);
    }

    private static String js_concat(String target, Object[] args) {
        int N = args.length;
        if (N == 0) {
            return target;
        }
        if (N == 1) {
            String arg = ScriptRuntime.toString(args[0]);
            return target.concat(arg);
        }
        int size = target.length();
        String[] argsAsStrings = new String[N];
        for (int i = 0; i != N; i++) {
            String s = ScriptRuntime.toString(args[i]);
            argsAsStrings[i] = s;
            size += s.length();
        }
        StringBuilder result = new StringBuilder(size);
        result.append(target);
        for (int i2 = 0; i2 != N; i2++) {
            result.append(argsAsStrings[i2]);
        }
        return result.toString();
    }

    private static CharSequence js_slice(CharSequence target, Object[] args) {
        double end;
        double begin = args.length < 1 ? 0.0d : ScriptRuntime.toInteger(args[0]);
        int length = target.length();
        if (begin < 0.0d) {
            begin += length;
            if (begin < 0.0d) {
                begin = 0.0d;
            }
        } else if (begin > length) {
            begin = length;
        }
        if (args.length < 2 || args[1] == Undefined.instance) {
            end = length;
        } else {
            end = ScriptRuntime.toInteger(args[1]);
            if (end < 0.0d) {
                end += length;
                if (end < 0.0d) {
                    end = 0.0d;
                }
            } else if (end > length) {
                end = length;
            }
            if (end < begin) {
                end = begin;
            }
        }
        return target.subSequence((int) begin, (int) end);
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:200)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.processFallThroughCases(SwitchRegionMaker.java:105)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:103:0x0429 A[PHI: r5 r6
      0x0429: PHI (r5v1 'id' int) = 
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v3 'id' int)
      (r5v4 'id' int)
      (r5v5 'id' int)
      (r5v6 'id' int)
      (r5v0 'id' int)
      (r5v7 'id' int)
      (r5v8 'id' int)
      (r5v9 'id' int)
      (r5v10 'id' int)
      (r5v11 'id' int)
      (r5v0 'id' int)
      (r5v12 'id' int)
      (r5v13 'id' int)
      (r5v0 'id' int)
      (r5v14 'id' int)
      (r5v15 'id' int)
      (r5v16 'id' int)
      (r5v17 'id' int)
      (r5v0 'id' int)
      (r5v18 'id' int)
      (r5v19 'id' int)
      (r5v20 'id' int)
      (r5v21 'id' int)
      (r5v22 'id' int)
      (r5v23 'id' int)
      (r5v0 'id' int)
      (r5v24 'id' int)
      (r5v25 'id' int)
      (r5v26 'id' int)
      (r5v27 'id' int)
      (r5v0 'id' int)
      (r5v28 'id' int)
      (r5v29 'id' int)
      (r5v30 'id' int)
      (r5v31 'id' int)
      (r5v32 'id' int)
      (r5v33 'id' int)
      (r5v0 'id' int)
      (r5v34 'id' int)
      (r5v35 'id' int)
      (r5v0 'id' int)
      (r5v36 'id' int)
      (r5v37 'id' int)
      (r5v38 'id' int)
      (r5v39 'id' int)
      (r5v40 'id' int)
      (r5v41 'id' int)
      (r5v0 'id' int)
      (r5v42 'id' int)
      (r5v43 'id' int)
      (r5v44 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
     binds: [B:3:0x0008, B:101:0x041d, B:102:0x0420, B:99:0x0410, B:96:0x03f8, B:95:0x03ef, B:88:0x038f, B:93:0x03e3, B:92:0x03db, B:91:0x03d2, B:90:0x03c9, B:89:0x03c0, B:85:0x037e, B:86:0x0381, B:83:0x0371, B:75:0x0310, B:79:0x0357, B:78:0x034e, B:77:0x0345, B:76:0x033c, B:66:0x0298, B:72:0x02ff, B:71:0x02f6, B:70:0x02ee, B:69:0x02e5, B:68:0x02dc, B:67:0x02d4, B:59:0x0240, B:63:0x0286, B:62:0x027d, B:61:0x0274, B:60:0x026c, B:44:0x018a, B:56:0x022f, B:55:0x0226, B:54:0x021d, B:53:0x0214, B:52:0x020b, B:51:0x0203, B:49:0x01f7, B:50:0x01fa, B:47:0x01ea, B:35:0x00fa, B:41:0x0179, B:40:0x0170, B:39:0x0167, B:38:0x015e, B:37:0x0155, B:36:0x014c, B:32:0x00e9, B:33:0x00ec, B:30:0x00dc, B:27:0x00cc, B:19:0x00a1, B:21:0x00ab, B:23:0x00b5, B:14:0x008a, B:16:0x0094, B:7:0x0069, B:9:0x0073] A[DONT_GENERATE, DONT_INLINE]
      0x0429: PHI (r6v1 'X' java.lang.String) = 
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v2 'X' java.lang.String)
      (r6v3 'X' java.lang.String)
      (r6v4 'X' java.lang.String)
      (r6v5 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v6 'X' java.lang.String)
      (r6v7 'X' java.lang.String)
      (r6v8 'X' java.lang.String)
      (r6v9 'X' java.lang.String)
      (r6v10 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v11 'X' java.lang.String)
      (r6v12 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v13 'X' java.lang.String)
      (r6v14 'X' java.lang.String)
      (r6v15 'X' java.lang.String)
      (r6v16 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v17 'X' java.lang.String)
      (r6v18 'X' java.lang.String)
      (r6v19 'X' java.lang.String)
      (r6v20 'X' java.lang.String)
      (r6v21 'X' java.lang.String)
      (r6v22 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v23 'X' java.lang.String)
      (r6v24 'X' java.lang.String)
      (r6v25 'X' java.lang.String)
      (r6v26 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v27 'X' java.lang.String)
      (r6v28 'X' java.lang.String)
      (r6v29 'X' java.lang.String)
      (r6v30 'X' java.lang.String)
      (r6v31 'X' java.lang.String)
      (r6v32 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v33 'X' java.lang.String)
      (r6v34 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v35 'X' java.lang.String)
      (r6v36 'X' java.lang.String)
      (r6v37 'X' java.lang.String)
      (r6v38 'X' java.lang.String)
      (r6v39 'X' java.lang.String)
      (r6v40 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v41 'X' java.lang.String)
      (r6v42 'X' java.lang.String)
      (r6v43 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
     binds: [B:3:0x0008, B:101:0x041d, B:102:0x0420, B:99:0x0410, B:96:0x03f8, B:95:0x03ef, B:88:0x038f, B:93:0x03e3, B:92:0x03db, B:91:0x03d2, B:90:0x03c9, B:89:0x03c0, B:85:0x037e, B:86:0x0381, B:83:0x0371, B:75:0x0310, B:79:0x0357, B:78:0x034e, B:77:0x0345, B:76:0x033c, B:66:0x0298, B:72:0x02ff, B:71:0x02f6, B:70:0x02ee, B:69:0x02e5, B:68:0x02dc, B:67:0x02d4, B:59:0x0240, B:63:0x0286, B:62:0x027d, B:61:0x0274, B:60:0x026c, B:44:0x018a, B:56:0x022f, B:55:0x0226, B:54:0x021d, B:53:0x0214, B:52:0x020b, B:51:0x0203, B:49:0x01f7, B:50:0x01fa, B:47:0x01ea, B:35:0x00fa, B:41:0x0179, B:40:0x0170, B:39:0x0167, B:38:0x015e, B:37:0x0155, B:36:0x014c, B:32:0x00e9, B:33:0x00ec, B:30:0x00dc, B:27:0x00cc, B:19:0x00a1, B:21:0x00ab, B:23:0x00b5, B:14:0x008a, B:16:0x0094, B:7:0x0069, B:9:0x0073] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // org.mozilla.javascript.IdScriptableObject
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected int findPrototypeId(java.lang.String r4) {
        /*
            Method dump skipped, instructions count: 1089
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.NativeString.findPrototypeId(java.lang.String):int");
    }
}
