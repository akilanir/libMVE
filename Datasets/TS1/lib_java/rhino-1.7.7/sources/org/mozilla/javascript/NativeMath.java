package org.mozilla.javascript;

import org.mozilla.javascript.typedarrays.Conversions;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/NativeMath.class */
final class NativeMath extends IdScriptableObject {
    static final long serialVersionUID = -8838847185801131569L;
    private static final Object MATH_TAG = "Math";
    private static final int Id_toSource = 1;
    private static final int Id_abs = 2;
    private static final int Id_acos = 3;
    private static final int Id_asin = 4;
    private static final int Id_atan = 5;
    private static final int Id_atan2 = 6;
    private static final int Id_ceil = 7;
    private static final int Id_cos = 8;
    private static final int Id_exp = 9;
    private static final int Id_floor = 10;
    private static final int Id_log = 11;
    private static final int Id_max = 12;
    private static final int Id_min = 13;
    private static final int Id_pow = 14;
    private static final int Id_random = 15;
    private static final int Id_round = 16;
    private static final int Id_sin = 17;
    private static final int Id_sqrt = 18;
    private static final int Id_tan = 19;
    private static final int Id_cbrt = 20;
    private static final int Id_cosh = 21;
    private static final int Id_expm1 = 22;
    private static final int Id_hypot = 23;
    private static final int Id_log1p = 24;
    private static final int Id_log10 = 25;
    private static final int Id_sinh = 26;
    private static final int Id_tanh = 27;
    private static final int Id_imul = 28;
    private static final int Id_trunc = 29;
    private static final int LAST_METHOD_ID = 29;
    private static final int Id_E = 30;
    private static final int Id_PI = 31;
    private static final int Id_LN10 = 32;
    private static final int Id_LN2 = 33;
    private static final int Id_LOG2E = 34;
    private static final int Id_LOG10E = 35;
    private static final int Id_SQRT1_2 = 36;
    private static final int Id_SQRT2 = 37;
    private static final int MAX_ID = 37;

    static void init(Scriptable scope, boolean sealed) {
        NativeMath obj = new NativeMath();
        obj.activatePrototypeMap(37);
        obj.setPrototype(getObjectPrototype(scope));
        obj.setParentScope(scope);
        if (sealed) {
            obj.sealObject();
        }
        ScriptableObject.defineProperty(scope, "Math", obj, 2);
    }

    private NativeMath() {
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public String getClassName() {
        return "Math";
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected void initPrototypeId(int id) {
        double x;
        String name;
        int arity;
        String name2;
        if (id <= 29) {
            switch (id) {
                case 1:
                    arity = 0;
                    name2 = "toSource";
                    break;
                case 2:
                    arity = 1;
                    name2 = "abs";
                    break;
                case 3:
                    arity = 1;
                    name2 = "acos";
                    break;
                case 4:
                    arity = 1;
                    name2 = "asin";
                    break;
                case 5:
                    arity = 1;
                    name2 = "atan";
                    break;
                case 6:
                    arity = 2;
                    name2 = "atan2";
                    break;
                case 7:
                    arity = 1;
                    name2 = "ceil";
                    break;
                case 8:
                    arity = 1;
                    name2 = "cos";
                    break;
                case 9:
                    arity = 1;
                    name2 = "exp";
                    break;
                case 10:
                    arity = 1;
                    name2 = "floor";
                    break;
                case 11:
                    arity = 1;
                    name2 = "log";
                    break;
                case 12:
                    arity = 2;
                    name2 = "max";
                    break;
                case 13:
                    arity = 2;
                    name2 = "min";
                    break;
                case 14:
                    arity = 2;
                    name2 = "pow";
                    break;
                case 15:
                    arity = 0;
                    name2 = "random";
                    break;
                case 16:
                    arity = 1;
                    name2 = "round";
                    break;
                case 17:
                    arity = 1;
                    name2 = "sin";
                    break;
                case 18:
                    arity = 1;
                    name2 = "sqrt";
                    break;
                case 19:
                    arity = 1;
                    name2 = "tan";
                    break;
                case 20:
                    arity = 1;
                    name2 = "cbrt";
                    break;
                case 21:
                    arity = 1;
                    name2 = "cosh";
                    break;
                case 22:
                    arity = 1;
                    name2 = "expm1";
                    break;
                case 23:
                    arity = 2;
                    name2 = "hypot";
                    break;
                case 24:
                    arity = 1;
                    name2 = "log1p";
                    break;
                case 25:
                    arity = 1;
                    name2 = "log10";
                    break;
                case 26:
                    arity = 1;
                    name2 = "sinh";
                    break;
                case 27:
                    arity = 1;
                    name2 = "tanh";
                    break;
                case 28:
                    arity = 2;
                    name2 = "imul";
                    break;
                case 29:
                    arity = 1;
                    name2 = "trunc";
                    break;
                default:
                    throw new IllegalStateException(String.valueOf(id));
            }
            initPrototypeMethod(MATH_TAG, id, name2, arity);
            return;
        }
        switch (id) {
            case 30:
                x = 2.718281828459045d;
                name = "E";
                break;
            case 31:
                x = 3.141592653589793d;
                name = "PI";
                break;
            case 32:
                x = 2.302585092994046d;
                name = "LN10";
                break;
            case 33:
                x = 0.6931471805599453d;
                name = "LN2";
                break;
            case 34:
                x = 1.4426950408889634d;
                name = "LOG2E";
                break;
            case 35:
                x = 0.4342944819032518d;
                name = "LOG10E";
                break;
            case 36:
                x = 0.7071067811865476d;
                name = "SQRT1_2";
                break;
            case 37:
                x = 1.4142135623730951d;
                name = "SQRT2";
                break;
            default:
                throw new IllegalStateException(String.valueOf(id));
        }
        initPrototypeValue(id, name, ScriptRuntime.wrapNumber(x), 7);
    }

    @Override // org.mozilla.javascript.IdScriptableObject, org.mozilla.javascript.IdFunctionCall
    public Object execIdCall(IdFunctionObject f, Context cx, Scriptable scope, Scriptable thisObj, Object[] args) {
        double x;
        double min;
        if (!f.hasTag(MATH_TAG)) {
            return super.execIdCall(f, cx, scope, thisObj, args);
        }
        int methodId = f.methodId();
        switch (methodId) {
            case 1:
                return "Math";
            case 2:
                double x2 = ScriptRuntime.toNumber(args, 0);
                x = x2 == 0.0d ? 0.0d : x2 < 0.0d ? -x2 : x2;
                break;
            case 3:
            case 4:
                double x3 = ScriptRuntime.toNumber(args, 0);
                if (x3 == x3 && -1.0d <= x3 && x3 <= 1.0d) {
                    x = methodId == 3 ? Math.acos(x3) : Math.asin(x3);
                    break;
                } else {
                    x = Double.NaN;
                    break;
                }
                break;
            case 5:
                double x4 = ScriptRuntime.toNumber(args, 0);
                x = Math.atan(x4);
                break;
            case 6:
                double x5 = ScriptRuntime.toNumber(args, 0);
                x = Math.atan2(x5, ScriptRuntime.toNumber(args, 1));
                break;
            case 7:
                double x6 = ScriptRuntime.toNumber(args, 0);
                x = Math.ceil(x6);
                break;
            case 8:
                double x7 = ScriptRuntime.toNumber(args, 0);
                x = (x7 == Double.POSITIVE_INFINITY || x7 == Double.NEGATIVE_INFINITY) ? Double.NaN : Math.cos(x7);
                break;
            case 9:
                double x8 = ScriptRuntime.toNumber(args, 0);
                x = x8 == Double.POSITIVE_INFINITY ? x8 : x8 == Double.NEGATIVE_INFINITY ? 0.0d : Math.exp(x8);
                break;
            case 10:
                double x9 = ScriptRuntime.toNumber(args, 0);
                x = Math.floor(x9);
                break;
            case 11:
                double x10 = ScriptRuntime.toNumber(args, 0);
                x = x10 < 0.0d ? Double.NaN : Math.log(x10);
                break;
            case 12:
            case 13:
                x = methodId == 12 ? Double.NEGATIVE_INFINITY : Double.POSITIVE_INFINITY;
                int i = 0;
                while (true) {
                    if (i == args.length) {
                        break;
                    } else {
                        double d = ScriptRuntime.toNumber(args[i]);
                        if (d != d) {
                            x = d;
                            break;
                        } else {
                            if (methodId == 12) {
                                min = Math.max(x, d);
                            } else {
                                min = Math.min(x, d);
                            }
                            x = min;
                            i++;
                        }
                    }
                }
            case 14:
                double x11 = ScriptRuntime.toNumber(args, 0);
                x = js_pow(x11, ScriptRuntime.toNumber(args, 1));
                break;
            case 15:
                x = Math.random();
                break;
            case 16:
                x = ScriptRuntime.toNumber(args, 0);
                if (x == x && x != Double.POSITIVE_INFINITY && x != Double.NEGATIVE_INFINITY) {
                    long l = Math.round(x);
                    if (l == 0) {
                        if (x >= 0.0d) {
                            if (x != 0.0d) {
                                x = 0.0d;
                                break;
                            }
                        } else {
                            x = ScriptRuntime.negativeZero;
                            break;
                        }
                    } else {
                        x = l;
                        break;
                    }
                }
                break;
            case 17:
                double x12 = ScriptRuntime.toNumber(args, 0);
                x = (x12 == Double.POSITIVE_INFINITY || x12 == Double.NEGATIVE_INFINITY) ? Double.NaN : Math.sin(x12);
                break;
            case 18:
                double x13 = ScriptRuntime.toNumber(args, 0);
                x = Math.sqrt(x13);
                break;
            case 19:
                double x14 = ScriptRuntime.toNumber(args, 0);
                x = Math.tan(x14);
                break;
            case 20:
                double x15 = ScriptRuntime.toNumber(args, 0);
                x = Math.cbrt(x15);
                break;
            case 21:
                double x16 = ScriptRuntime.toNumber(args, 0);
                x = Math.cosh(x16);
                break;
            case 22:
                double x17 = ScriptRuntime.toNumber(args, 0);
                x = Math.expm1(x17);
                break;
            case 23:
                x = js_hypot(args);
                break;
            case 24:
                double x18 = ScriptRuntime.toNumber(args, 0);
                x = Math.log1p(x18);
                break;
            case 25:
                double x19 = ScriptRuntime.toNumber(args, 0);
                x = Math.log10(x19);
                break;
            case 26:
                double x20 = ScriptRuntime.toNumber(args, 0);
                x = Math.sinh(x20);
                break;
            case 27:
                double x21 = ScriptRuntime.toNumber(args, 0);
                x = Math.tanh(x21);
                break;
            case 28:
                return js_imul(args);
            case 29:
                double x22 = ScriptRuntime.toNumber(args, 0);
                x = js_trunc(x22);
                break;
            default:
                throw new IllegalStateException(String.valueOf(methodId));
        }
        return ScriptRuntime.wrapNumber(x);
    }

    private double js_pow(double x, double y) {
        double result;
        if (y != y) {
            result = y;
        } else if (y == 0.0d) {
            result = 1.0d;
        } else if (x != 0.0d) {
            result = Math.pow(x, y);
            if (result != result) {
                if (y == Double.POSITIVE_INFINITY) {
                    if (x < -1.0d || 1.0d < x) {
                        result = Double.POSITIVE_INFINITY;
                    } else if (-1.0d < x && x < 1.0d) {
                        result = 0.0d;
                    }
                } else if (y == Double.NEGATIVE_INFINITY) {
                    if (x < -1.0d || 1.0d < x) {
                        result = 0.0d;
                    } else if (-1.0d < x && x < 1.0d) {
                        result = Double.POSITIVE_INFINITY;
                    }
                } else if (x == Double.POSITIVE_INFINITY) {
                    result = y > 0.0d ? Double.POSITIVE_INFINITY : 0.0d;
                } else if (x == Double.NEGATIVE_INFINITY) {
                    long y_long = (long) y;
                    if (y_long != y || (y_long & 1) == 0) {
                        result = y > 0.0d ? Double.POSITIVE_INFINITY : 0.0d;
                    } else {
                        result = y > 0.0d ? Double.NEGATIVE_INFINITY : -0.0d;
                    }
                }
            }
        } else if (1.0d / x > 0.0d) {
            result = y > 0.0d ? 0.0d : Double.POSITIVE_INFINITY;
        } else {
            long y_long2 = (long) y;
            if (y_long2 != y || (y_long2 & 1) == 0) {
                result = y > 0.0d ? 0.0d : Double.POSITIVE_INFINITY;
            } else {
                result = y > 0.0d ? -0.0d : Double.NEGATIVE_INFINITY;
            }
        }
        return result;
    }

    private double js_hypot(Object[] args) {
        if (args == null) {
            return 0.0d;
        }
        double y = 0.0d;
        for (Object o : args) {
            double d = ScriptRuntime.toNumber(o);
            if (d == ScriptRuntime.NaN) {
                return d;
            }
            if (d == Double.POSITIVE_INFINITY || d == Double.NEGATIVE_INFINITY) {
                return Double.POSITIVE_INFINITY;
            }
            y += d * d;
        }
        return Math.sqrt(y);
    }

    private double js_trunc(double d) {
        return d < 0.0d ? Math.ceil(d) : Math.floor(d);
    }

    private Object js_imul(Object[] args) {
        if (args == null || args.length < 2) {
            return ScriptRuntime.wrapNumber(ScriptRuntime.NaN);
        }
        long x = Conversions.toUint32(args[0]);
        long y = Conversions.toUint32(args[1]);
        long product = (x * y) % Conversions.THIRTYTWO_BIT;
        long result = product >= 2147483648L ? product - Conversions.THIRTYTWO_BIT : product;
        return Double.valueOf(ScriptRuntime.toNumber(Long.valueOf(result)));
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
    /* JADX WARN: Removed duplicated region for block: B:104:0x03d6 A[PHI: r5 r6
      0x03d6: PHI (r5v1 'id' int) = 
      (r5v0 'id' int)
      (r5v3 'id' int)
      (r5v4 'id' int)
      (r5v0 'id' int)
      (r5v5 'id' int)
      (r5v6 'id' int)
      (r5v0 'id' int)
      (r5v7 'id' int)
      (r5v8 'id' int)
      (r5v0 'id' int)
      (r5v9 'id' int)
      (r5v10 'id' int)
      (r5v11 'id' int)
      (r5v12 'id' int)
      (r5v13 'id' int)
      (r5v14 'id' int)
      (r5v15 'id' int)
      (r5v16 'id' int)
      (r5v0 'id' int)
      (r5v17 'id' int)
      (r5v18 'id' int)
      (r5v19 'id' int)
      (r5v20 'id' int)
      (r5v21 'id' int)
      (r5v22 'id' int)
      (r5v23 'id' int)
      (r5v24 'id' int)
      (r5v25 'id' int)
      (r5v26 'id' int)
      (r5v27 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
     binds: [B:3:0x0008, B:103:0x03ce, B:102:0x03c5, B:100:0x03b9, B:101:0x03bc, B:98:0x03ac, B:80:0x02d8, B:94:0x0392, B:93:0x0389, B:91:0x037d, B:92:0x0380, B:89:0x0370, B:86:0x0359, B:85:0x0350, B:84:0x0347, B:83:0x033e, B:82:0x0335, B:81:0x032c, B:66:0x01c4, B:77:0x02c8, B:76:0x02c0, B:75:0x02b7, B:74:0x02ae, B:73:0x02a5, B:72:0x029c, B:71:0x0293, B:70:0x028b, B:69:0x0282, B:68:0x0279, B:67:0x0270, B:13:0x0067, B:60:0x01a9, B:62:0x01b3, B:55:0x018f, B:57:0x0199, B:50:0x0175, B:52:0x017f, B:45:0x015b, B:47:0x0165, B:42:0x014e, B:35:0x0126, B:37:0x0130, B:30:0x010c, B:32:0x0116, B:25:0x00f2, B:27:0x00fc, B:20:0x00d9, B:22:0x00e3, B:15:0x00bf, B:17:0x00c9, B:8:0x004f, B:10:0x0059, B:5:0x003f] A[DONT_GENERATE, DONT_INLINE]
      0x03d6: PHI (r6v1 'X' java.lang.String) = 
      (r6v0 'X' java.lang.String)
      (r6v2 'X' java.lang.String)
      (r6v3 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v4 'X' java.lang.String)
      (r6v5 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v6 'X' java.lang.String)
      (r6v7 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v8 'X' java.lang.String)
      (r6v9 'X' java.lang.String)
      (r6v10 'X' java.lang.String)
      (r6v11 'X' java.lang.String)
      (r6v12 'X' java.lang.String)
      (r6v13 'X' java.lang.String)
      (r6v14 'X' java.lang.String)
      (r6v15 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v16 'X' java.lang.String)
      (r6v17 'X' java.lang.String)
      (r6v18 'X' java.lang.String)
      (r6v19 'X' java.lang.String)
      (r6v20 'X' java.lang.String)
      (r6v21 'X' java.lang.String)
      (r6v22 'X' java.lang.String)
      (r6v23 'X' java.lang.String)
      (r6v24 'X' java.lang.String)
      (r6v25 'X' java.lang.String)
      (r6v26 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
     binds: [B:3:0x0008, B:103:0x03ce, B:102:0x03c5, B:100:0x03b9, B:101:0x03bc, B:98:0x03ac, B:80:0x02d8, B:94:0x0392, B:93:0x0389, B:91:0x037d, B:92:0x0380, B:89:0x0370, B:86:0x0359, B:85:0x0350, B:84:0x0347, B:83:0x033e, B:82:0x0335, B:81:0x032c, B:66:0x01c4, B:77:0x02c8, B:76:0x02c0, B:75:0x02b7, B:74:0x02ae, B:73:0x02a5, B:72:0x029c, B:71:0x0293, B:70:0x028b, B:69:0x0282, B:68:0x0279, B:67:0x0270, B:13:0x0067, B:60:0x01a9, B:62:0x01b3, B:55:0x018f, B:57:0x0199, B:50:0x0175, B:52:0x017f, B:45:0x015b, B:47:0x0165, B:42:0x014e, B:35:0x0126, B:37:0x0130, B:30:0x010c, B:32:0x0116, B:25:0x00f2, B:27:0x00fc, B:20:0x00d9, B:22:0x00e3, B:15:0x00bf, B:17:0x00c9, B:8:0x004f, B:10:0x0059, B:5:0x003f] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // org.mozilla.javascript.IdScriptableObject
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected int findPrototypeId(java.lang.String r4) {
        /*
            Method dump skipped, instructions count: 1006
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.NativeMath.findPrototypeId(java.lang.String):int");
    }
}
