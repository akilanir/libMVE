package org.mozilla.javascript;

import java.util.AbstractCollection;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/NativeObject.class */
public class NativeObject extends IdScriptableObject implements Map {
    static final long serialVersionUID = -6345305608474346996L;
    private static final Object OBJECT_TAG = "Object";
    private static final int ConstructorId_getPrototypeOf = -1;
    private static final int ConstructorId_keys = -2;
    private static final int ConstructorId_getOwnPropertyNames = -3;
    private static final int ConstructorId_getOwnPropertyDescriptor = -4;
    private static final int ConstructorId_defineProperty = -5;
    private static final int ConstructorId_isExtensible = -6;
    private static final int ConstructorId_preventExtensions = -7;
    private static final int ConstructorId_defineProperties = -8;
    private static final int ConstructorId_create = -9;
    private static final int ConstructorId_isSealed = -10;
    private static final int ConstructorId_isFrozen = -11;
    private static final int ConstructorId_seal = -12;
    private static final int ConstructorId_freeze = -13;
    private static final int Id_constructor = 1;
    private static final int Id_toString = 2;
    private static final int Id_toLocaleString = 3;
    private static final int Id_valueOf = 4;
    private static final int Id_hasOwnProperty = 5;
    private static final int Id_propertyIsEnumerable = 6;
    private static final int Id_isPrototypeOf = 7;
    private static final int Id_toSource = 8;
    private static final int Id___defineGetter__ = 9;
    private static final int Id___defineSetter__ = 10;
    private static final int Id___lookupGetter__ = 11;
    private static final int Id___lookupSetter__ = 12;
    private static final int MAX_PROTOTYPE_ID = 12;

    static void init(Scriptable scope, boolean sealed) {
        NativeObject obj = new NativeObject();
        obj.exportAsJSClass(12, scope, sealed);
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public String getClassName() {
        return "Object";
    }

    public String toString() {
        return ScriptRuntime.defaultObjectToString(this);
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected void fillConstructorProperties(IdFunctionObject ctor) {
        addIdFunctionProperty(ctor, OBJECT_TAG, -1, "getPrototypeOf", 1);
        addIdFunctionProperty(ctor, OBJECT_TAG, ConstructorId_keys, "keys", 1);
        addIdFunctionProperty(ctor, OBJECT_TAG, ConstructorId_getOwnPropertyNames, "getOwnPropertyNames", 1);
        addIdFunctionProperty(ctor, OBJECT_TAG, ConstructorId_getOwnPropertyDescriptor, "getOwnPropertyDescriptor", 2);
        addIdFunctionProperty(ctor, OBJECT_TAG, ConstructorId_defineProperty, "defineProperty", 3);
        addIdFunctionProperty(ctor, OBJECT_TAG, ConstructorId_isExtensible, "isExtensible", 1);
        addIdFunctionProperty(ctor, OBJECT_TAG, ConstructorId_preventExtensions, "preventExtensions", 1);
        addIdFunctionProperty(ctor, OBJECT_TAG, ConstructorId_defineProperties, "defineProperties", 2);
        addIdFunctionProperty(ctor, OBJECT_TAG, ConstructorId_create, "create", 2);
        addIdFunctionProperty(ctor, OBJECT_TAG, ConstructorId_isSealed, "isSealed", 1);
        addIdFunctionProperty(ctor, OBJECT_TAG, ConstructorId_isFrozen, "isFrozen", 1);
        addIdFunctionProperty(ctor, OBJECT_TAG, ConstructorId_seal, "seal", 1);
        addIdFunctionProperty(ctor, OBJECT_TAG, ConstructorId_freeze, "freeze", 1);
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
                s = "valueOf";
                break;
            case 5:
                arity = 1;
                s = "hasOwnProperty";
                break;
            case 6:
                arity = 1;
                s = "propertyIsEnumerable";
                break;
            case 7:
                arity = 1;
                s = "isPrototypeOf";
                break;
            case 8:
                arity = 0;
                s = "toSource";
                break;
            case 9:
                arity = 2;
                s = "__defineGetter__";
                break;
            case 10:
                arity = 2;
                s = "__defineSetter__";
                break;
            case 11:
                arity = 1;
                s = "__lookupGetter__";
                break;
            case 12:
                arity = 1;
                s = "__lookupSetter__";
                break;
            default:
                throw new IllegalArgumentException(String.valueOf(id));
        }
        initPrototypeMethod(OBJECT_TAG, id, s, arity);
    }

    @Override // org.mozilla.javascript.IdScriptableObject, org.mozilla.javascript.IdFunctionCall
    public Object execIdCall(IdFunctionObject f, Context cx, Scriptable scope, Scriptable thisObj, Object[] args) {
        Object gs;
        Scriptable v;
        boolean result;
        boolean result2;
        if (!f.hasTag(OBJECT_TAG)) {
            return super.execIdCall(f, cx, scope, thisObj, args);
        }
        int id = f.methodId();
        switch (id) {
            case ConstructorId_freeze /* -13 */:
                Object arg = args.length < 1 ? Undefined.instance : args[0];
                ScriptableObject ensureScriptableObject = ensureScriptableObject(arg);
                Object[] arr$ = ensureScriptableObject.getAllIds();
                for (Object name : arr$) {
                    ScriptableObject ownPropertyDescriptor = ensureScriptableObject.getOwnPropertyDescriptor(cx, name);
                    if (isDataDescriptor(ownPropertyDescriptor) && Boolean.TRUE.equals(ownPropertyDescriptor.get("writable"))) {
                        ownPropertyDescriptor.put("writable", ownPropertyDescriptor, Boolean.FALSE);
                    }
                    if (Boolean.TRUE.equals(ownPropertyDescriptor.get("configurable"))) {
                        ownPropertyDescriptor.put("configurable", ownPropertyDescriptor, Boolean.FALSE);
                    }
                    ensureScriptableObject.defineOwnProperty(cx, name, ownPropertyDescriptor, false);
                }
                ensureScriptableObject.preventExtensions();
                return ensureScriptableObject;
            case ConstructorId_seal /* -12 */:
                Object arg2 = args.length < 1 ? Undefined.instance : args[0];
                ScriptableObject ensureScriptableObject2 = ensureScriptableObject(arg2);
                Object[] arr$2 = ensureScriptableObject2.getAllIds();
                for (Object name2 : arr$2) {
                    ScriptableObject ownPropertyDescriptor2 = ensureScriptableObject2.getOwnPropertyDescriptor(cx, name2);
                    if (Boolean.TRUE.equals(ownPropertyDescriptor2.get("configurable"))) {
                        ownPropertyDescriptor2.put("configurable", ownPropertyDescriptor2, Boolean.FALSE);
                        ensureScriptableObject2.defineOwnProperty(cx, name2, ownPropertyDescriptor2, false);
                    }
                }
                ensureScriptableObject2.preventExtensions();
                return ensureScriptableObject2;
            case ConstructorId_isFrozen /* -11 */:
                Object arg3 = args.length < 1 ? Undefined.instance : args[0];
                ScriptableObject obj = ensureScriptableObject(arg3);
                if (obj.isExtensible()) {
                    return Boolean.FALSE;
                }
                for (Object obj2 : obj.getAllIds()) {
                    ScriptableObject desc = obj.getOwnPropertyDescriptor(cx, obj2);
                    if (Boolean.TRUE.equals(desc.get("configurable"))) {
                        return Boolean.FALSE;
                    }
                    if (isDataDescriptor(desc) && Boolean.TRUE.equals(desc.get("writable"))) {
                        return Boolean.FALSE;
                    }
                }
                return Boolean.TRUE;
            case ConstructorId_isSealed /* -10 */:
                Object arg4 = args.length < 1 ? Undefined.instance : args[0];
                ScriptableObject obj3 = ensureScriptableObject(arg4);
                if (obj3.isExtensible()) {
                    return Boolean.FALSE;
                }
                for (Object obj4 : obj3.getAllIds()) {
                    Object configurable = obj3.getOwnPropertyDescriptor(cx, obj4).get("configurable");
                    if (Boolean.TRUE.equals(configurable)) {
                        return Boolean.FALSE;
                    }
                }
                return Boolean.TRUE;
            case ConstructorId_create /* -9 */:
                Object arg5 = args.length < 1 ? Undefined.instance : args[0];
                Scriptable obj5 = arg5 == null ? null : ensureScriptable(arg5);
                ScriptableObject newObject = new NativeObject();
                newObject.setParentScope(getParentScope());
                newObject.setPrototype(obj5);
                if (args.length > 1 && args[1] != Undefined.instance) {
                    Scriptable props = Context.toObject(args[1], getParentScope());
                    newObject.defineOwnProperties(cx, ensureScriptableObject(props));
                }
                return newObject;
            case ConstructorId_defineProperties /* -8 */:
                Object arg6 = args.length < 1 ? Undefined.instance : args[0];
                ScriptableObject obj6 = ensureScriptableObject(arg6);
                Object propsObj = args.length < 2 ? Undefined.instance : args[1];
                Scriptable props2 = Context.toObject(propsObj, getParentScope());
                obj6.defineOwnProperties(cx, ensureScriptableObject(props2));
                return obj6;
            case ConstructorId_preventExtensions /* -7 */:
                Object arg7 = args.length < 1 ? Undefined.instance : args[0];
                ScriptableObject obj7 = ensureScriptableObject(arg7);
                obj7.preventExtensions();
                return obj7;
            case ConstructorId_isExtensible /* -6 */:
                Object arg8 = args.length < 1 ? Undefined.instance : args[0];
                return Boolean.valueOf(ensureScriptableObject(arg8).isExtensible());
            case ConstructorId_defineProperty /* -5 */:
                Object arg9 = args.length < 1 ? Undefined.instance : args[0];
                ScriptableObject obj8 = ensureScriptableObject(arg9);
                Object name3 = args.length < 2 ? Undefined.instance : args[1];
                Object descArg = args.length < 3 ? Undefined.instance : args[2];
                obj8.defineOwnProperty(cx, name3, ensureScriptableObject(descArg));
                return obj8;
            case ConstructorId_getOwnPropertyDescriptor /* -4 */:
                Object arg10 = args.length < 1 ? Undefined.instance : args[0];
                ScriptableObject obj9 = ensureScriptableObject(arg10);
                Object nameArg = args.length < 2 ? Undefined.instance : args[1];
                Scriptable desc2 = obj9.getOwnPropertyDescriptor(cx, ScriptRuntime.toString(nameArg));
                return desc2 == null ? Undefined.instance : desc2;
            case ConstructorId_getOwnPropertyNames /* -3 */:
                Object arg11 = args.length < 1 ? Undefined.instance : args[0];
                Object[] ids = ensureScriptableObject(arg11).getAllIds();
                for (int i = 0; i < ids.length; i++) {
                    ids[i] = ScriptRuntime.toString(ids[i]);
                }
                return cx.newArray(scope, ids);
            case ConstructorId_keys /* -2 */:
                Object arg12 = args.length < 1 ? Undefined.instance : args[0];
                Object[] ids2 = ensureScriptable(arg12).getIds();
                for (int i2 = 0; i2 < ids2.length; i2++) {
                    ids2[i2] = ScriptRuntime.toString(ids2[i2]);
                }
                return cx.newArray(scope, ids2);
            case -1:
                Object arg13 = args.length < 1 ? Undefined.instance : args[0];
                return ensureScriptable(arg13).getPrototype();
            case 0:
            default:
                throw new IllegalArgumentException(String.valueOf(id));
            case 1:
                if (thisObj != null) {
                    return f.construct(cx, scope, args);
                }
                if (args.length == 0 || args[0] == null || args[0] == Undefined.instance) {
                    return new NativeObject();
                }
                return ScriptRuntime.toObject(cx, scope, args[0]);
            case 2:
                if (cx.hasFeature(4)) {
                    String s = ScriptRuntime.defaultObjectToSource(cx, scope, thisObj, args);
                    int L = s.length();
                    if (L != 0 && s.charAt(0) == '(' && s.charAt(L - 1) == ')') {
                        s = s.substring(1, L - 1);
                    }
                    return s;
                }
                return ScriptRuntime.defaultObjectToString(thisObj);
            case 3:
                Object toString = ScriptableObject.getProperty(thisObj, "toString");
                if (!(toString instanceof Callable)) {
                    throw ScriptRuntime.notFunctionError(toString);
                }
                Callable fun = (Callable) toString;
                return fun.call(cx, scope, thisObj, ScriptRuntime.emptyArgs);
            case 4:
                return thisObj;
            case 5:
                Object arg14 = args.length < 1 ? Undefined.instance : args[0];
                String s2 = ScriptRuntime.toStringIdOrIndex(cx, arg14);
                if (s2 == null) {
                    int index = ScriptRuntime.lastIndexResult(cx);
                    result2 = thisObj.has(index, thisObj);
                } else {
                    result2 = thisObj.has(s2, thisObj);
                }
                return ScriptRuntime.wrapBoolean(result2);
            case 6:
                Object arg15 = args.length < 1 ? Undefined.instance : args[0];
                String s3 = ScriptRuntime.toStringIdOrIndex(cx, arg15);
                if (s3 == null) {
                    int index2 = ScriptRuntime.lastIndexResult(cx);
                    result = thisObj.has(index2, thisObj);
                    if (result && (thisObj instanceof ScriptableObject)) {
                        ScriptableObject so = (ScriptableObject) thisObj;
                        int attrs = so.getAttributes(index2);
                        result = (attrs & 2) == 0;
                    }
                } else {
                    result = thisObj.has(s3, thisObj);
                    if (result && (thisObj instanceof ScriptableObject)) {
                        ScriptableObject so2 = (ScriptableObject) thisObj;
                        int attrs2 = so2.getAttributes(s3);
                        result = (attrs2 & 2) == 0;
                    }
                }
                return ScriptRuntime.wrapBoolean(result);
            case 7:
                boolean result3 = false;
                if (args.length != 0 && (args[0] instanceof Scriptable)) {
                    Scriptable v2 = (Scriptable) args[0];
                    while (true) {
                        v2 = v2.getPrototype();
                        if (v2 == thisObj) {
                            result3 = true;
                        } else if (v2 == null) {
                        }
                    }
                }
                return ScriptRuntime.wrapBoolean(result3);
            case 8:
                return ScriptRuntime.defaultObjectToSource(cx, scope, thisObj, args);
            case 9:
            case 10:
                if (args.length < 2 || !(args[1] instanceof Callable)) {
                    Object badArg = args.length >= 2 ? args[1] : Undefined.instance;
                    throw ScriptRuntime.notFunctionError(badArg);
                }
                if (!(thisObj instanceof ScriptableObject)) {
                    throw Context.reportRuntimeError2("msg.extend.scriptable", thisObj.getClass().getName(), String.valueOf(args[0]));
                }
                ScriptableObject so3 = (ScriptableObject) thisObj;
                String name4 = ScriptRuntime.toStringIdOrIndex(cx, args[0]);
                int index3 = name4 != null ? 0 : ScriptRuntime.lastIndexResult(cx);
                Callable getterOrSetter = (Callable) args[1];
                boolean isSetter = id == 10;
                so3.setGetterOrSetter(name4, index3, getterOrSetter, isSetter);
                if (so3 instanceof NativeArray) {
                    ((NativeArray) so3).setDenseOnly(false);
                }
                return Undefined.instance;
            case 11:
            case 12:
                if (args.length < 1 || !(thisObj instanceof ScriptableObject)) {
                    return Undefined.instance;
                }
                ScriptableObject so4 = (ScriptableObject) thisObj;
                String name5 = ScriptRuntime.toStringIdOrIndex(cx, args[0]);
                int index4 = name5 != null ? 0 : ScriptRuntime.lastIndexResult(cx);
                boolean isSetter2 = id == 12;
                while (true) {
                    gs = so4.getGetterOrSetter(name5, index4, isSetter2);
                    if (gs == null && (v = so4.getPrototype()) != null && (v instanceof ScriptableObject)) {
                        so4 = (ScriptableObject) v;
                    }
                }
                if (gs != null) {
                    return gs;
                }
                return Undefined.instance;
        }
    }

    @Override // java.util.Map
    public boolean containsKey(Object key) {
        if (key instanceof String) {
            return has((String) key, this);
        }
        if (key instanceof Number) {
            return has(((Number) key).intValue(), this);
        }
        return false;
    }

    @Override // java.util.Map
    public boolean containsValue(Object value) {
        for (Object obj : values()) {
            if (value == obj) {
                return true;
            }
            if (value != null && value.equals(obj)) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.Map
    public Object remove(Object key) {
        Object value = get(key);
        if (key instanceof String) {
            delete((String) key);
        } else if (key instanceof Number) {
            delete(((Number) key).intValue());
        }
        return value;
    }

    @Override // java.util.Map
    public Set<Object> keySet() {
        return new KeySet();
    }

    @Override // java.util.Map
    public Collection<Object> values() {
        return new ValueCollection();
    }

    @Override // java.util.Map
    public Set<Map.Entry<Object, Object>> entrySet() {
        return new EntrySet();
    }

    @Override // java.util.Map
    public Object put(Object key, Object value) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public void putAll(Map m) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public void clear() {
        throw new UnsupportedOperationException();
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/NativeObject$EntrySet.class */
    class EntrySet extends AbstractSet<Map.Entry<Object, Object>> {
        EntrySet() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<Map.Entry<Object, Object>> iterator() {
            return new Iterator<Map.Entry<Object, Object>>() { // from class: org.mozilla.javascript.NativeObject.EntrySet.1
                Object[] ids;
                Object key = null;
                int index = 0;

                {
                    this.ids = NativeObject.this.getIds();
                }

                @Override // java.util.Iterator
                public boolean hasNext() {
                    return this.index < this.ids.length;
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // java.util.Iterator
                public Map.Entry<Object, Object> next() {
                    Object[] objArr = this.ids;
                    int i = this.index;
                    this.index = i + 1;
                    final Object ekey = objArr[i];
                    this.key = ekey;
                    final Object value = NativeObject.this.get(this.key);
                    return new Map.Entry<Object, Object>() { // from class: org.mozilla.javascript.NativeObject.EntrySet.1.1
                        @Override // java.util.Map.Entry
                        public Object getKey() {
                            return ekey;
                        }

                        @Override // java.util.Map.Entry
                        public Object getValue() {
                            return value;
                        }

                        @Override // java.util.Map.Entry
                        public Object setValue(Object value2) {
                            throw new UnsupportedOperationException();
                        }

                        @Override // java.util.Map.Entry
                        public boolean equals(Object other) {
                            if (!(other instanceof Map.Entry)) {
                                return false;
                            }
                            Map.Entry<?, ?> e = (Map.Entry) other;
                            if (ekey != null ? ekey.equals(e.getKey()) : e.getKey() == null) {
                                if (value != null ? value.equals(e.getValue()) : e.getValue() == null) {
                                    return true;
                                }
                            }
                            return false;
                        }

                        @Override // java.util.Map.Entry
                        public int hashCode() {
                            return (ekey == null ? 0 : ekey.hashCode()) ^ (value == null ? 0 : value.hashCode());
                        }

                        public String toString() {
                            return ekey + "=" + value;
                        }
                    };
                }

                @Override // java.util.Iterator
                public void remove() {
                    if (this.key == null) {
                        throw new IllegalStateException();
                    }
                    NativeObject.this.remove(this.key);
                    this.key = null;
                }
            };
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return NativeObject.this.size();
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/NativeObject$KeySet.class */
    class KeySet extends AbstractSet<Object> {
        KeySet() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(Object key) {
            return NativeObject.this.containsKey(key);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<Object> iterator() {
            return new Iterator<Object>() { // from class: org.mozilla.javascript.NativeObject.KeySet.1
                Object[] ids;
                Object key;
                int index = 0;

                {
                    this.ids = NativeObject.this.getIds();
                }

                @Override // java.util.Iterator
                public boolean hasNext() {
                    return this.index < this.ids.length;
                }

                @Override // java.util.Iterator
                public Object next() {
                    try {
                        Object[] objArr = this.ids;
                        int i = this.index;
                        this.index = i + 1;
                        Object obj = objArr[i];
                        this.key = obj;
                        return obj;
                    } catch (ArrayIndexOutOfBoundsException e) {
                        this.key = null;
                        throw new NoSuchElementException();
                    }
                }

                @Override // java.util.Iterator
                public void remove() {
                    if (this.key == null) {
                        throw new IllegalStateException();
                    }
                    NativeObject.this.remove(this.key);
                    this.key = null;
                }
            };
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return NativeObject.this.size();
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/NativeObject$ValueCollection.class */
    class ValueCollection extends AbstractCollection<Object> {
        ValueCollection() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public Iterator<Object> iterator() {
            return new Iterator<Object>() { // from class: org.mozilla.javascript.NativeObject.ValueCollection.1
                Object[] ids;
                Object key;
                int index = 0;

                {
                    this.ids = NativeObject.this.getIds();
                }

                @Override // java.util.Iterator
                public boolean hasNext() {
                    return this.index < this.ids.length;
                }

                @Override // java.util.Iterator
                public Object next() {
                    NativeObject nativeObject = NativeObject.this;
                    Object[] objArr = this.ids;
                    int i = this.index;
                    this.index = i + 1;
                    Object obj = objArr[i];
                    this.key = obj;
                    return nativeObject.get(obj);
                }

                @Override // java.util.Iterator
                public void remove() {
                    if (this.key == null) {
                        throw new IllegalStateException();
                    }
                    NativeObject.this.remove(this.key);
                    this.key = null;
                }
            };
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public int size() {
            return NativeObject.this.size();
        }
    }

    @Override // org.mozilla.javascript.IdScriptableObject
    protected int findPrototypeId(String s) {
        int id = 0;
        String X = null;
        switch (s.length()) {
            case 7:
                X = "valueOf";
                id = 4;
                break;
            case 8:
                int c = s.charAt(3);
                if (c != 111) {
                    if (c == 116) {
                        X = "toString";
                        id = 2;
                        break;
                    }
                } else {
                    X = "toSource";
                    id = 8;
                    break;
                }
                break;
            case 11:
                X = "constructor";
                id = 1;
                break;
            case 13:
                X = "isPrototypeOf";
                id = 7;
                break;
            case 14:
                int c2 = s.charAt(0);
                if (c2 != 104) {
                    if (c2 == 116) {
                        X = "toLocaleString";
                        id = 3;
                        break;
                    }
                } else {
                    X = "hasOwnProperty";
                    id = 5;
                    break;
                }
                break;
            case 16:
                int c3 = s.charAt(2);
                if (c3 == 100) {
                    int c4 = s.charAt(8);
                    if (c4 != 71) {
                        if (c4 == 83) {
                            X = "__defineSetter__";
                            id = 10;
                            break;
                        }
                    } else {
                        X = "__defineGetter__";
                        id = 9;
                        break;
                    }
                } else if (c3 == 108) {
                    int c5 = s.charAt(8);
                    if (c5 != 71) {
                        if (c5 == 83) {
                            X = "__lookupSetter__";
                            id = 12;
                            break;
                        }
                    } else {
                        X = "__lookupGetter__";
                        id = 11;
                        break;
                    }
                }
                break;
            case 20:
                X = "propertyIsEnumerable";
                id = 6;
                break;
        }
        if (X != null && X != s && !X.equals(s)) {
            id = 0;
        }
        return id;
    }
}
