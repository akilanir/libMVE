package org.mozilla.javascript;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import java.util.Set;
import org.mozilla.javascript.TopLevel;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/NativeArray.class */
public class NativeArray extends IdScriptableObject implements List {
    static final long serialVersionUID = 7331366857676127338L;
    private static final int Id_length = 1;
    private static final int MAX_INSTANCE_ID = 1;
    private static final int Id_constructor = 1;
    private static final int Id_toString = 2;
    private static final int Id_toLocaleString = 3;
    private static final int Id_toSource = 4;
    private static final int Id_join = 5;
    private static final int Id_reverse = 6;
    private static final int Id_sort = 7;
    private static final int Id_push = 8;
    private static final int Id_pop = 9;
    private static final int Id_shift = 10;
    private static final int Id_unshift = 11;
    private static final int Id_splice = 12;
    private static final int Id_concat = 13;
    private static final int Id_slice = 14;
    private static final int Id_indexOf = 15;
    private static final int Id_lastIndexOf = 16;
    private static final int Id_every = 17;
    private static final int Id_filter = 18;
    private static final int Id_forEach = 19;
    private static final int Id_map = 20;
    private static final int Id_some = 21;
    private static final int Id_find = 22;
    private static final int Id_findIndex = 23;
    private static final int Id_reduce = 24;
    private static final int Id_reduceRight = 25;
    private static final int MAX_PROTOTYPE_ID = 25;
    private static final int ConstructorId_join = -5;
    private static final int ConstructorId_reverse = -6;
    private static final int ConstructorId_sort = -7;
    private static final int ConstructorId_push = -8;
    private static final int ConstructorId_pop = -9;
    private static final int ConstructorId_shift = -10;
    private static final int ConstructorId_unshift = -11;
    private static final int ConstructorId_splice = -12;
    private static final int ConstructorId_concat = -13;
    private static final int ConstructorId_slice = -14;
    private static final int ConstructorId_indexOf = -15;
    private static final int ConstructorId_lastIndexOf = -16;
    private static final int ConstructorId_every = -17;
    private static final int ConstructorId_filter = -18;
    private static final int ConstructorId_forEach = -19;
    private static final int ConstructorId_map = -20;
    private static final int ConstructorId_some = -21;
    private static final int ConstructorId_find = -22;
    private static final int ConstructorId_findIndex = -23;
    private static final int ConstructorId_reduce = -24;
    private static final int ConstructorId_reduceRight = -25;
    private static final int ConstructorId_isArray = -26;
    private long length;
    private int lengthAttr;
    private Object[] dense;
    private boolean denseOnly;
    private static final int DEFAULT_INITIAL_CAPACITY = 10;
    private static final double GROW_FACTOR = 1.5d;
    private static final int MAX_PRE_GROW_SIZE = 1431655764;
    private static final Object ARRAY_TAG = "Array";
    private static final Integer NEGATIVE_ONE = -1;
    private static int maximumInitialCapacity = 10000;

    static void init(Scriptable scope, boolean sealed) {
        NativeArray obj = new NativeArray(0L);
        obj.exportAsJSClass(25, scope, sealed);
    }

    static int getMaximumInitialCapacity() {
        return maximumInitialCapacity;
    }

    static void setMaximumInitialCapacity(int maximumInitialCapacity2) {
        maximumInitialCapacity = maximumInitialCapacity2;
    }

    public NativeArray(long lengthArg) {
        this.lengthAttr = 6;
        this.denseOnly = lengthArg <= ((long) maximumInitialCapacity);
        if (this.denseOnly) {
            int intLength = (int) lengthArg;
            this.dense = new Object[intLength < 10 ? 10 : intLength];
            Arrays.fill(this.dense, Scriptable.NOT_FOUND);
        }
        this.length = lengthArg;
    }

    public NativeArray(Object[] array) {
        this.lengthAttr = 6;
        this.denseOnly = true;
        this.dense = array;
        this.length = array.length;
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public String getClassName() {
        return "Array";
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected int getMaxInstanceId() {
        return 1;
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected void setInstanceIdAttributes(int id, int attr) {
        if (id == 1) {
            this.lengthAttr = attr;
        }
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected int findInstanceIdInfo(String s) {
        if (s.equals("length")) {
            return instanceIdInfo(this.lengthAttr, 1);
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
            return ScriptRuntime.wrapNumber(this.length);
        }
        return super.getInstanceIdValue(id);
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected void setInstanceIdValue(int id, Object value) {
        if (id == 1) {
            setLength(value);
        } else {
            super.setInstanceIdValue(id, value);
        }
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected void fillConstructorProperties(IdFunctionObject ctor) {
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_join, "join", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_reverse, "reverse", 0);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_sort, "sort", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_push, "push", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_pop, "pop", 0);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_shift, "shift", 0);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_unshift, "unshift", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_splice, "splice", 2);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_concat, "concat", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_slice, "slice", 2);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_indexOf, "indexOf", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_lastIndexOf, "lastIndexOf", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_every, "every", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_filter, "filter", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_forEach, "forEach", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_map, "map", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_some, "some", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_find, "find", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_findIndex, "findIndex", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_reduce, "reduce", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_reduceRight, "reduceRight", 1);
        addIdFunctionProperty(ctor, ARRAY_TAG, ConstructorId_isArray, "isArray", 1);
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
                s = "toLocaleString";
                break;
            case 4:
                arity = 0;
                s = "toSource";
                break;
            case 5:
                arity = 1;
                s = "join";
                break;
            case 6:
                arity = 0;
                s = "reverse";
                break;
            case 7:
                arity = 1;
                s = "sort";
                break;
            case 8:
                arity = 1;
                s = "push";
                break;
            case 9:
                arity = 0;
                s = "pop";
                break;
            case 10:
                arity = 0;
                s = "shift";
                break;
            case 11:
                arity = 1;
                s = "unshift";
                break;
            case 12:
                arity = 2;
                s = "splice";
                break;
            case 13:
                arity = 1;
                s = "concat";
                break;
            case 14:
                arity = 2;
                s = "slice";
                break;
            case 15:
                arity = 1;
                s = "indexOf";
                break;
            case 16:
                arity = 1;
                s = "lastIndexOf";
                break;
            case 17:
                arity = 1;
                s = "every";
                break;
            case 18:
                arity = 1;
                s = "filter";
                break;
            case 19:
                arity = 1;
                s = "forEach";
                break;
            case 20:
                arity = 1;
                s = "map";
                break;
            case 21:
                arity = 1;
                s = "some";
                break;
            case 22:
                arity = 1;
                s = "find";
                break;
            case 23:
                arity = 1;
                s = "findIndex";
                break;
            case 24:
                arity = 1;
                s = "reduce";
                break;
            case 25:
                arity = 1;
                s = "reduceRight";
                break;
            default:
                throw new IllegalArgumentException(String.valueOf(id));
        }
        initPrototypeMethod(ARRAY_TAG, id, s, arity);
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:200)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeEndlessLoop(LoopRegionMaker.java:281)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:101)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    @Override // org.mozilla.javascript.IdScriptableObject, org.mozilla.javascript.IdFunctionCall
    public java.lang.Object execIdCall(org.mozilla.javascript.IdFunctionObject r8, org.mozilla.javascript.Context r9, org.mozilla.javascript.Scriptable r10, org.mozilla.javascript.Scriptable r11, java.lang.Object[] r12) {
        /*
            Method dump skipped, instructions count: 562
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.NativeArray.execIdCall(org.mozilla.javascript.IdFunctionObject, org.mozilla.javascript.Context, org.mozilla.javascript.Scriptable, org.mozilla.javascript.Scriptable, java.lang.Object[]):java.lang.Object");
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public Object get(int index, Scriptable start) {
        if (!this.denseOnly && isGetterOrSetter(null, index, false)) {
            return super.get(index, start);
        }
        if (this.dense != null && 0 <= index && index < this.dense.length) {
            return this.dense[index];
        }
        return super.get(index, start);
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public boolean has(int index, Scriptable start) {
        if (!this.denseOnly && isGetterOrSetter(null, index, false)) {
            return super.has(index, start);
        }
        if (this.dense == null || 0 > index || index >= this.dense.length) {
            return super.has(index, start);
        }
        return this.dense[index] != NOT_FOUND;
    }

    private static long toArrayIndex(Object id) {
        if (id instanceof String) {
            return toArrayIndex((String) id);
        }
        if (id instanceof Number) {
            return toArrayIndex(((Number) id).doubleValue());
        }
        return -1L;
    }

    private static long toArrayIndex(String id) {
        long index = toArrayIndex(ScriptRuntime.toNumber(id));
        if (Long.toString(index).equals(id)) {
            return index;
        }
        return -1L;
    }

    private static long toArrayIndex(double d) {
        if (d == d) {
            long index = ScriptRuntime.toUint32(d);
            if (index == d && index != 4294967295L) {
                return index;
            }
            return -1L;
        }
        return -1L;
    }

    private static int toDenseIndex(Object id) {
        long index = toArrayIndex(id);
        if (0 > index || index >= 2147483647L) {
            return -1;
        }
        return (int) index;
    }

    @Override // org.mozilla.javascript.IdScriptableObject, org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public void put(String id, Scriptable start, Object value) {
        super.put(id, start, value);
        if (start == this) {
            long index = toArrayIndex(id);
            if (index >= this.length) {
                this.length = index + 1;
                this.denseOnly = false;
            }
        }
    }

    private boolean ensureCapacity(int capacity) {
        if (capacity > this.dense.length) {
            if (capacity > MAX_PRE_GROW_SIZE) {
                this.denseOnly = false;
                return false;
            }
            Object[] newDense = new Object[Math.max(capacity, (int) (this.dense.length * GROW_FACTOR))];
            System.arraycopy(this.dense, 0, newDense, 0, this.dense.length);
            Arrays.fill(newDense, this.dense.length, newDense.length, Scriptable.NOT_FOUND);
            this.dense = newDense;
            return true;
        }
        return true;
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public void put(int index, Scriptable start, Object value) {
        if (start == this && !isSealed() && this.dense != null && 0 <= index && (this.denseOnly || !isGetterOrSetter(null, index, true))) {
            if (!isExtensible() && this.length <= index) {
                return;
            }
            if (index < this.dense.length) {
                this.dense[index] = value;
                if (this.length <= index) {
                    this.length = index + 1;
                    return;
                }
                return;
            }
            if (this.denseOnly && index < this.dense.length * GROW_FACTOR && ensureCapacity(index + 1)) {
                this.dense[index] = value;
                this.length = index + 1;
                return;
            }
            this.denseOnly = false;
        }
        super.put(index, start, value);
        if (start == this && (this.lengthAttr & 1) == 0 && this.length <= index) {
            this.length = index + 1;
        }
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public void delete(int index) {
        if (this.dense != null && 0 <= index && index < this.dense.length && !isSealed() && (this.denseOnly || !isGetterOrSetter(null, index, true))) {
            this.dense[index] = NOT_FOUND;
        } else {
            super.delete(index);
        }
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public Object[] getIds() {
        Object[] superIds = super.getIds();
        if (this.dense == null) {
            return superIds;
        }
        int N = this.dense.length;
        long currentLength = this.length;
        if (N > currentLength) {
            N = (int) currentLength;
        }
        if (N == 0) {
            return superIds;
        }
        int superLength = superIds.length;
        Object[] ids = new Object[N + superLength];
        int presentCount = 0;
        for (int i = 0; i != N; i++) {
            if (this.dense[i] != NOT_FOUND) {
                ids[presentCount] = Integer.valueOf(i);
                presentCount++;
            }
        }
        if (presentCount != N) {
            Object[] tmp = new Object[presentCount + superLength];
            System.arraycopy(ids, 0, tmp, 0, presentCount);
            ids = tmp;
        }
        System.arraycopy(superIds, 0, ids, presentCount, superLength);
        return ids;
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.debug.DebuggableObject
    public Object[] getAllIds() {
        Set<Object> allIds = new LinkedHashSet<>(Arrays.asList(getIds()));
        allIds.addAll(Arrays.asList(super.getAllIds()));
        return allIds.toArray();
    }

    public Integer[] getIndexIds() {
        Object[] ids = getIds();
        List<Integer> indices = new ArrayList<>(ids.length);
        for (Object id : ids) {
            int int32Id = ScriptRuntime.toInt32(id);
            if (int32Id >= 0 && ScriptRuntime.toString(int32Id).equals(ScriptRuntime.toString(id))) {
                indices.add(Integer.valueOf(int32Id));
            }
        }
        return (Integer[]) indices.toArray(new Integer[indices.size()]);
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public Object getDefaultValue(Class<?> hint) {
        if (hint == ScriptRuntime.NumberClass) {
            Context cx = Context.getContext();
            if (cx.getLanguageVersion() == 120) {
                return Long.valueOf(this.length);
            }
        }
        return super.getDefaultValue(hint);
    }

    private ScriptableObject defaultIndexPropertyDescriptor(Object value) {
        Scriptable scope = getParentScope();
        if (scope == null) {
            scope = this;
        }
        ScriptableObject desc = new NativeObject();
        ScriptRuntime.setBuiltinProtoAndParent(desc, scope, TopLevel.Builtins.Object);
        desc.defineProperty("value", value, 0);
        desc.defineProperty("writable", (Object) true, 0);
        desc.defineProperty("enumerable", (Object) true, 0);
        desc.defineProperty("configurable", (Object) true, 0);
        return desc;
    }

    @Override // org.mozilla.javascript.ScriptableObject
    public int getAttributes(int index) {
        if (this.dense != null && index >= 0 && index < this.dense.length && this.dense[index] != NOT_FOUND) {
            return 0;
        }
        return super.getAttributes(index);
    }

    @Override // org.mozilla.javascript.IdScriptableObject, org.mozilla.javascript.ScriptableObject
    protected ScriptableObject getOwnPropertyDescriptor(Context cx, Object id) {
        int index;
        if (this.dense != null && 0 <= (index = toDenseIndex(id)) && index < this.dense.length && this.dense[index] != NOT_FOUND) {
            Object value = this.dense[index];
            return defaultIndexPropertyDescriptor(value);
        }
        return super.getOwnPropertyDescriptor(cx, id);
    }

    @Override // org.mozilla.javascript.ScriptableObject
    protected void defineOwnProperty(Context cx, Object id, ScriptableObject desc, boolean checkValid) {
        if (this.dense != null) {
            Object[] values = this.dense;
            this.dense = null;
            this.denseOnly = false;
            for (int i = 0; i < values.length; i++) {
                if (values[i] != NOT_FOUND) {
                    put(i, this, values[i]);
                }
            }
        }
        long index = toArrayIndex(id);
        if (index >= this.length) {
            this.length = index + 1;
        }
        super.defineOwnProperty(cx, id, desc, checkValid);
    }

    private static Object jsConstructor(Context cx, Scriptable scope, Object[] args) {
        if (args.length == 0) {
            return new NativeArray(0L);
        }
        if (cx.getLanguageVersion() == 120) {
            return new NativeArray(args);
        }
        Object arg0 = args[0];
        if (args.length > 1 || !(arg0 instanceof Number)) {
            return new NativeArray(args);
        }
        long len = ScriptRuntime.toUint32(arg0);
        if (len != ((Number) arg0).doubleValue()) {
            String msg = ScriptRuntime.getMessage0("msg.arraylength.bad");
            throw ScriptRuntime.constructError("RangeError", msg);
        }
        return new NativeArray(len);
    }

    public long getLength() {
        return this.length;
    }

    @Deprecated
    public long jsGet_length() {
        return getLength();
    }

    void setDenseOnly(boolean denseOnly) {
        if (denseOnly && !this.denseOnly) {
            throw new IllegalArgumentException();
        }
        this.denseOnly = denseOnly;
    }

    private void setLength(Object val) {
        if ((this.lengthAttr & 1) != 0) {
            return;
        }
        double d = ScriptRuntime.toNumber(val);
        long longVal = ScriptRuntime.toUint32(d);
        if (longVal != d) {
            String msg = ScriptRuntime.getMessage0("msg.arraylength.bad");
            throw ScriptRuntime.constructError("RangeError", msg);
        }
        if (this.denseOnly) {
            if (longVal < this.length) {
                Arrays.fill(this.dense, (int) longVal, this.dense.length, NOT_FOUND);
                this.length = longVal;
                return;
            } else {
                if (longVal < 1431655764 && longVal < this.length * GROW_FACTOR && ensureCapacity((int) longVal)) {
                    this.length = longVal;
                    return;
                }
                this.denseOnly = false;
            }
        }
        if (longVal < this.length) {
            if (this.length - longVal > 4096) {
                Object[] e = getIds();
                for (Object id : e) {
                    if (id instanceof String) {
                        String strId = (String) id;
                        if (toArrayIndex(strId) >= longVal) {
                            delete(strId);
                        }
                    } else {
                        int index = ((Integer) id).intValue();
                        if (index >= longVal) {
                            delete(index);
                        }
                    }
                }
            } else {
                long j = longVal;
                while (true) {
                    long i = j;
                    if (i >= this.length) {
                        break;
                    }
                    deleteElem(this, i);
                    j = i + 1;
                }
            }
        }
        this.length = longVal;
    }

    static long getLengthProperty(Context cx, Scriptable obj) {
        if (obj instanceof NativeString) {
            return ((NativeString) obj).getLength();
        }
        if (obj instanceof NativeArray) {
            return ((NativeArray) obj).getLength();
        }
        Object len = ScriptableObject.getProperty(obj, "length");
        if (len == Scriptable.NOT_FOUND) {
            return 0L;
        }
        return ScriptRuntime.toUint32(len);
    }

    private static Object setLengthProperty(Context cx, Scriptable target, long length) {
        Object len = ScriptRuntime.wrapNumber(length);
        ScriptableObject.putProperty(target, "length", len);
        return len;
    }

    private static void deleteElem(Scriptable target, long index) {
        int i = (int) index;
        if (i != index) {
            target.delete(Long.toString(index));
        } else {
            target.delete(i);
        }
    }

    private static Object getElem(Context cx, Scriptable target, long index) {
        Object elem = getRawElem(target, index);
        return elem != Scriptable.NOT_FOUND ? elem : Undefined.instance;
    }

    private static Object getRawElem(Scriptable target, long index) {
        if (index > 2147483647L) {
            return ScriptableObject.getProperty(target, Long.toString(index));
        }
        return ScriptableObject.getProperty(target, (int) index);
    }

    private static void defineElem(Context cx, Scriptable target, long index, Object value) {
        if (index > 2147483647L) {
            String id = Long.toString(index);
            target.put(id, target, value);
        } else {
            target.put((int) index, target, value);
        }
    }

    private static void setElem(Context cx, Scriptable target, long index, Object value) {
        if (index > 2147483647L) {
            String id = Long.toString(index);
            ScriptableObject.putProperty(target, id, value);
        } else {
            ScriptableObject.putProperty(target, (int) index, value);
        }
    }

    private static void setRawElem(Context cx, Scriptable target, long index, Object value) {
        if (value == NOT_FOUND) {
            deleteElem(target, index);
        } else {
            setElem(cx, target, index, value);
        }
    }

    private static String toStringHelper(Context cx, Scriptable scope, Scriptable thisObj, boolean toSource, boolean toLocale) {
        String separator;
        boolean toplevel;
        boolean iterating;
        long length = getLengthProperty(cx, thisObj);
        StringBuilder result = new StringBuilder(256);
        if (toSource) {
            result.append('[');
            separator = ", ";
        } else {
            separator = ",";
        }
        boolean haslast = false;
        long i = 0;
        if (cx.iterating == null) {
            toplevel = true;
            iterating = false;
            cx.iterating = new ObjToIntMap(31);
        } else {
            toplevel = false;
            iterating = cx.iterating.has(thisObj);
        }
        if (!iterating) {
            try {
                cx.iterating.put(thisObj, 0);
                boolean skipUndefinedAndNull = !toSource || cx.getLanguageVersion() < 150;
                i = 0;
                while (i < length) {
                    if (i > 0) {
                        result.append(separator);
                    }
                    Object elem = getRawElem(thisObj, i);
                    if (elem == NOT_FOUND || (skipUndefinedAndNull && (elem == null || elem == Undefined.instance))) {
                        haslast = false;
                    } else {
                        haslast = true;
                        if (toSource) {
                            result.append(ScriptRuntime.uneval(cx, scope, elem));
                        } else if (elem instanceof String) {
                            String s = (String) elem;
                            if (toSource) {
                                result.append('\"');
                                result.append(ScriptRuntime.escapeString(s));
                                result.append('\"');
                            } else {
                                result.append(s);
                            }
                        } else {
                            if (toLocale) {
                                Callable fun = ScriptRuntime.getPropFunctionAndThis(elem, "toLocaleString", cx, scope);
                                Scriptable funThis = ScriptRuntime.lastStoredScriptable(cx);
                                elem = fun.call(cx, scope, funThis, ScriptRuntime.emptyArgs);
                            }
                            result.append(ScriptRuntime.toString(elem));
                        }
                    }
                    i++;
                }
            } finally {
                if (toplevel) {
                    cx.iterating = null;
                }
            }
        }
        if (toSource) {
            if (!haslast && i > 0) {
                result.append(", ]");
            } else {
                result.append(']');
            }
        }
        return result.toString();
    }

    private static String js_join(Context cx, Scriptable thisObj, Object[] args) {
        Object temp;
        long llength = getLengthProperty(cx, thisObj);
        int length = (int) llength;
        if (llength != length) {
            throw Context.reportRuntimeError1("msg.arraylength.too.big", String.valueOf(llength));
        }
        String separator = (args.length < 1 || args[0] == Undefined.instance) ? "," : ScriptRuntime.toString(args[0]);
        if (thisObj instanceof NativeArray) {
            NativeArray na = (NativeArray) thisObj;
            if (na.denseOnly) {
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < length; i++) {
                    if (i != 0) {
                        sb.append(separator);
                    }
                    if (i < na.dense.length && (temp = na.dense[i]) != null && temp != Undefined.instance && temp != Scriptable.NOT_FOUND) {
                        sb.append(ScriptRuntime.toString(temp));
                    }
                }
                return sb.toString();
            }
        }
        if (length == 0) {
            return "";
        }
        String[] buf = new String[length];
        int total_size = 0;
        for (int i2 = 0; i2 != length; i2++) {
            Object temp2 = getElem(cx, thisObj, i2);
            if (temp2 != null && temp2 != Undefined.instance) {
                String str = ScriptRuntime.toString(temp2);
                total_size += str.length();
                buf[i2] = str;
            }
        }
        StringBuilder sb2 = new StringBuilder(total_size + ((length - 1) * separator.length()));
        for (int i3 = 0; i3 != length; i3++) {
            if (i3 != 0) {
                sb2.append(separator);
            }
            String str2 = buf[i3];
            if (str2 != null) {
                sb2.append(str2);
            }
        }
        return sb2.toString();
    }

    private static Scriptable js_reverse(Context cx, Scriptable thisObj, Object[] args) {
        if (thisObj instanceof NativeArray) {
            NativeArray na = (NativeArray) thisObj;
            if (na.denseOnly) {
                int i = 0;
                for (int j = ((int) na.length) - 1; i < j; j--) {
                    Object temp = na.dense[i];
                    na.dense[i] = na.dense[j];
                    na.dense[j] = temp;
                    i++;
                }
                return thisObj;
            }
        }
        long len = getLengthProperty(cx, thisObj);
        long half = len / 2;
        long j2 = 0;
        while (true) {
            long i2 = j2;
            if (i2 < half) {
                long j3 = (len - i2) - 1;
                Object temp1 = getRawElem(thisObj, i2);
                Object temp2 = getRawElem(thisObj, j3);
                setRawElem(cx, thisObj, i2, temp2);
                setRawElem(cx, thisObj, j3, temp1);
                j2 = i2 + 1;
            } else {
                return thisObj;
            }
        }
    }

    private static Scriptable js_sort(final Context cx, final Scriptable scope, Scriptable thisObj, Object[] args) {
        Comparator<Object> comparator;
        if (args.length > 0 && Undefined.instance != args[0]) {
            final Callable jsCompareFunction = ScriptRuntime.getValueFunctionAndThis(args[0], cx);
            final Scriptable funThis = ScriptRuntime.lastStoredScriptable(cx);
            final Object[] cmpBuf = new Object[2];
            comparator = new Comparator<Object>() { // from class: org.mozilla.javascript.NativeArray.1
                @Override // java.util.Comparator
                public int compare(Object x, Object y) {
                    if (x == Scriptable.NOT_FOUND) {
                        return y == Scriptable.NOT_FOUND ? 0 : 1;
                    }
                    if (y == Scriptable.NOT_FOUND) {
                        return -1;
                    }
                    if (x == Undefined.instance) {
                        return y == Undefined.instance ? 0 : 1;
                    }
                    if (y == Undefined.instance) {
                        return -1;
                    }
                    cmpBuf[0] = x;
                    cmpBuf[1] = y;
                    Object ret = jsCompareFunction.call(cx, scope, funThis, cmpBuf);
                    double d = ScriptRuntime.toNumber(ret);
                    if (d < 0.0d) {
                        return -1;
                    }
                    if (d > 0.0d) {
                        return 1;
                    }
                    return 0;
                }
            };
        } else {
            comparator = new Comparator<Object>() { // from class: org.mozilla.javascript.NativeArray.2
                @Override // java.util.Comparator
                public int compare(Object x, Object y) {
                    if (x == Scriptable.NOT_FOUND) {
                        return y == Scriptable.NOT_FOUND ? 0 : 1;
                    }
                    if (y == Scriptable.NOT_FOUND) {
                        return -1;
                    }
                    if (x == Undefined.instance) {
                        return y == Undefined.instance ? 0 : 1;
                    }
                    if (y == Undefined.instance) {
                        return -1;
                    }
                    String a = ScriptRuntime.toString(x);
                    String b = ScriptRuntime.toString(y);
                    return a.compareTo(b);
                }
            };
        }
        long llength = getLengthProperty(cx, thisObj);
        int length = (int) llength;
        if (llength != length) {
            throw Context.reportRuntimeError1("msg.arraylength.too.big", String.valueOf(llength));
        }
        Object[] working = new Object[length];
        for (int i = 0; i != length; i++) {
            working[i] = getRawElem(thisObj, i);
        }
        Arrays.sort(working, comparator);
        for (int i2 = 0; i2 < length; i2++) {
            setRawElem(cx, thisObj, i2, working[i2]);
        }
        return thisObj;
    }

    private static Object js_push(Context cx, Scriptable thisObj, Object[] args) {
        if (thisObj instanceof NativeArray) {
            NativeArray na = (NativeArray) thisObj;
            if (na.denseOnly && na.ensureCapacity(((int) na.length) + args.length)) {
                for (Object obj : args) {
                    Object[] objArr = na.dense;
                    long j = na.length;
                    na.length = j + 1;
                    objArr[(int) j] = obj;
                }
                return ScriptRuntime.wrapNumber(na.length);
            }
        }
        long length = getLengthProperty(cx, thisObj);
        for (int i = 0; i < args.length; i++) {
            setElem(cx, thisObj, length + i, args[i]);
        }
        Object lengthObj = setLengthProperty(cx, thisObj, length + args.length);
        if (cx.getLanguageVersion() == 120) {
            return args.length == 0 ? Undefined.instance : args[args.length - 1];
        }
        return lengthObj;
    }

    private static Object js_pop(Context cx, Scriptable thisObj, Object[] args) {
        Object result;
        if (thisObj instanceof NativeArray) {
            NativeArray na = (NativeArray) thisObj;
            if (na.denseOnly && na.length > 0) {
                na.length--;
                Object result2 = na.dense[(int) na.length];
                na.dense[(int) na.length] = NOT_FOUND;
                return result2;
            }
        }
        long length = getLengthProperty(cx, thisObj);
        if (length > 0) {
            length--;
            result = getElem(cx, thisObj, length);
            deleteElem(thisObj, length);
        } else {
            result = Undefined.instance;
        }
        setLengthProperty(cx, thisObj, length);
        return result;
    }

    private static Object js_shift(Context cx, Scriptable thisObj, Object[] args) {
        Object result;
        if (thisObj instanceof NativeArray) {
            NativeArray na = (NativeArray) thisObj;
            if (na.denseOnly && na.length > 0) {
                na.length--;
                Object result2 = na.dense[0];
                System.arraycopy(na.dense, 1, na.dense, 0, (int) na.length);
                na.dense[(int) na.length] = NOT_FOUND;
                return result2 == NOT_FOUND ? Undefined.instance : result2;
            }
        }
        long length = getLengthProperty(cx, thisObj);
        if (length > 0) {
            length--;
            result = getElem(cx, thisObj, 0L);
            if (length > 0) {
                long j = 1;
                while (true) {
                    long i = j;
                    if (i > length) {
                        break;
                    }
                    Object temp = getRawElem(thisObj, i);
                    setRawElem(cx, thisObj, i - 1, temp);
                    j = i + 1;
                }
            }
            deleteElem(thisObj, length);
        } else {
            result = Undefined.instance;
        }
        setLengthProperty(cx, thisObj, length);
        return result;
    }

    private static Object js_unshift(Context cx, Scriptable thisObj, Object[] args) {
        if (thisObj instanceof NativeArray) {
            NativeArray na = (NativeArray) thisObj;
            if (na.denseOnly && na.ensureCapacity(((int) na.length) + args.length)) {
                System.arraycopy(na.dense, 0, na.dense, args.length, (int) na.length);
                for (int i = 0; i < args.length; i++) {
                    na.dense[i] = args[i];
                }
                na.length += args.length;
                return ScriptRuntime.wrapNumber(na.length);
            }
        }
        long length = getLengthProperty(cx, thisObj);
        int argc = args.length;
        if (args.length > 0) {
            if (length > 0) {
                long j = length;
                while (true) {
                    long last = j - 1;
                    if (last < 0) {
                        break;
                    }
                    Object temp = getRawElem(thisObj, last);
                    setRawElem(cx, thisObj, last + argc, temp);
                    j = last;
                }
            }
            for (int i2 = 0; i2 < args.length; i2++) {
                setElem(cx, thisObj, i2, args[i2]);
            }
        }
        return setLengthProperty(cx, thisObj, length + args.length);
    }

    private static Object js_splice(Context cx, Scriptable scope, Scriptable thisObj, Object[] args) {
        long count;
        Object result;
        NativeArray na = null;
        boolean denseMode = false;
        if (thisObj instanceof NativeArray) {
            na = (NativeArray) thisObj;
            denseMode = na.denseOnly;
        }
        Scriptable scope2 = getTopLevelScope(scope);
        int argc = args.length;
        if (argc == 0) {
            return cx.newArray(scope2, 0);
        }
        long length = getLengthProperty(cx, thisObj);
        long begin = toSliceIndex(ScriptRuntime.toInteger(args[0]), length);
        int argc2 = argc - 1;
        if (args.length == 1) {
            count = length - begin;
        } else {
            double dcount = ScriptRuntime.toInteger(args[1]);
            if (dcount < 0.0d) {
                count = 0;
            } else if (dcount > length - begin) {
                count = length - begin;
            } else {
                count = (long) dcount;
            }
            argc2--;
        }
        long end = begin + count;
        if (count != 0) {
            if (count == 1 && cx.getLanguageVersion() == 120) {
                result = getElem(cx, thisObj, begin);
            } else if (denseMode) {
                int intLen = (int) (end - begin);
                Object[] copy = new Object[intLen];
                System.arraycopy(na.dense, (int) begin, copy, 0, intLen);
                result = cx.newArray(scope2, copy);
            } else {
                Scriptable resultArray = cx.newArray(scope2, 0);
                long j = begin;
                while (true) {
                    long last = j;
                    if (last == end) {
                        break;
                    }
                    Object temp = getRawElem(thisObj, last);
                    if (temp != NOT_FOUND) {
                        setElem(cx, resultArray, last - begin, temp);
                    }
                    j = last + 1;
                }
                setLengthProperty(cx, resultArray, end - begin);
                result = resultArray;
            }
        } else if (cx.getLanguageVersion() == 120) {
            result = Undefined.instance;
        } else {
            result = cx.newArray(scope2, 0);
        }
        long delta = argc2 - count;
        if (denseMode && length + delta < 2147483647L && na.ensureCapacity((int) (length + delta))) {
            System.arraycopy(na.dense, (int) end, na.dense, (int) (begin + argc2), (int) (length - end));
            if (argc2 > 0) {
                System.arraycopy(args, 2, na.dense, (int) begin, argc2);
            }
            if (delta < 0) {
                Arrays.fill(na.dense, (int) (length + delta), (int) length, NOT_FOUND);
            }
            na.length = length + delta;
            return result;
        }
        if (delta > 0) {
            long j2 = length;
            while (true) {
                long last2 = j2 - 1;
                if (last2 < end) {
                    break;
                }
                Object temp2 = getRawElem(thisObj, last2);
                setRawElem(cx, thisObj, last2 + delta, temp2);
                j2 = last2;
            }
        } else if (delta < 0) {
            long j3 = end;
            while (true) {
                long last3 = j3;
                if (last3 >= length) {
                    break;
                }
                Object temp3 = getRawElem(thisObj, last3);
                setRawElem(cx, thisObj, last3 + delta, temp3);
                j3 = last3 + 1;
            }
            long j4 = length;
            long j5 = delta;
            while (true) {
                long k = j4 + j5;
                if (k >= length) {
                    break;
                }
                deleteElem(thisObj, k);
                j4 = k;
                j5 = 1;
            }
        }
        int argoffset = args.length - argc2;
        for (int i = 0; i < argc2; i++) {
            setElem(cx, thisObj, begin + i, args[i + argoffset]);
        }
        setLengthProperty(cx, thisObj, length + delta);
        return result;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static Scriptable js_concat(Context context, Scriptable scope, Scriptable thisObj, Object[] args) {
        long slot;
        Scriptable result = context.newArray(getTopLevelScope(scope), 0);
        if ((thisObj instanceof NativeArray) && (result instanceof NativeArray)) {
            NativeArray denseThis = (NativeArray) thisObj;
            NativeArray denseResult = (NativeArray) result;
            if (denseThis.denseOnly && denseResult.denseOnly) {
                boolean canUseDense = true;
                int length = (int) denseThis.length;
                for (int i = 0; i < args.length && canUseDense; i++) {
                    if (args[i] instanceof NativeArray) {
                        NativeArray arg = (NativeArray) args[i];
                        canUseDense = arg.denseOnly;
                        length = (int) (length + arg.length);
                    } else {
                        length++;
                    }
                }
                if (canUseDense && denseResult.ensureCapacity(length)) {
                    System.arraycopy(denseThis.dense, 0, denseResult.dense, 0, (int) denseThis.length);
                    int cursor = (int) denseThis.length;
                    for (int i2 = 0; i2 < args.length && canUseDense; i2++) {
                        if (args[i2] instanceof NativeArray) {
                            NativeArray arg2 = (NativeArray) args[i2];
                            System.arraycopy(arg2.dense, 0, denseResult.dense, cursor, (int) arg2.length);
                            cursor += (int) arg2.length;
                        } else {
                            int i3 = cursor;
                            cursor++;
                            denseResult.dense[i3] = args[i2];
                        }
                    }
                    denseResult.length = length;
                    return result;
                }
            }
        }
        if (!js_isArray(thisObj)) {
            slot = 0 + 1;
            defineElem(context, context, 0L, thisObj);
        } else {
            long length2 = getLengthProperty(context, thisObj);
            long j = 0;
            while (true) {
                slot = j;
                if (slot >= length2) {
                    break;
                }
                Object temp = getRawElem(thisObj, slot);
                if (temp != NOT_FOUND) {
                    defineElem(context, result, slot, temp);
                }
                j = slot + 1;
            }
        }
        for (int i4 = 0; i4 < args.length; i4++) {
            if (js_isArray(args[i4])) {
                Scriptable arg3 = (Scriptable) args[i4];
                long length3 = getLengthProperty(context, arg3);
                long j2 = 0;
                while (j2 < length3) {
                    Object temp2 = getRawElem(arg3, j2);
                    if (temp2 != NOT_FOUND) {
                        defineElem(context, result, slot, temp2);
                    }
                    j2++;
                    slot++;
                }
            } else {
                long j3 = slot;
                slot = j3 + 1;
                defineElem(context, context, j3, args[i4]);
            }
        }
        setLengthProperty(context, result, slot);
        return result;
    }

    private Scriptable js_slice(Context cx, Scriptable thisObj, Object[] args) {
        long begin;
        long end;
        Scriptable scope = getTopLevelScope(this);
        Scriptable result = cx.newArray(scope, 0);
        long length = getLengthProperty(cx, thisObj);
        if (args.length == 0) {
            begin = 0;
            end = length;
        } else {
            begin = toSliceIndex(ScriptRuntime.toInteger(args[0]), length);
            if (args.length == 1 || args[1] == Undefined.instance) {
                end = length;
            } else {
                end = toSliceIndex(ScriptRuntime.toInteger(args[1]), length);
            }
        }
        long j = begin;
        while (true) {
            long slot = j;
            if (slot < end) {
                Object temp = getRawElem(thisObj, slot);
                if (temp != NOT_FOUND) {
                    defineElem(cx, result, slot - begin, temp);
                }
                j = slot + 1;
            } else {
                setLengthProperty(cx, result, Math.max(0L, end - begin));
                return result;
            }
        }
    }

    private static long toSliceIndex(double value, long length) {
        long result;
        if (value < 0.0d) {
            if (value + length < 0.0d) {
                result = 0;
            } else {
                result = (long) (value + length);
            }
        } else if (value > length) {
            result = length;
        } else {
            result = (long) value;
        }
        return result;
    }

    private static Object js_indexOf(Context cx, Scriptable thisObj, Object[] args) {
        long start;
        Object compareTo = args.length > 0 ? args[0] : Undefined.instance;
        long length = getLengthProperty(cx, thisObj);
        if (args.length < 2) {
            start = 0;
        } else {
            start = (long) ScriptRuntime.toInteger(args[1]);
            if (start < 0) {
                start += length;
                if (start < 0) {
                    start = 0;
                }
            }
            if (start > length - 1) {
                return NEGATIVE_ONE;
            }
        }
        if (thisObj instanceof NativeArray) {
            NativeArray na = (NativeArray) thisObj;
            if (na.denseOnly) {
                Scriptable proto = na.getPrototype();
                for (int i = (int) start; i < length; i++) {
                    Object val = na.dense[i];
                    if (val == NOT_FOUND && proto != null) {
                        val = ScriptableObject.getProperty(proto, i);
                    }
                    if (val != NOT_FOUND && ScriptRuntime.shallowEq(val, compareTo)) {
                        return Long.valueOf(i);
                    }
                }
                return NEGATIVE_ONE;
            }
        }
        long j = start;
        while (true) {
            long i2 = j;
            if (i2 < length) {
                Object val2 = getRawElem(thisObj, i2);
                if (val2 == NOT_FOUND || !ScriptRuntime.shallowEq(val2, compareTo)) {
                    j = i2 + 1;
                } else {
                    return Long.valueOf(i2);
                }
            } else {
                return NEGATIVE_ONE;
            }
        }
    }

    private static Object js_lastIndexOf(Context cx, Scriptable thisObj, Object[] args) {
        long start;
        Object compareTo = args.length > 0 ? args[0] : Undefined.instance;
        long length = getLengthProperty(cx, thisObj);
        if (args.length < 2) {
            start = length - 1;
        } else {
            start = (long) ScriptRuntime.toInteger(args[1]);
            if (start >= length) {
                start = length - 1;
            } else if (start < 0) {
                start += length;
            }
            if (start < 0) {
                return NEGATIVE_ONE;
            }
        }
        if (thisObj instanceof NativeArray) {
            NativeArray na = (NativeArray) thisObj;
            if (na.denseOnly) {
                Scriptable proto = na.getPrototype();
                for (int i = (int) start; i >= 0; i--) {
                    Object val = na.dense[i];
                    if (val == NOT_FOUND && proto != null) {
                        val = ScriptableObject.getProperty(proto, i);
                    }
                    if (val != NOT_FOUND && ScriptRuntime.shallowEq(val, compareTo)) {
                        return Long.valueOf(i);
                    }
                }
                return NEGATIVE_ONE;
            }
        }
        long j = start;
        while (true) {
            long i2 = j;
            if (i2 >= 0) {
                Object val2 = getRawElem(thisObj, i2);
                if (val2 == NOT_FOUND || !ScriptRuntime.shallowEq(val2, compareTo)) {
                    j = i2 - 1;
                } else {
                    return Long.valueOf(i2);
                }
            } else {
                return NEGATIVE_ONE;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:92:0x0192, code lost:
    
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.lang.Object iterativeMethod(org.mozilla.javascript.Context r9, int r10, org.mozilla.javascript.Scriptable r11, org.mozilla.javascript.Scriptable r12, java.lang.Object[] r13) {
        /*
            Method dump skipped, instructions count: 478
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.NativeArray.iterativeMethod(org.mozilla.javascript.Context, int, org.mozilla.javascript.Scriptable, org.mozilla.javascript.Scriptable, java.lang.Object[]):java.lang.Object");
    }

    private static Object reduceMethod(Context cx, int id, Scriptable scope, Scriptable thisObj, Object[] args) {
        long length = getLengthProperty(cx, thisObj);
        Object callbackArg = args.length > 0 ? args[0] : Undefined.instance;
        if (callbackArg == null || !(callbackArg instanceof Function)) {
            throw ScriptRuntime.notFunctionError(callbackArg);
        }
        Function f = (Function) callbackArg;
        Scriptable parent = ScriptableObject.getTopLevelScope(f);
        boolean movingLeft = id == 24;
        Object value = args.length > 1 ? args[1] : Scriptable.NOT_FOUND;
        long j = 0;
        while (true) {
            long i = j;
            if (i >= length) {
                break;
            }
            long index = movingLeft ? i : (length - 1) - i;
            Object elem = getRawElem(thisObj, index);
            if (elem != Scriptable.NOT_FOUND) {
                if (value == Scriptable.NOT_FOUND) {
                    value = elem;
                } else {
                    Object[] innerArgs = {value, elem, Long.valueOf(index), thisObj};
                    value = f.call(cx, parent, parent, innerArgs);
                }
            }
            j = i + 1;
        }
        if (value == Scriptable.NOT_FOUND) {
            throw ScriptRuntime.typeError0("msg.empty.array.reduce");
        }
        return value;
    }

    private static boolean js_isArray(Object o) {
        if (!(o instanceof Scriptable)) {
            return false;
        }
        return "Array".equals(((Scriptable) o).getClassName());
    }

    @Override // java.util.List, java.util.Collection
    public boolean contains(Object o) {
        return indexOf(o) > -1;
    }

    @Override // java.util.List, java.util.Collection
    public Object[] toArray() {
        return toArray(ScriptRuntime.emptyArgs);
    }

    @Override // java.util.List, java.util.Collection
    public Object[] toArray(Object[] a) {
        long longLen = this.length;
        if (longLen > 2147483647L) {
            throw new IllegalStateException();
        }
        int len = (int) longLen;
        Object[] array = a.length >= len ? a : (Object[]) Array.newInstance(a.getClass().getComponentType(), len);
        for (int i = 0; i < len; i++) {
            array[i] = get(i);
        }
        return array;
    }

    @Override // java.util.List, java.util.Collection
    public boolean containsAll(Collection c) {
        for (Object aC : c) {
            if (!contains(aC)) {
                return false;
            }
        }
        return true;
    }

    @Override // org.mozilla.javascript.ScriptableObject, java.util.List, java.util.Collection
    public int size() {
        long longLen = this.length;
        if (longLen > 2147483647L) {
            throw new IllegalStateException();
        }
        return (int) longLen;
    }

    @Override // org.mozilla.javascript.ScriptableObject, java.util.List, java.util.Collection
    public boolean isEmpty() {
        return this.length == 0;
    }

    public Object get(long index) {
        if (index < 0 || index >= this.length) {
            throw new IndexOutOfBoundsException();
        }
        Object value = getRawElem(this, index);
        if (value == Scriptable.NOT_FOUND || value == Undefined.instance) {
            return null;
        }
        if (value instanceof Wrapper) {
            return ((Wrapper) value).unwrap();
        }
        return value;
    }

    @Override // java.util.List
    public Object get(int index) {
        return get(index);
    }

    @Override // java.util.List
    public int indexOf(Object o) {
        long longLen = this.length;
        if (longLen > 2147483647L) {
            throw new IllegalStateException();
        }
        int len = (int) longLen;
        if (o == null) {
            for (int i = 0; i < len; i++) {
                if (get(i) == null) {
                    return i;
                }
            }
            return -1;
        }
        for (int i2 = 0; i2 < len; i2++) {
            if (o.equals(get(i2))) {
                return i2;
            }
        }
        return -1;
    }

    @Override // java.util.List
    public int lastIndexOf(Object o) {
        long longLen = this.length;
        if (longLen > 2147483647L) {
            throw new IllegalStateException();
        }
        int len = (int) longLen;
        if (o == null) {
            for (int i = len - 1; i >= 0; i--) {
                if (get(i) == null) {
                    return i;
                }
            }
            return -1;
        }
        for (int i2 = len - 1; i2 >= 0; i2--) {
            if (o.equals(get(i2))) {
                return i2;
            }
        }
        return -1;
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public Iterator iterator() {
        return listIterator(0);
    }

    @Override // java.util.List
    public ListIterator listIterator() {
        return listIterator(0);
    }

    @Override // java.util.List
    public ListIterator listIterator(final int start) {
        long longLen = this.length;
        if (longLen > 2147483647L) {
            throw new IllegalStateException();
        }
        final int len = (int) longLen;
        if (start < 0 || start > len) {
            throw new IndexOutOfBoundsException("Index: " + start);
        }
        return new ListIterator() { // from class: org.mozilla.javascript.NativeArray.3
            int cursor;

            {
                this.cursor = start;
            }

            @Override // java.util.ListIterator, java.util.Iterator
            public boolean hasNext() {
                return this.cursor < len;
            }

            @Override // java.util.ListIterator, java.util.Iterator
            public Object next() {
                if (this.cursor == len) {
                    throw new NoSuchElementException();
                }
                NativeArray nativeArray = NativeArray.this;
                int i = this.cursor;
                this.cursor = i + 1;
                return nativeArray.get(i);
            }

            @Override // java.util.ListIterator
            public boolean hasPrevious() {
                return this.cursor > 0;
            }

            @Override // java.util.ListIterator
            public Object previous() {
                if (this.cursor == 0) {
                    throw new NoSuchElementException();
                }
                NativeArray nativeArray = NativeArray.this;
                int i = this.cursor - 1;
                this.cursor = i;
                return nativeArray.get(i);
            }

            @Override // java.util.ListIterator
            public int nextIndex() {
                return this.cursor;
            }

            @Override // java.util.ListIterator
            public int previousIndex() {
                return this.cursor - 1;
            }

            @Override // java.util.ListIterator, java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }

            @Override // java.util.ListIterator
            public void add(Object o) {
                throw new UnsupportedOperationException();
            }

            @Override // java.util.ListIterator
            public void set(Object o) {
                throw new UnsupportedOperationException();
            }
        };
    }

    @Override // java.util.List, java.util.Collection
    public boolean add(Object o) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    public boolean remove(Object o) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    public boolean addAll(Collection c) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    public boolean removeAll(Collection c) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    public boolean retainAll(Collection c) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    public void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public void add(int index, Object element) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public boolean addAll(int index, Collection c) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public Object set(int index, Object element) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public Object remove(int index) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public List subList(int fromIndex, int toIndex) {
        throw new UnsupportedOperationException();
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
    /* JADX WARN: Removed duplicated region for block: B:66:0x024f A[PHI: r5 r6
      0x024f: PHI (r5v1 'id' int) = 
      (r5v0 'id' int)
      (r5v3 'id' int)
      (r5v0 'id' int)
      (r5v4 'id' int)
      (r5v5 'id' int)
      (r5v6 'id' int)
      (r5v7 'id' int)
      (r5v0 'id' int)
      (r5v8 'id' int)
      (r5v9 'id' int)
      (r5v0 'id' int)
      (r5v10 'id' int)
      (r5v11 'id' int)
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
      (r5v0 'id' int)
      (r5v21 'id' int)
      (r5v22 'id' int)
      (r5v23 'id' int)
      (r5v24 'id' int)
      (r5v25 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
      (r5v0 'id' int)
     binds: [B:3:0x0008, B:65:0x0247, B:63:0x023b, B:64:0x023e, B:61:0x022e, B:58:0x021f, B:55:0x0208, B:53:0x01fd, B:54:0x0200, B:51:0x01f1, B:43:0x0190, B:47:0x01d7, B:46:0x01ce, B:45:0x01c5, B:44:0x01bc, B:36:0x013b, B:40:0x017f, B:39:0x0176, B:38:0x016d, B:37:0x0164, B:33:0x012a, B:34:0x012d, B:31:0x011d, B:28:0x010d, B:19:0x0096, B:24:0x00f3, B:23:0x00ea, B:22:0x00e1, B:21:0x00d8, B:20:0x00d0, B:12:0x0074, B:14:0x007e, B:16:0x0088, B:7:0x005d, B:9:0x0067] A[DONT_GENERATE, DONT_INLINE]
      0x024f: PHI (r6v1 'X' java.lang.String) = 
      (r6v0 'X' java.lang.String)
      (r6v2 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v3 'X' java.lang.String)
      (r6v4 'X' java.lang.String)
      (r6v5 'X' java.lang.String)
      (r6v6 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v7 'X' java.lang.String)
      (r6v8 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v9 'X' java.lang.String)
      (r6v10 'X' java.lang.String)
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
      (r6v0 'X' java.lang.String)
      (r6v20 'X' java.lang.String)
      (r6v21 'X' java.lang.String)
      (r6v22 'X' java.lang.String)
      (r6v23 'X' java.lang.String)
      (r6v24 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
      (r6v0 'X' java.lang.String)
     binds: [B:3:0x0008, B:65:0x0247, B:63:0x023b, B:64:0x023e, B:61:0x022e, B:58:0x021f, B:55:0x0208, B:53:0x01fd, B:54:0x0200, B:51:0x01f1, B:43:0x0190, B:47:0x01d7, B:46:0x01ce, B:45:0x01c5, B:44:0x01bc, B:36:0x013b, B:40:0x017f, B:39:0x0176, B:38:0x016d, B:37:0x0164, B:33:0x012a, B:34:0x012d, B:31:0x011d, B:28:0x010d, B:19:0x0096, B:24:0x00f3, B:23:0x00ea, B:22:0x00e1, B:21:0x00d8, B:20:0x00d0, B:12:0x0074, B:14:0x007e, B:16:0x0088, B:7:0x005d, B:9:0x0067] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // org.mozilla.javascript.IdScriptableObject
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected int findPrototypeId(java.lang.String r4) {
        /*
            Method dump skipped, instructions count: 615
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.NativeArray.findPrototypeId(java.lang.String):int");
    }
}
