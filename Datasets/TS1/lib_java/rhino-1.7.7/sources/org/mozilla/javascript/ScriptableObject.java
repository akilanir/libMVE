package org.mozilla.javascript;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;
import org.mozilla.javascript.TopLevel;
import org.mozilla.javascript.annotations.JSFunction;
import org.mozilla.javascript.annotations.JSGetter;
import org.mozilla.javascript.annotations.JSSetter;
import org.mozilla.javascript.annotations.JSStaticFunction;
import org.mozilla.javascript.debug.DebuggableObject;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ScriptableObject.class */
public abstract class ScriptableObject implements Scriptable, Serializable, DebuggableObject, ConstProperties {
    static final long serialVersionUID = 2829861078851942586L;
    public static final int EMPTY = 0;
    public static final int READONLY = 1;
    public static final int DONTENUM = 2;
    public static final int PERMANENT = 4;
    public static final int UNINITIALIZED_CONST = 8;
    public static final int CONST = 13;
    private Scriptable prototypeObject;
    private Scriptable parentScopeObject;
    private transient Slot[] slots;
    private int count;
    private transient ExternalArrayData externalData;
    private transient Slot firstAdded;
    private transient Slot lastAdded;
    private volatile Map<Object, Object> associatedValues;
    private static final int SLOT_QUERY = 1;
    private static final int SLOT_MODIFY = 2;
    private static final int SLOT_MODIFY_CONST = 3;
    private static final int SLOT_MODIFY_GETTER_SETTER = 4;
    private static final int SLOT_CONVERT_ACCESSOR_TO_DATA = 5;
    private static final int INITIAL_SLOT_SIZE = 4;
    private boolean isExtensible = true;
    private static final Method GET_ARRAY_LENGTH;
    static final /* synthetic */ boolean $assertionsDisabled;

    @Override // org.mozilla.javascript.Scriptable
    public abstract String getClassName();

    static {
        $assertionsDisabled = !ScriptableObject.class.desiredAssertionStatus();
        try {
            GET_ARRAY_LENGTH = ScriptableObject.class.getMethod("getExternalArrayLength", new Class[0]);
        } catch (NoSuchMethodException nsm) {
            throw new RuntimeException(nsm);
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ScriptableObject$Slot.class */
    private static class Slot implements Serializable {
        private static final long serialVersionUID = -6090581677123995491L;
        String name;
        int indexOrHash;
        private volatile short attributes;
        volatile transient boolean wasDeleted;
        volatile Object value;
        transient Slot next;
        volatile transient Slot orderedNext;

        Slot(String name, int indexOrHash, int attributes) {
            this.name = name;
            this.indexOrHash = indexOrHash;
            this.attributes = (short) attributes;
        }

        private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
            in.defaultReadObject();
            if (this.name != null) {
                this.indexOrHash = this.name.hashCode();
            }
        }

        boolean setValue(Object value, Scriptable owner, Scriptable start) {
            if ((this.attributes & 1) != 0) {
                return true;
            }
            if (owner == start) {
                this.value = value;
                return true;
            }
            return false;
        }

        Object getValue(Scriptable start) {
            return this.value;
        }

        int getAttributes() {
            return this.attributes;
        }

        synchronized void setAttributes(int value) {
            ScriptableObject.checkValidAttributes(value);
            this.attributes = (short) value;
        }

        void markDeleted() {
            this.wasDeleted = true;
            this.value = null;
            this.name = null;
        }

        ScriptableObject getPropertyDescriptor(Context cx, Scriptable scope) {
            return ScriptableObject.buildDataDescriptor(scope, this.value, this.attributes);
        }
    }

    protected static ScriptableObject buildDataDescriptor(Scriptable scope, Object value, int attributes) {
        ScriptableObject desc = new NativeObject();
        ScriptRuntime.setBuiltinProtoAndParent(desc, scope, TopLevel.Builtins.Object);
        desc.defineProperty("value", value, 0);
        desc.defineProperty("writable", Boolean.valueOf((attributes & 1) == 0), 0);
        desc.defineProperty("enumerable", Boolean.valueOf((attributes & 2) == 0), 0);
        desc.defineProperty("configurable", Boolean.valueOf((attributes & 4) == 0), 0);
        return desc;
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ScriptableObject$GetterSlot.class */
    private static final class GetterSlot extends Slot {
        static final long serialVersionUID = -4900574849788797588L;
        Object getter;
        Object setter;

        GetterSlot(String name, int indexOrHash, int attributes) {
            super(name, indexOrHash, attributes);
        }

        @Override // org.mozilla.javascript.ScriptableObject.Slot
        ScriptableObject getPropertyDescriptor(Context cx, Scriptable scope) {
            int attr = getAttributes();
            ScriptableObject desc = new NativeObject();
            ScriptRuntime.setBuiltinProtoAndParent(desc, scope, TopLevel.Builtins.Object);
            desc.defineProperty("enumerable", Boolean.valueOf((attr & 2) == 0), 0);
            desc.defineProperty("configurable", Boolean.valueOf((attr & 4) == 0), 0);
            if (this.getter != null) {
                desc.defineProperty("get", this.getter, 0);
            }
            if (this.setter != null) {
                desc.defineProperty("set", this.setter, 0);
            }
            return desc;
        }

        @Override // org.mozilla.javascript.ScriptableObject.Slot
        boolean setValue(Object value, Scriptable owner, Scriptable start) {
            Object setterThis;
            Object[] args;
            if (this.setter == null) {
                if (this.getter != null) {
                    if (Context.getContext().hasFeature(11)) {
                        throw ScriptRuntime.typeError1("msg.set.prop.no.setter", this.name);
                    }
                    return true;
                }
                return super.setValue(value, owner, start);
            }
            Context cx = Context.getContext();
            if (!(this.setter instanceof MemberBox)) {
                if (this.setter instanceof Function) {
                    Function f = (Function) this.setter;
                    f.call(cx, f.getParentScope(), start, new Object[]{value});
                    return true;
                }
                return true;
            }
            MemberBox nativeSetter = (MemberBox) this.setter;
            Class<?>[] pTypes = nativeSetter.argTypes;
            Class<?> valueType = pTypes[pTypes.length - 1];
            int tag = FunctionObject.getTypeTag(valueType);
            Object actualArg = FunctionObject.convertArg(cx, start, value, tag);
            if (nativeSetter.delegateTo == null) {
                setterThis = start;
                args = new Object[]{actualArg};
            } else {
                setterThis = nativeSetter.delegateTo;
                args = new Object[]{start, actualArg};
            }
            nativeSetter.invoke(setterThis, args);
            return true;
        }

        @Override // org.mozilla.javascript.ScriptableObject.Slot
        Object getValue(Scriptable start) {
            Object getterThis;
            Object[] args;
            if (this.getter != null) {
                if (this.getter instanceof MemberBox) {
                    MemberBox nativeGetter = (MemberBox) this.getter;
                    if (nativeGetter.delegateTo == null) {
                        getterThis = start;
                        args = ScriptRuntime.emptyArgs;
                    } else {
                        getterThis = nativeGetter.delegateTo;
                        args = new Object[]{start};
                    }
                    return nativeGetter.invoke(getterThis, args);
                }
                if (this.getter instanceof Function) {
                    Function f = (Function) this.getter;
                    Context cx = Context.getContext();
                    return f.call(cx, f.getParentScope(), start, ScriptRuntime.emptyArgs);
                }
            }
            Object val = this.value;
            if (val instanceof LazilyLoadedCtor) {
                LazilyLoadedCtor initializer = (LazilyLoadedCtor) val;
                try {
                    initializer.init();
                    Object value = initializer.getValue();
                    val = value;
                    this.value = value;
                } catch (Throwable th) {
                    this.value = initializer.getValue();
                    throw th;
                }
            }
            return val;
        }

        @Override // org.mozilla.javascript.ScriptableObject.Slot
        void markDeleted() {
            super.markDeleted();
            this.getter = null;
            this.setter = null;
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ScriptableObject$RelinkedSlot.class */
    private static class RelinkedSlot extends Slot {
        final Slot slot;

        RelinkedSlot(Slot slot) {
            super(slot.name, slot.indexOrHash, slot.attributes);
            this.slot = ScriptableObject.unwrapSlot(slot);
        }

        @Override // org.mozilla.javascript.ScriptableObject.Slot
        boolean setValue(Object value, Scriptable owner, Scriptable start) {
            return this.slot.setValue(value, owner, start);
        }

        @Override // org.mozilla.javascript.ScriptableObject.Slot
        Object getValue(Scriptable start) {
            return this.slot.getValue(start);
        }

        @Override // org.mozilla.javascript.ScriptableObject.Slot
        ScriptableObject getPropertyDescriptor(Context cx, Scriptable scope) {
            return this.slot.getPropertyDescriptor(cx, scope);
        }

        @Override // org.mozilla.javascript.ScriptableObject.Slot
        int getAttributes() {
            return this.slot.getAttributes();
        }

        @Override // org.mozilla.javascript.ScriptableObject.Slot
        void setAttributes(int value) {
            this.slot.setAttributes(value);
        }

        @Override // org.mozilla.javascript.ScriptableObject.Slot
        void markDeleted() {
            super.markDeleted();
            this.slot.markDeleted();
        }

        private void writeObject(ObjectOutputStream out) throws IOException {
            out.writeObject(this.slot);
        }
    }

    static void checkValidAttributes(int attributes) {
        if ((attributes & (-16)) != 0) {
            throw new IllegalArgumentException(String.valueOf(attributes));
        }
    }

    public ScriptableObject() {
    }

    public ScriptableObject(Scriptable scope, Scriptable prototype) {
        if (scope == null) {
            throw new IllegalArgumentException();
        }
        this.parentScopeObject = scope;
        this.prototypeObject = prototype;
    }

    public String getTypeOf() {
        return avoidObjectDetection() ? "undefined" : "object";
    }

    @Override // org.mozilla.javascript.Scriptable
    public boolean has(String name, Scriptable start) {
        return null != getSlot(name, 0, 1);
    }

    @Override // org.mozilla.javascript.Scriptable
    public boolean has(int index, Scriptable start) {
        return this.externalData != null ? index < this.externalData.getArrayLength() : null != getSlot((String) null, index, 1);
    }

    @Override // org.mozilla.javascript.Scriptable
    public Object get(String name, Scriptable start) {
        Slot slot = getSlot(name, 0, 1);
        if (slot == null) {
            return Scriptable.NOT_FOUND;
        }
        return slot.getValue(start);
    }

    @Override // org.mozilla.javascript.Scriptable
    public Object get(int index, Scriptable start) {
        if (this.externalData != null) {
            if (index < this.externalData.getArrayLength()) {
                return this.externalData.getArrayElement(index);
            }
            return Scriptable.NOT_FOUND;
        }
        Slot slot = getSlot((String) null, index, 1);
        if (slot == null) {
            return Scriptable.NOT_FOUND;
        }
        return slot.getValue(start);
    }

    @Override // org.mozilla.javascript.Scriptable
    public void put(String name, Scriptable start, Object value) {
        if (putImpl(name, 0, start, value)) {
            return;
        }
        if (start == this) {
            throw Kit.codeBug();
        }
        start.put(name, start, value);
    }

    @Override // org.mozilla.javascript.Scriptable
    public void put(int index, Scriptable start, Object value) {
        if (this.externalData != null) {
            if (index < this.externalData.getArrayLength()) {
                this.externalData.setArrayElement(index, value);
                return;
            }
            throw new JavaScriptException(ScriptRuntime.newNativeError(Context.getCurrentContext(), this, TopLevel.NativeErrors.RangeError, new Object[]{"External array index out of bounds "}), null, 0);
        }
        if (putImpl(null, index, start, value)) {
            return;
        }
        if (start == this) {
            throw Kit.codeBug();
        }
        start.put(index, start, value);
    }

    @Override // org.mozilla.javascript.Scriptable
    public void delete(String name) {
        checkNotSealed(name, 0);
        removeSlot(name, 0);
    }

    @Override // org.mozilla.javascript.Scriptable
    public void delete(int index) {
        checkNotSealed(null, index);
        removeSlot(null, index);
    }

    @Override // org.mozilla.javascript.ConstProperties
    public void putConst(String name, Scriptable start, Object value) {
        if (putConstImpl(name, 0, start, value, 1)) {
            return;
        }
        if (start == this) {
            throw Kit.codeBug();
        }
        if (start instanceof ConstProperties) {
            ((ConstProperties) start).putConst(name, start, value);
        } else {
            start.put(name, start, value);
        }
    }

    @Override // org.mozilla.javascript.ConstProperties
    public void defineConst(String name, Scriptable start) {
        if (putConstImpl(name, 0, start, Undefined.instance, 8)) {
            return;
        }
        if (start == this) {
            throw Kit.codeBug();
        }
        if (start instanceof ConstProperties) {
            ((ConstProperties) start).defineConst(name, start);
        }
    }

    @Override // org.mozilla.javascript.ConstProperties
    public boolean isConst(String name) {
        Slot slot = getSlot(name, 0, 1);
        return slot != null && (slot.getAttributes() & 5) == 5;
    }

    @Deprecated
    public final int getAttributes(String name, Scriptable start) {
        return getAttributes(name);
    }

    @Deprecated
    public final int getAttributes(int index, Scriptable start) {
        return getAttributes(index);
    }

    @Deprecated
    public final void setAttributes(String name, Scriptable start, int attributes) {
        setAttributes(name, attributes);
    }

    @Deprecated
    public void setAttributes(int index, Scriptable start, int attributes) {
        setAttributes(index, attributes);
    }

    public int getAttributes(String name) {
        return findAttributeSlot(name, 0, 1).getAttributes();
    }

    public int getAttributes(int index) {
        return findAttributeSlot(null, index, 1).getAttributes();
    }

    public void setAttributes(String name, int attributes) {
        checkNotSealed(name, 0);
        findAttributeSlot(name, 0, 2).setAttributes(attributes);
    }

    public void setAttributes(int index, int attributes) {
        checkNotSealed(null, index);
        findAttributeSlot(null, index, 2).setAttributes(attributes);
    }

    public void setGetterOrSetter(String name, int index, Callable getterOrSetter, boolean isSetter) {
        setGetterOrSetter(name, index, getterOrSetter, isSetter, false);
    }

    private void setGetterOrSetter(String name, int index, Callable getterOrSetter, boolean isSetter, boolean force) {
        GetterSlot gslot;
        if (name != null && index != 0) {
            throw new IllegalArgumentException(name);
        }
        if (!force) {
            checkNotSealed(name, index);
        }
        if (isExtensible()) {
            gslot = (GetterSlot) getSlot(name, index, 4);
        } else {
            Slot slot = unwrapSlot(getSlot(name, index, 1));
            if (!(slot instanceof GetterSlot)) {
                return;
            } else {
                gslot = (GetterSlot) slot;
            }
        }
        if (!force) {
            int attributes = gslot.getAttributes();
            if ((attributes & 1) != 0) {
                throw Context.reportRuntimeError1("msg.modify.readonly", name);
            }
        }
        if (isSetter) {
            gslot.setter = getterOrSetter;
        } else {
            gslot.getter = getterOrSetter;
        }
        gslot.value = Undefined.instance;
    }

    public Object getGetterOrSetter(String name, int index, boolean isSetter) {
        if (name != null && index != 0) {
            throw new IllegalArgumentException(name);
        }
        Slot slot = unwrapSlot(getSlot(name, index, 1));
        if (slot == null) {
            return null;
        }
        if (slot instanceof GetterSlot) {
            GetterSlot gslot = (GetterSlot) slot;
            Object result = isSetter ? gslot.setter : gslot.getter;
            return result != null ? result : Undefined.instance;
        }
        return Undefined.instance;
    }

    protected boolean isGetterOrSetter(String name, int index, boolean setter) {
        Slot slot = unwrapSlot(getSlot(name, index, 1));
        if (slot instanceof GetterSlot) {
            if (!setter || ((GetterSlot) slot).setter == null) {
                return (setter || ((GetterSlot) slot).getter == null) ? false : true;
            }
            return true;
        }
        return false;
    }

    void addLazilyInitializedValue(String name, int index, LazilyLoadedCtor init, int attributes) {
        if (name != null && index != 0) {
            throw new IllegalArgumentException(name);
        }
        checkNotSealed(name, index);
        GetterSlot gslot = (GetterSlot) getSlot(name, index, 4);
        gslot.setAttributes(attributes);
        gslot.getter = null;
        gslot.setter = null;
        gslot.value = init;
    }

    public void setExternalArrayData(ExternalArrayData array) {
        this.externalData = array;
        if (array == null) {
            delete("length");
        } else {
            defineProperty("length", null, GET_ARRAY_LENGTH, null, 3);
        }
    }

    public ExternalArrayData getExternalArrayData() {
        return this.externalData;
    }

    public Object getExternalArrayLength() {
        return Integer.valueOf(this.externalData == null ? 0 : this.externalData.getArrayLength());
    }

    @Override // org.mozilla.javascript.Scriptable
    public Scriptable getPrototype() {
        return this.prototypeObject;
    }

    @Override // org.mozilla.javascript.Scriptable
    public void setPrototype(Scriptable m) {
        this.prototypeObject = m;
    }

    @Override // org.mozilla.javascript.Scriptable
    public Scriptable getParentScope() {
        return this.parentScopeObject;
    }

    @Override // org.mozilla.javascript.Scriptable
    public void setParentScope(Scriptable m) {
        this.parentScopeObject = m;
    }

    @Override // org.mozilla.javascript.Scriptable
    public Object[] getIds() {
        return getIds(false);
    }

    public Object[] getAllIds() {
        return getIds(true);
    }

    @Override // org.mozilla.javascript.Scriptable
    public Object getDefaultValue(Class<?> typeHint) {
        return getDefaultValue(this, typeHint);
    }

    public static Object getDefaultValue(Scriptable object, Class<?> typeHint) {
        boolean tryToString;
        String methodName;
        Object[] args;
        String hint;
        Context cx = null;
        int i = 0;
        while (i < 2) {
            if (typeHint == ScriptRuntime.StringClass) {
                tryToString = i == 0;
            } else {
                tryToString = i == 1;
            }
            if (tryToString) {
                methodName = "toString";
                args = ScriptRuntime.emptyArgs;
            } else {
                methodName = "valueOf";
                args = new Object[1];
                if (typeHint == null) {
                    hint = "undefined";
                } else if (typeHint == ScriptRuntime.StringClass) {
                    hint = "string";
                } else if (typeHint == ScriptRuntime.ScriptableClass) {
                    hint = "object";
                } else if (typeHint == ScriptRuntime.FunctionClass) {
                    hint = "function";
                } else if (typeHint == ScriptRuntime.BooleanClass || typeHint == Boolean.TYPE) {
                    hint = "boolean";
                } else if (typeHint == ScriptRuntime.NumberClass || typeHint == ScriptRuntime.ByteClass || typeHint == Byte.TYPE || typeHint == ScriptRuntime.ShortClass || typeHint == Short.TYPE || typeHint == ScriptRuntime.IntegerClass || typeHint == Integer.TYPE || typeHint == ScriptRuntime.FloatClass || typeHint == Float.TYPE || typeHint == ScriptRuntime.DoubleClass || typeHint == Double.TYPE) {
                    hint = "number";
                } else {
                    throw Context.reportRuntimeError1("msg.invalid.type", typeHint.toString());
                }
                args[0] = hint;
            }
            Object v = getProperty(object, methodName);
            if (v instanceof Function) {
                Function fun = (Function) v;
                if (cx == null) {
                    cx = Context.getContext();
                }
                Object v2 = fun.call(cx, fun.getParentScope(), object, args);
                if (v2 == null) {
                    continue;
                } else {
                    if (!(v2 instanceof Scriptable)) {
                        return v2;
                    }
                    if (typeHint == ScriptRuntime.ScriptableClass || typeHint == ScriptRuntime.FunctionClass) {
                        return v2;
                    }
                    if (tryToString && (v2 instanceof Wrapper)) {
                        Object u = ((Wrapper) v2).unwrap();
                        if (u instanceof String) {
                            return u;
                        }
                    }
                }
            }
            i++;
        }
        String arg = typeHint == null ? "undefined" : typeHint.getName();
        throw ScriptRuntime.typeError1("msg.default.value", arg);
    }

    @Override // org.mozilla.javascript.Scriptable
    public boolean hasInstance(Scriptable instance) {
        return ScriptRuntime.jsDelegatesTo(instance, this);
    }

    public boolean avoidObjectDetection() {
        return false;
    }

    protected Object equivalentValues(Object value) {
        return this == value ? Boolean.TRUE : Scriptable.NOT_FOUND;
    }

    public static <T extends Scriptable> void defineClass(Scriptable scope, Class<T> clazz) throws IllegalAccessException, InstantiationException, InvocationTargetException {
        defineClass(scope, clazz, false, false);
    }

    public static <T extends Scriptable> void defineClass(Scriptable scope, Class<T> clazz, boolean sealed) throws IllegalAccessException, InstantiationException, InvocationTargetException {
        defineClass(scope, clazz, sealed, false);
    }

    public static <T extends Scriptable> String defineClass(Scriptable scope, Class<T> clazz, boolean sealed, boolean mapInheritance) throws IllegalAccessException, InstantiationException, InvocationTargetException {
        BaseFunction ctor = buildClassCtor(scope, clazz, sealed, mapInheritance);
        if (ctor == null) {
            return null;
        }
        String name = ctor.getClassPrototype().getClassName();
        defineProperty(scope, name, ctor, 2);
        return name;
    }

    /* JADX WARN: Removed duplicated region for block: B:110:0x02dd  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x03a3  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x03af  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x03b4  */
    /* JADX WARN: Removed duplicated region for block: B:156:0x03d7  */
    /* JADX WARN: Removed duplicated region for block: B:206:0x03cd A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static <T extends org.mozilla.javascript.Scriptable> org.mozilla.javascript.BaseFunction buildClassCtor(org.mozilla.javascript.Scriptable r7, java.lang.Class<T> r8, boolean r9, boolean r10) throws java.lang.IllegalAccessException, java.lang.InstantiationException, java.lang.reflect.InvocationTargetException {
        /*
            Method dump skipped, instructions count: 1235
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.ScriptableObject.buildClassCtor(org.mozilla.javascript.Scriptable, java.lang.Class, boolean, boolean):org.mozilla.javascript.BaseFunction");
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static Member findAnnotatedMember(AccessibleObject[] accessibleObjectArr, Class<? extends Annotation> annotation) {
        for (Method method : accessibleObjectArr) {
            if (method.isAnnotationPresent(annotation)) {
                return method;
            }
        }
        return null;
    }

    private static Method findSetterMethod(Method[] methods, String name, String prefix) {
        String newStyleName = "set" + Character.toUpperCase(name.charAt(0)) + name.substring(1);
        for (Method method : methods) {
            JSSetter annotation = (JSSetter) method.getAnnotation(JSSetter.class);
            if (annotation != null && (name.equals(annotation.value()) || ("".equals(annotation.value()) && newStyleName.equals(method.getName())))) {
                return method;
            }
        }
        String oldStyleName = prefix + name;
        for (Method method2 : methods) {
            if (oldStyleName.equals(method2.getName())) {
                return method2;
            }
        }
        return null;
    }

    private static String getPropertyName(String methodName, String prefix, Annotation annotation) {
        if (prefix != null) {
            return methodName.substring(prefix.length());
        }
        String propName = null;
        if (annotation instanceof JSGetter) {
            propName = ((JSGetter) annotation).value();
            if ((propName == null || propName.length() == 0) && methodName.length() > 3 && methodName.startsWith("get")) {
                propName = methodName.substring(3);
                if (Character.isUpperCase(propName.charAt(0))) {
                    if (propName.length() == 1) {
                        propName = propName.toLowerCase();
                    } else if (!Character.isUpperCase(propName.charAt(1))) {
                        propName = Character.toLowerCase(propName.charAt(0)) + propName.substring(1);
                    }
                }
            }
        } else if (annotation instanceof JSFunction) {
            propName = ((JSFunction) annotation).value();
        } else if (annotation instanceof JSStaticFunction) {
            propName = ((JSStaticFunction) annotation).value();
        }
        if (propName == null || propName.length() == 0) {
            propName = methodName;
        }
        return propName;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static <T extends Scriptable> Class<T> extendsScriptable(Class<?> cls) {
        if (ScriptRuntime.ScriptableClass.isAssignableFrom(cls)) {
            return cls;
        }
        return null;
    }

    public void defineProperty(String propertyName, Object value, int attributes) {
        checkNotSealed(propertyName, 0);
        put(propertyName, this, value);
        setAttributes(propertyName, attributes);
    }

    public static void defineProperty(Scriptable destination, String propertyName, Object value, int attributes) {
        if (!(destination instanceof ScriptableObject)) {
            destination.put(propertyName, destination, value);
        } else {
            ScriptableObject so = (ScriptableObject) destination;
            so.defineProperty(propertyName, value, attributes);
        }
    }

    public static void defineConstProperty(Scriptable destination, String propertyName) {
        if (destination instanceof ConstProperties) {
            ConstProperties cp = (ConstProperties) destination;
            cp.defineConst(propertyName, destination);
        } else {
            defineProperty(destination, propertyName, Undefined.instance, 13);
        }
    }

    public void defineProperty(String propertyName, Class<?> clazz, int attributes) {
        int length = propertyName.length();
        if (length == 0) {
            throw new IllegalArgumentException();
        }
        char[] buf = new char[3 + length];
        propertyName.getChars(0, length, buf, 3);
        buf[3] = Character.toUpperCase(buf[3]);
        buf[0] = 'g';
        buf[1] = 'e';
        buf[2] = 't';
        String getterName = new String(buf);
        buf[0] = 's';
        String setterName = new String(buf);
        Method[] methods = FunctionObject.getMethodList(clazz);
        Method getter = FunctionObject.findSingleMethod(methods, getterName);
        Method setter = FunctionObject.findSingleMethod(methods, setterName);
        if (setter == null) {
            attributes |= 1;
        }
        defineProperty(propertyName, null, getter, setter == null ? null : setter, attributes);
    }

    public void defineProperty(String propertyName, Object delegateTo, Method getter, Method setter, int attributes) {
        boolean delegatedForm;
        boolean delegatedForm2;
        MemberBox getterBox = null;
        if (getter != null) {
            getterBox = new MemberBox(getter);
            if (!Modifier.isStatic(getter.getModifiers())) {
                delegatedForm2 = delegateTo != null;
                getterBox.delegateTo = delegateTo;
            } else {
                delegatedForm2 = true;
                getterBox.delegateTo = Void.TYPE;
            }
            String errorId = null;
            Object[] parmTypes = getter.getParameterTypes();
            if (parmTypes.length == 0) {
                if (delegatedForm2) {
                    errorId = "msg.obj.getter.parms";
                }
            } else if (parmTypes.length == 1) {
                Object argType = parmTypes[0];
                if ((argType != ScriptRuntime.ScriptableClass && argType != ScriptRuntime.ScriptableObjectClass) || !delegatedForm2) {
                    errorId = "msg.bad.getter.parms";
                }
            } else {
                errorId = "msg.bad.getter.parms";
            }
            if (errorId != null) {
                throw Context.reportRuntimeError1(errorId, getter.toString());
            }
        }
        MemberBox setterBox = null;
        if (setter != null) {
            if (setter.getReturnType() != Void.TYPE) {
                throw Context.reportRuntimeError1("msg.setter.return", setter.toString());
            }
            setterBox = new MemberBox(setter);
            if (!Modifier.isStatic(setter.getModifiers())) {
                delegatedForm = delegateTo != null;
                setterBox.delegateTo = delegateTo;
            } else {
                delegatedForm = true;
                setterBox.delegateTo = Void.TYPE;
            }
            String errorId2 = null;
            Object[] parmTypes2 = setter.getParameterTypes();
            if (parmTypes2.length == 1) {
                if (delegatedForm) {
                    errorId2 = "msg.setter2.expected";
                }
            } else if (parmTypes2.length == 2) {
                Object argType2 = parmTypes2[0];
                if (argType2 != ScriptRuntime.ScriptableClass && argType2 != ScriptRuntime.ScriptableObjectClass) {
                    errorId2 = "msg.setter2.parms";
                } else if (!delegatedForm) {
                    errorId2 = "msg.setter1.parms";
                }
            } else {
                errorId2 = "msg.setter.parms";
            }
            if (errorId2 != null) {
                throw Context.reportRuntimeError1(errorId2, setter.toString());
            }
        }
        GetterSlot gslot = (GetterSlot) getSlot(propertyName, 0, 4);
        gslot.setAttributes(attributes);
        gslot.getter = getterBox;
        gslot.setter = setterBox;
    }

    public void defineOwnProperties(Context cx, ScriptableObject props) {
        Object[] ids = props.getIds();
        ScriptableObject[] descs = new ScriptableObject[ids.length];
        int len = ids.length;
        for (int i = 0; i < len; i++) {
            Object descObj = ScriptRuntime.getObjectElem((Scriptable) props, ids[i], cx);
            ScriptableObject desc = ensureScriptableObject(descObj);
            checkPropertyDefinition(desc);
            descs[i] = desc;
        }
        int len2 = ids.length;
        for (int i2 = 0; i2 < len2; i2++) {
            defineOwnProperty(cx, ids[i2], descs[i2]);
        }
    }

    public void defineOwnProperty(Context cx, Object id, ScriptableObject desc) {
        checkPropertyDefinition(desc);
        defineOwnProperty(cx, id, desc, true);
    }

    protected void defineOwnProperty(Context cx, Object id, ScriptableObject desc, boolean checkValid) {
        int attributes;
        Slot slot = getSlot(cx, id, 1);
        boolean isNew = slot == null;
        if (checkValid) {
            ScriptableObject current = slot == null ? null : slot.getPropertyDescriptor(cx, this);
            String name = ScriptRuntime.toString(id);
            checkPropertyChange(name, current, desc);
        }
        boolean isAccessor = isAccessorDescriptor(desc);
        if (slot == null) {
            slot = getSlot(cx, id, isAccessor ? 4 : 2);
            attributes = applyDescriptorToAttributeBitset(7, desc);
        } else {
            attributes = applyDescriptorToAttributeBitset(slot.getAttributes(), desc);
        }
        Slot slot2 = unwrapSlot(slot);
        if (isAccessor) {
            if (!(slot2 instanceof GetterSlot)) {
                slot2 = getSlot(cx, id, 4);
            }
            GetterSlot gslot = (GetterSlot) slot2;
            Object getter = getProperty(desc, "get");
            if (getter != NOT_FOUND) {
                gslot.getter = getter;
            }
            Object setter = getProperty(desc, "set");
            if (setter != NOT_FOUND) {
                gslot.setter = setter;
            }
            gslot.value = Undefined.instance;
            gslot.setAttributes(attributes);
            return;
        }
        if ((slot2 instanceof GetterSlot) && isDataDescriptor(desc)) {
            slot2 = getSlot(cx, id, 5);
        }
        Object value = getProperty(desc, "value");
        if (value != NOT_FOUND) {
            slot2.value = value;
        } else if (isNew) {
            slot2.value = Undefined.instance;
        }
        slot2.setAttributes(attributes);
    }

    protected void checkPropertyDefinition(ScriptableObject desc) {
        Object getter = getProperty(desc, "get");
        if (getter != NOT_FOUND && getter != Undefined.instance && !(getter instanceof Callable)) {
            throw ScriptRuntime.notFunctionError(getter);
        }
        Object setter = getProperty(desc, "set");
        if (setter != NOT_FOUND && setter != Undefined.instance && !(setter instanceof Callable)) {
            throw ScriptRuntime.notFunctionError(setter);
        }
        if (isDataDescriptor(desc) && isAccessorDescriptor(desc)) {
            throw ScriptRuntime.typeError0("msg.both.data.and.accessor.desc");
        }
    }

    protected void checkPropertyChange(String id, ScriptableObject current, ScriptableObject desc) {
        if (current == null) {
            if (!isExtensible()) {
                throw ScriptRuntime.typeError0("msg.not.extensible");
            }
            return;
        }
        if (isFalse(current.get("configurable", current))) {
            if (isTrue(getProperty(desc, "configurable"))) {
                throw ScriptRuntime.typeError1("msg.change.configurable.false.to.true", id);
            }
            if (isTrue(current.get("enumerable", current)) != isTrue(getProperty(desc, "enumerable"))) {
                throw ScriptRuntime.typeError1("msg.change.enumerable.with.configurable.false", id);
            }
            boolean isData = isDataDescriptor(desc);
            boolean isAccessor = isAccessorDescriptor(desc);
            if (isData || isAccessor) {
                if (isData && isDataDescriptor(current)) {
                    if (isFalse(current.get("writable", current))) {
                        if (isTrue(getProperty(desc, "writable"))) {
                            throw ScriptRuntime.typeError1("msg.change.writable.false.to.true.with.configurable.false", id);
                        }
                        if (!sameValue(getProperty(desc, "value"), current.get("value", current))) {
                            throw ScriptRuntime.typeError1("msg.change.value.with.writable.false", id);
                        }
                        return;
                    }
                    return;
                }
                if (isAccessor && isAccessorDescriptor(current)) {
                    if (!sameValue(getProperty(desc, "set"), current.get("set", current))) {
                        throw ScriptRuntime.typeError1("msg.change.setter.with.configurable.false", id);
                    }
                    if (!sameValue(getProperty(desc, "get"), current.get("get", current))) {
                        throw ScriptRuntime.typeError1("msg.change.getter.with.configurable.false", id);
                    }
                    return;
                }
                if (isDataDescriptor(current)) {
                    throw ScriptRuntime.typeError1("msg.change.property.data.to.accessor.with.configurable.false", id);
                }
                throw ScriptRuntime.typeError1("msg.change.property.accessor.to.data.with.configurable.false", id);
            }
        }
    }

    protected static boolean isTrue(Object value) {
        return value != NOT_FOUND && ScriptRuntime.toBoolean(value);
    }

    protected static boolean isFalse(Object value) {
        return !isTrue(value);
    }

    protected boolean sameValue(Object newValue, Object currentValue) {
        if (newValue == NOT_FOUND) {
            return true;
        }
        if (currentValue == NOT_FOUND) {
            currentValue = Undefined.instance;
        }
        if ((currentValue instanceof Number) && (newValue instanceof Number)) {
            double d1 = ((Number) currentValue).doubleValue();
            double d2 = ((Number) newValue).doubleValue();
            if (Double.isNaN(d1) && Double.isNaN(d2)) {
                return true;
            }
            if (d1 == 0.0d && Double.doubleToLongBits(d1) != Double.doubleToLongBits(d2)) {
                return false;
            }
        }
        return ScriptRuntime.shallowEq(currentValue, newValue);
    }

    protected int applyDescriptorToAttributeBitset(int attributes, ScriptableObject desc) {
        Object enumerable = getProperty(desc, "enumerable");
        if (enumerable != NOT_FOUND) {
            attributes = ScriptRuntime.toBoolean(enumerable) ? attributes & (-3) : attributes | 2;
        }
        Object writable = getProperty(desc, "writable");
        if (writable != NOT_FOUND) {
            attributes = ScriptRuntime.toBoolean(writable) ? attributes & (-2) : attributes | 1;
        }
        Object configurable = getProperty(desc, "configurable");
        if (configurable != NOT_FOUND) {
            attributes = ScriptRuntime.toBoolean(configurable) ? attributes & (-5) : attributes | 4;
        }
        return attributes;
    }

    protected boolean isDataDescriptor(ScriptableObject desc) {
        return hasProperty(desc, "value") || hasProperty(desc, "writable");
    }

    protected boolean isAccessorDescriptor(ScriptableObject desc) {
        return hasProperty(desc, "get") || hasProperty(desc, "set");
    }

    protected boolean isGenericDescriptor(ScriptableObject desc) {
        return (isDataDescriptor(desc) || isAccessorDescriptor(desc)) ? false : true;
    }

    protected static Scriptable ensureScriptable(Object arg) {
        if (!(arg instanceof Scriptable)) {
            throw ScriptRuntime.typeError1("msg.arg.not.object", ScriptRuntime.typeof(arg));
        }
        return (Scriptable) arg;
    }

    protected static ScriptableObject ensureScriptableObject(Object arg) {
        if (!(arg instanceof ScriptableObject)) {
            throw ScriptRuntime.typeError1("msg.arg.not.object", ScriptRuntime.typeof(arg));
        }
        return (ScriptableObject) arg;
    }

    public void defineFunctionProperties(String[] names, Class<?> clazz, int attributes) {
        Method[] methods = FunctionObject.getMethodList(clazz);
        for (String name : names) {
            Method m = FunctionObject.findSingleMethod(methods, name);
            if (m == null) {
                throw Context.reportRuntimeError2("msg.method.not.found", name, clazz.getName());
            }
            FunctionObject f = new FunctionObject(name, m, this);
            defineProperty(name, f, attributes);
        }
    }

    public static Scriptable getObjectPrototype(Scriptable scope) {
        return TopLevel.getBuiltinPrototype(getTopLevelScope(scope), TopLevel.Builtins.Object);
    }

    public static Scriptable getFunctionPrototype(Scriptable scope) {
        return TopLevel.getBuiltinPrototype(getTopLevelScope(scope), TopLevel.Builtins.Function);
    }

    public static Scriptable getArrayPrototype(Scriptable scope) {
        return TopLevel.getBuiltinPrototype(getTopLevelScope(scope), TopLevel.Builtins.Array);
    }

    public static Scriptable getClassPrototype(Scriptable scope, String className) {
        Object proto;
        Object ctor = getProperty(getTopLevelScope(scope), className);
        if (ctor instanceof BaseFunction) {
            proto = ((BaseFunction) ctor).getPrototypeProperty();
        } else if (ctor instanceof Scriptable) {
            Scriptable ctorObj = (Scriptable) ctor;
            proto = ctorObj.get("prototype", ctorObj);
        } else {
            return null;
        }
        if (proto instanceof Scriptable) {
            return (Scriptable) proto;
        }
        return null;
    }

    public static Scriptable getTopLevelScope(Scriptable obj) {
        while (true) {
            Scriptable parent = obj.getParentScope();
            if (parent == null) {
                return obj;
            }
            obj = parent;
        }
    }

    public boolean isExtensible() {
        return this.isExtensible;
    }

    public void preventExtensions() {
        this.isExtensible = false;
    }

    public synchronized void sealObject() {
        if (this.count >= 0) {
            Slot slot = this.firstAdded;
            while (true) {
                Slot slot2 = slot;
                if (slot2 != null) {
                    Object value = slot2.value;
                    if (value instanceof LazilyLoadedCtor) {
                        LazilyLoadedCtor initializer = (LazilyLoadedCtor) value;
                        try {
                            initializer.init();
                            slot2.value = initializer.getValue();
                        } catch (Throwable th) {
                            slot2.value = initializer.getValue();
                            throw th;
                        }
                    }
                    slot = slot2.orderedNext;
                } else {
                    this.count ^= -1;
                    return;
                }
            }
        }
    }

    public final boolean isSealed() {
        return this.count < 0;
    }

    private void checkNotSealed(String name, int index) {
        if (!isSealed()) {
            return;
        }
        String str = name != null ? name : Integer.toString(index);
        throw Context.reportRuntimeError1("msg.modify.sealed", str);
    }

    public static Object getProperty(Scriptable obj, String name) {
        Object result;
        do {
            result = obj.get(name, obj);
            if (result != Scriptable.NOT_FOUND) {
                break;
            }
            obj = obj.getPrototype();
        } while (obj != null);
        return result;
    }

    public static <T> T getTypedProperty(Scriptable s, int index, Class<T> type) {
        Object val = getProperty(s, index);
        if (val == Scriptable.NOT_FOUND) {
            val = null;
        }
        return type.cast(Context.jsToJava(val, type));
    }

    public static Object getProperty(Scriptable obj, int index) {
        Object result;
        do {
            result = obj.get(index, obj);
            if (result != Scriptable.NOT_FOUND) {
                break;
            }
            obj = obj.getPrototype();
        } while (obj != null);
        return result;
    }

    public static <T> T getTypedProperty(Scriptable s, String name, Class<T> type) {
        Object val = getProperty(s, name);
        if (val == Scriptable.NOT_FOUND) {
            val = null;
        }
        return type.cast(Context.jsToJava(val, type));
    }

    public static boolean hasProperty(Scriptable obj, String name) {
        return null != getBase(obj, name);
    }

    public static void redefineProperty(Scriptable obj, String name, boolean isConst) {
        Scriptable base = getBase(obj, name);
        if (base == null) {
            return;
        }
        if (base instanceof ConstProperties) {
            ConstProperties cp = (ConstProperties) base;
            if (cp.isConst(name)) {
                throw ScriptRuntime.typeError1("msg.const.redecl", name);
            }
        }
        if (isConst) {
            throw ScriptRuntime.typeError1("msg.var.redecl", name);
        }
    }

    public static boolean hasProperty(Scriptable obj, int index) {
        return null != getBase(obj, index);
    }

    public static void putProperty(Scriptable obj, String name, Object value) {
        Scriptable base = getBase(obj, name);
        if (base == null) {
            base = obj;
        }
        base.put(name, obj, value);
    }

    public static void putConstProperty(Scriptable obj, String name, Object value) {
        Scriptable base = getBase(obj, name);
        if (base == null) {
            base = obj;
        }
        if (base instanceof ConstProperties) {
            ((ConstProperties) base).putConst(name, obj, value);
        }
    }

    public static void putProperty(Scriptable obj, int index, Object value) {
        Scriptable base = getBase(obj, index);
        if (base == null) {
            base = obj;
        }
        base.put(index, obj, value);
    }

    public static boolean deleteProperty(Scriptable obj, String name) {
        Scriptable base = getBase(obj, name);
        if (base == null) {
            return true;
        }
        base.delete(name);
        return !base.has(name, obj);
    }

    public static boolean deleteProperty(Scriptable obj, int index) {
        Scriptable base = getBase(obj, index);
        if (base == null) {
            return true;
        }
        base.delete(index);
        return !base.has(index, obj);
    }

    public static Object[] getPropertyIds(Scriptable obj) {
        if (obj == null) {
            return ScriptRuntime.emptyArgs;
        }
        Object[] result = obj.getIds();
        ObjToIntMap map = null;
        while (true) {
            obj = obj.getPrototype();
            if (obj == null) {
                break;
            }
            Object[] ids = obj.getIds();
            if (ids.length != 0) {
                if (map == null) {
                    if (result.length == 0) {
                        result = ids;
                    } else {
                        map = new ObjToIntMap(result.length + ids.length);
                        for (int i = 0; i != result.length; i++) {
                            map.intern(result[i]);
                        }
                        result = null;
                    }
                }
                for (int i2 = 0; i2 != ids.length; i2++) {
                    map.intern(ids[i2]);
                }
            }
        }
        if (map != null) {
            result = map.getKeys();
        }
        return result;
    }

    public static Object callMethod(Scriptable obj, String methodName, Object[] args) {
        return callMethod(null, obj, methodName, args);
    }

    public static Object callMethod(Context cx, Scriptable obj, String methodName, Object[] args) {
        Object funObj = getProperty(obj, methodName);
        if (!(funObj instanceof Function)) {
            throw ScriptRuntime.notFunctionError(obj, methodName);
        }
        Function fun = (Function) funObj;
        Scriptable scope = getTopLevelScope(obj);
        if (cx != null) {
            return fun.call(cx, scope, obj, args);
        }
        return Context.call(null, fun, scope, obj, args);
    }

    private static Scriptable getBase(Scriptable obj, String name) {
        while (!obj.has(name, obj)) {
            obj = obj.getPrototype();
            if (obj == null) {
                break;
            }
        }
        return obj;
    }

    private static Scriptable getBase(Scriptable obj, int index) {
        while (!obj.has(index, obj)) {
            obj = obj.getPrototype();
            if (obj == null) {
                break;
            }
        }
        return obj;
    }

    public final Object getAssociatedValue(Object key) {
        Map<Object, Object> h = this.associatedValues;
        if (h == null) {
            return null;
        }
        return h.get(key);
    }

    public static Object getTopScopeValue(Scriptable scope, Object key) {
        Scriptable scope2 = getTopLevelScope(scope);
        do {
            if (scope2 instanceof ScriptableObject) {
                ScriptableObject so = (ScriptableObject) scope2;
                Object value = so.getAssociatedValue(key);
                if (value != null) {
                    return value;
                }
            }
            scope2 = scope2.getPrototype();
        } while (scope2 != null);
        return null;
    }

    public final synchronized Object associateValue(Object key, Object value) {
        if (value == null) {
            throw new IllegalArgumentException();
        }
        Map<Object, Object> h = this.associatedValues;
        if (h == null) {
            h = new HashMap();
            this.associatedValues = h;
        }
        return Kit.initHash(h, key, value);
    }

    private boolean putImpl(String name, int index, Scriptable start, Object value) {
        Slot slot;
        if (this != start) {
            slot = getSlot(name, index, 1);
            if (slot == null) {
                return false;
            }
        } else if (!this.isExtensible) {
            slot = getSlot(name, index, 1);
            if (slot == null) {
                return true;
            }
        } else {
            if (this.count < 0) {
                checkNotSealed(name, index);
            }
            slot = getSlot(name, index, 2);
        }
        return slot.setValue(value, this, start);
    }

    private boolean putConstImpl(String name, int index, Scriptable start, Object value, int constFlag) {
        Slot slot;
        if (!$assertionsDisabled && constFlag == 0) {
            throw new AssertionError();
        }
        if (this != start) {
            slot = getSlot(name, index, 1);
            if (slot == null) {
                return false;
            }
        } else if (!isExtensible()) {
            slot = getSlot(name, index, 1);
            if (slot == null) {
                return true;
            }
        } else {
            checkNotSealed(name, index);
            Slot slot2 = unwrapSlot(getSlot(name, index, 3));
            int attr = slot2.getAttributes();
            if ((attr & 1) == 0) {
                throw Context.reportRuntimeError1("msg.var.redecl", name);
            }
            if ((attr & 8) != 0) {
                slot2.value = value;
                if (constFlag != 8) {
                    slot2.setAttributes(attr & (-9));
                    return true;
                }
                return true;
            }
            return true;
        }
        return slot.setValue(value, this, start);
    }

    private Slot findAttributeSlot(String name, int index, int accessType) {
        Slot slot = getSlot(name, index, accessType);
        if (slot == null) {
            String str = name != null ? name : Integer.toString(index);
            throw Context.reportRuntimeError1("msg.prop.not.found", str);
        }
        return slot;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Slot unwrapSlot(Slot slot) {
        return slot instanceof RelinkedSlot ? ((RelinkedSlot) slot).slot : slot;
    }

    private Slot getSlot(String name, int index, int accessType) {
        Slot slot;
        Slot[] slotsLocalRef = this.slots;
        if (slotsLocalRef == null && accessType == 1) {
            return null;
        }
        int indexOrHash = name != null ? name.hashCode() : index;
        if (slotsLocalRef != null) {
            int slotIndex = getSlotIndex(slotsLocalRef.length, indexOrHash);
            Slot slot2 = slotsLocalRef[slotIndex];
            while (true) {
                slot = slot2;
                if (slot == null) {
                    break;
                }
                Object sname = slot.name;
                if (indexOrHash == slot.indexOrHash && (sname == name || (name != null && name.equals(sname)))) {
                    break;
                }
                slot2 = slot.next;
            }
            switch (accessType) {
                case 1:
                    return slot;
                case 2:
                case 3:
                    if (slot != null) {
                        return slot;
                    }
                    break;
                case 4:
                    Slot slot3 = unwrapSlot(slot);
                    if (slot3 instanceof GetterSlot) {
                        return slot3;
                    }
                    break;
                case 5:
                    Slot slot4 = unwrapSlot(slot);
                    if (!(slot4 instanceof GetterSlot)) {
                        return slot4;
                    }
                    break;
            }
        }
        return createSlot(name, indexOrHash, accessType);
    }

    private synchronized Slot createSlot(String name, int indexOrHash, int accessType) {
        int insertPos;
        Slot slot;
        Slot newSlot;
        Slot[] slotsLocalRef = this.slots;
        if (this.count == 0) {
            slotsLocalRef = new Slot[4];
            this.slots = slotsLocalRef;
            insertPos = getSlotIndex(slotsLocalRef.length, indexOrHash);
        } else {
            int tableSize = slotsLocalRef.length;
            insertPos = getSlotIndex(tableSize, indexOrHash);
            Slot prev = slotsLocalRef[insertPos];
            Slot slot2 = prev;
            while (true) {
                slot = slot2;
                if (slot == null || (slot.indexOrHash == indexOrHash && (slot.name == name || (name != null && name.equals(slot.name))))) {
                    break;
                }
                prev = slot;
                slot2 = slot.next;
            }
            if (slot != null) {
                Slot inner = unwrapSlot(slot);
                if (accessType == 4 && !(inner instanceof GetterSlot)) {
                    newSlot = new GetterSlot(name, indexOrHash, inner.getAttributes());
                } else if (accessType == 5 && (inner instanceof GetterSlot)) {
                    newSlot = new Slot(name, indexOrHash, inner.getAttributes());
                } else {
                    if (accessType == 3) {
                        return null;
                    }
                    return inner;
                }
                newSlot.value = inner.value;
                newSlot.next = slot.next;
                if (this.lastAdded != null) {
                    this.lastAdded.orderedNext = newSlot;
                }
                if (this.firstAdded == null) {
                    this.firstAdded = newSlot;
                }
                this.lastAdded = newSlot;
                if (prev == slot) {
                    slotsLocalRef[insertPos] = newSlot;
                } else {
                    prev.next = newSlot;
                }
                slot.markDeleted();
                return newSlot;
            }
            if (4 * (this.count + 1) > 3 * slotsLocalRef.length) {
                slotsLocalRef = new Slot[slotsLocalRef.length * 2];
                copyTable(this.slots, slotsLocalRef, this.count);
                this.slots = slotsLocalRef;
                insertPos = getSlotIndex(slotsLocalRef.length, indexOrHash);
            }
        }
        Slot newSlot2 = accessType == 4 ? new GetterSlot(name, indexOrHash, 0) : new Slot(name, indexOrHash, 0);
        if (accessType == 3) {
            newSlot2.setAttributes(13);
        }
        this.count++;
        if (this.lastAdded != null) {
            this.lastAdded.orderedNext = newSlot2;
        }
        if (this.firstAdded == null) {
            this.firstAdded = newSlot2;
        }
        this.lastAdded = newSlot2;
        addKnownAbsentSlot(slotsLocalRef, newSlot2, insertPos);
        return newSlot2;
    }

    private synchronized void removeSlot(String name, int index) {
        Slot slot;
        Slot prev;
        int indexOrHash = name != null ? name.hashCode() : index;
        Slot[] slotsLocalRef = this.slots;
        if (this.count != 0) {
            int tableSize = slotsLocalRef.length;
            int slotIndex = getSlotIndex(tableSize, indexOrHash);
            Slot prev2 = slotsLocalRef[slotIndex];
            Slot slot2 = prev2;
            while (true) {
                slot = slot2;
                if (slot == null || (slot.indexOrHash == indexOrHash && (slot.name == name || (name != null && name.equals(slot.name))))) {
                    break;
                }
                prev2 = slot;
                slot2 = slot.next;
            }
            if (slot != null && (slot.getAttributes() & 4) == 0) {
                this.count--;
                if (prev2 == slot) {
                    slotsLocalRef[slotIndex] = slot.next;
                } else {
                    prev2.next = slot.next;
                }
                Slot deleted = unwrapSlot(slot);
                if (deleted == this.firstAdded) {
                    prev = null;
                    this.firstAdded = deleted.orderedNext;
                } else {
                    Slot slot3 = this.firstAdded;
                    while (true) {
                        prev = slot3;
                        if (prev.orderedNext == deleted) {
                            break;
                        } else {
                            slot3 = prev.orderedNext;
                        }
                    }
                    prev.orderedNext = deleted.orderedNext;
                }
                if (deleted == this.lastAdded) {
                    this.lastAdded = prev;
                }
                slot.markDeleted();
            }
        }
    }

    private static int getSlotIndex(int tableSize, int indexOrHash) {
        return indexOrHash & (tableSize - 1);
    }

    private static void copyTable(Slot[] oldSlots, Slot[] newSlots, int count) {
        if (count == 0) {
            throw Kit.codeBug();
        }
        int tableSize = newSlots.length;
        int i = oldSlots.length;
        while (true) {
            i--;
            Slot slot = oldSlots[i];
            while (slot != null) {
                int insertPos = getSlotIndex(tableSize, slot.indexOrHash);
                Slot insSlot = slot.next == null ? slot : new RelinkedSlot(slot);
                addKnownAbsentSlot(newSlots, insSlot, insertPos);
                slot = slot.next;
                count--;
                if (count == 0) {
                    return;
                }
            }
        }
    }

    private static void addKnownAbsentSlot(Slot[] slots, Slot slot, int insertPos) {
        if (slots[insertPos] == null) {
            slots[insertPos] = slot;
            return;
        }
        Slot prev = slots[insertPos];
        Slot slot2 = prev.next;
        while (true) {
            Slot next = slot2;
            if (next != null) {
                prev = next;
                slot2 = prev.next;
            } else {
                prev.next = slot;
                return;
            }
        }
    }

    Object[] getIds(boolean getAll) {
        Object[] a;
        Slot slot;
        Slot[] s = this.slots;
        int externalLen = this.externalData == null ? 0 : this.externalData.getArrayLength();
        if (externalLen == 0) {
            a = ScriptRuntime.emptyArgs;
        } else {
            a = new Object[externalLen];
            for (int i = 0; i < externalLen; i++) {
                a[i] = Integer.valueOf(i);
            }
        }
        if (s == null) {
            return a;
        }
        int c = externalLen;
        Slot slot2 = this.firstAdded;
        while (true) {
            slot = slot2;
            if (slot == null || !slot.wasDeleted) {
                break;
            }
            slot2 = slot.orderedNext;
        }
        while (slot != null) {
            if (getAll || (slot.getAttributes() & 2) == 0) {
                if (c == externalLen) {
                    Object[] oldA = a;
                    a = new Object[s.length + externalLen];
                    if (oldA != null) {
                        System.arraycopy(oldA, 0, a, 0, externalLen);
                    }
                }
                int i2 = c;
                c++;
                a[i2] = slot.name != null ? slot.name : Integer.valueOf(slot.indexOrHash);
            }
            Slot slot3 = slot.orderedNext;
            while (true) {
                slot = slot3;
                if (slot == null || !slot.wasDeleted) {
                    break;
                }
                slot3 = slot.orderedNext;
            }
        }
        if (c == a.length + externalLen) {
            return a;
        }
        Object[] result = new Object[c];
        System.arraycopy(a, 0, result, 0, c);
        return result;
    }

    private synchronized void writeObject(ObjectOutputStream out) throws IOException {
        Slot slot;
        Slot next;
        out.defaultWriteObject();
        int objectsCount = this.count;
        if (objectsCount < 0) {
            objectsCount ^= -1;
        }
        if (objectsCount == 0) {
            out.writeInt(0);
            return;
        }
        out.writeInt(this.slots.length);
        Slot slot2 = this.firstAdded;
        while (true) {
            slot = slot2;
            if (slot == null || !slot.wasDeleted) {
                break;
            } else {
                slot2 = slot.orderedNext;
            }
        }
        this.firstAdded = slot;
        while (slot != null) {
            out.writeObject(slot);
            Slot slot3 = slot.orderedNext;
            while (true) {
                next = slot3;
                if (next == null || !next.wasDeleted) {
                    break;
                } else {
                    slot3 = next.orderedNext;
                }
            }
            slot.orderedNext = next;
            slot = next;
        }
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        int newSize;
        in.defaultReadObject();
        int tableSize = in.readInt();
        if (tableSize != 0) {
            if ((tableSize & (tableSize - 1)) != 0) {
                if (tableSize > 1073741824) {
                    throw new RuntimeException("Property table overflow");
                }
                int i = 4;
                while (true) {
                    newSize = i;
                    if (newSize >= tableSize) {
                        break;
                    } else {
                        i = newSize << 1;
                    }
                }
                tableSize = newSize;
            }
            this.slots = new Slot[tableSize];
            int objectsCount = this.count;
            if (objectsCount < 0) {
                objectsCount ^= -1;
            }
            Slot prev = null;
            for (int i2 = 0; i2 != objectsCount; i2++) {
                this.lastAdded = (Slot) in.readObject();
                if (i2 == 0) {
                    this.firstAdded = this.lastAdded;
                } else {
                    prev.orderedNext = this.lastAdded;
                }
                int slotIndex = getSlotIndex(tableSize, this.lastAdded.indexOrHash);
                addKnownAbsentSlot(this.slots, this.lastAdded, slotIndex);
                prev = this.lastAdded;
            }
        }
    }

    protected ScriptableObject getOwnPropertyDescriptor(Context cx, Object id) {
        Slot slot = getSlot(cx, id, 1);
        if (slot == null) {
            return null;
        }
        Scriptable scope = getParentScope();
        return slot.getPropertyDescriptor(cx, scope == null ? this : scope);
    }

    protected Slot getSlot(Context cx, Object id, int accessType) {
        String name = ScriptRuntime.toStringIdOrIndex(cx, id);
        if (name == null) {
            return getSlot((String) null, ScriptRuntime.lastIndexResult(cx), accessType);
        }
        return getSlot(name, 0, accessType);
    }

    public int size() {
        return this.count < 0 ? this.count ^ (-1) : this.count;
    }

    public boolean isEmpty() {
        return this.count == 0 || this.count == -1;
    }

    public Object get(Object key) {
        Object value = null;
        if (key instanceof String) {
            value = get((String) key, this);
        } else if (key instanceof Number) {
            value = get(((Number) key).intValue(), this);
        }
        if (value == Scriptable.NOT_FOUND || value == Undefined.instance) {
            return null;
        }
        if (value instanceof Wrapper) {
            return ((Wrapper) value).unwrap();
        }
        return value;
    }
}
