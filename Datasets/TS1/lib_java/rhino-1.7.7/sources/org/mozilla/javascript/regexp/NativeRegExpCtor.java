package org.mozilla.javascript.regexp;

import org.mozilla.javascript.BaseFunction;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.ScriptRuntime;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.TopLevel;
import org.mozilla.javascript.Undefined;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/regexp/NativeRegExpCtor.class */
class NativeRegExpCtor extends BaseFunction {
    static final long serialVersionUID = -5733330028285400526L;
    private static final int Id_multiline = 1;
    private static final int Id_STAR = 2;
    private static final int Id_input = 3;
    private static final int Id_UNDERSCORE = 4;
    private static final int Id_lastMatch = 5;
    private static final int Id_AMPERSAND = 6;
    private static final int Id_lastParen = 7;
    private static final int Id_PLUS = 8;
    private static final int Id_leftContext = 9;
    private static final int Id_BACK_QUOTE = 10;
    private static final int Id_rightContext = 11;
    private static final int Id_QUOTE = 12;
    private static final int DOLLAR_ID_BASE = 12;
    private static final int Id_DOLLAR_1 = 13;
    private static final int Id_DOLLAR_2 = 14;
    private static final int Id_DOLLAR_3 = 15;
    private static final int Id_DOLLAR_4 = 16;
    private static final int Id_DOLLAR_5 = 17;
    private static final int Id_DOLLAR_6 = 18;
    private static final int Id_DOLLAR_7 = 19;
    private static final int Id_DOLLAR_8 = 20;
    private static final int Id_DOLLAR_9 = 21;
    private static final int MAX_INSTANCE_ID = 21;
    private int multilineAttr = 4;
    private int starAttr = 4;
    private int inputAttr = 4;
    private int underscoreAttr = 4;

    NativeRegExpCtor() {
    }

    @Override // org.mozilla.javascript.BaseFunction
    public String getFunctionName() {
        return "RegExp";
    }

    @Override // org.mozilla.javascript.BaseFunction
    public int getLength() {
        return 2;
    }

    @Override // org.mozilla.javascript.BaseFunction
    public int getArity() {
        return 2;
    }

    @Override // org.mozilla.javascript.BaseFunction, org.mozilla.javascript.Function, org.mozilla.javascript.Callable
    public Object call(Context cx, Scriptable scope, Scriptable thisObj, Object[] args) {
        if (args.length > 0 && (args[0] instanceof NativeRegExp) && (args.length == 1 || args[1] == Undefined.instance)) {
            return args[0];
        }
        return construct(cx, scope, args);
    }

    @Override // org.mozilla.javascript.BaseFunction, org.mozilla.javascript.Function
    public Scriptable construct(Context cx, Scriptable scope, Object[] args) {
        NativeRegExp re = new NativeRegExp();
        re.compile(cx, scope, args);
        ScriptRuntime.setBuiltinProtoAndParent(re, scope, TopLevel.Builtins.RegExp);
        return re;
    }

    private static RegExpImpl getImpl() {
        Context cx = Context.getCurrentContext();
        return (RegExpImpl) ScriptRuntime.getRegExpProxy(cx);
    }

    @Override // org.mozilla.javascript.BaseFunction, org.mozilla.javascript.IdScriptableObject
    protected int getMaxInstanceId() {
        return super.getMaxInstanceId() + 21;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0284 A[PHI: r6 r7
      0x0284: PHI (r6v1 'id' int) = 
      (r6v0 'id' int)
      (r6v3 'id' int)
      (r6v4 'id' int)
      (r6v0 'id' int)
      (r6v5 'id' int)
      (r6v6 'id' int)
      (r6v7 'id' int)
      (r6v8 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
      (r6v0 'id' int)
     binds: [B:3:0x0008, B:63:0x027b, B:62:0x0272, B:60:0x0267, B:61:0x026a, B:58:0x025a, B:55:0x024b, B:52:0x0235, B:5:0x0049, B:49:0x0229, B:46:0x021a, B:43:0x020a, B:40:0x01fa, B:37:0x01ea, B:34:0x01da, B:31:0x01ca, B:28:0x01ba, B:25:0x01aa, B:22:0x019a, B:19:0x018a, B:16:0x017a, B:13:0x016b, B:10:0x015b, B:7:0x014b] A[DONT_GENERATE, DONT_INLINE]
      0x0284: PHI (r7v1 'X' java.lang.String) = 
      (r7v0 'X' java.lang.String)
      (r7v2 'X' java.lang.String)
      (r7v3 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v4 'X' java.lang.String)
      (r7v5 'X' java.lang.String)
      (r7v6 'X' java.lang.String)
      (r7v7 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
      (r7v0 'X' java.lang.String)
     binds: [B:3:0x0008, B:63:0x027b, B:62:0x0272, B:60:0x0267, B:61:0x026a, B:58:0x025a, B:55:0x024b, B:52:0x0235, B:5:0x0049, B:49:0x0229, B:46:0x021a, B:43:0x020a, B:40:0x01fa, B:37:0x01ea, B:34:0x01da, B:31:0x01ca, B:28:0x01ba, B:25:0x01aa, B:22:0x019a, B:19:0x018a, B:16:0x017a, B:13:0x016b, B:10:0x015b, B:7:0x014b] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0288  */
    @Override // org.mozilla.javascript.BaseFunction, org.mozilla.javascript.IdScriptableObject
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected int findInstanceIdInfo(java.lang.String r5) {
        /*
            Method dump skipped, instructions count: 749
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.regexp.NativeRegExpCtor.findInstanceIdInfo(java.lang.String):int");
    }

    @Override // org.mozilla.javascript.BaseFunction, org.mozilla.javascript.IdScriptableObject
    protected String getInstanceIdName(int id) {
        int shifted = id - super.getMaxInstanceId();
        if (1 <= shifted && shifted <= 21) {
            switch (shifted) {
                case 1:
                    return "multiline";
                case 2:
                    return "$*";
                case 3:
                    return "input";
                case 4:
                    return "$_";
                case 5:
                    return "lastMatch";
                case 6:
                    return "$&";
                case 7:
                    return "lastParen";
                case 8:
                    return "$+";
                case 9:
                    return "leftContext";
                case 10:
                    return "$`";
                case 11:
                    return "rightContext";
                case 12:
                    return "$'";
                default:
                    int substring_number = (shifted - 12) - 1;
                    char[] buf = {'$', (char) (49 + substring_number)};
                    return new String(buf);
            }
        }
        return super.getInstanceIdName(id);
    }

    @Override // org.mozilla.javascript.BaseFunction, org.mozilla.javascript.IdScriptableObject
    protected Object getInstanceIdValue(int id) {
        Object stringResult;
        int shifted = id - super.getMaxInstanceId();
        if (1 <= shifted && shifted <= 21) {
            RegExpImpl impl = getImpl();
            switch (shifted) {
                case 1:
                case 2:
                    return ScriptRuntime.wrapBoolean(impl.multiline);
                case 3:
                case 4:
                    stringResult = impl.input;
                    break;
                case 5:
                case 6:
                    stringResult = impl.lastMatch;
                    break;
                case 7:
                case 8:
                    stringResult = impl.lastParen;
                    break;
                case 9:
                case 10:
                    stringResult = impl.leftContext;
                    break;
                case 11:
                case 12:
                    stringResult = impl.rightContext;
                    break;
                default:
                    int substring_number = (shifted - 12) - 1;
                    stringResult = impl.getParenSubString(substring_number);
                    break;
            }
            return stringResult == null ? "" : stringResult.toString();
        }
        return super.getInstanceIdValue(id);
    }

    @Override // org.mozilla.javascript.BaseFunction, org.mozilla.javascript.IdScriptableObject
    protected void setInstanceIdValue(int id, Object value) {
        int shifted = id - super.getMaxInstanceId();
        switch (shifted) {
            case 1:
            case 2:
                getImpl().multiline = ScriptRuntime.toBoolean(value);
                break;
            case 3:
            case 4:
                getImpl().input = ScriptRuntime.toString(value);
                break;
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
                break;
            default:
                int substring_number = (shifted - 12) - 1;
                if (0 > substring_number || substring_number > 8) {
                    super.setInstanceIdValue(id, value);
                    break;
                }
                break;
        }
    }

    @Override // org.mozilla.javascript.BaseFunction, org.mozilla.javascript.IdScriptableObject
    protected void setInstanceIdAttributes(int id, int attr) {
        int shifted = id - super.getMaxInstanceId();
        switch (shifted) {
            case 1:
                this.multilineAttr = attr;
                break;
            case 2:
                this.starAttr = attr;
                break;
            case 3:
                this.inputAttr = attr;
                break;
            case 4:
                this.underscoreAttr = attr;
                break;
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
                break;
            default:
                int substring_number = (shifted - 12) - 1;
                if (0 > substring_number || substring_number > 8) {
                    super.setInstanceIdAttributes(id, attr);
                    break;
                }
                break;
        }
    }
}
