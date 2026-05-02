package org.mozilla.javascript;

import java.util.EnumMap;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/TopLevel.class */
public class TopLevel extends IdScriptableObject {
    static final long serialVersionUID = -4648046356662472260L;
    private EnumMap<Builtins, BaseFunction> ctors;
    private EnumMap<NativeErrors, BaseFunction> errors;
    static final /* synthetic */ boolean $assertionsDisabled;

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/TopLevel$Builtins.class */
    public enum Builtins {
        Object,
        Array,
        Function,
        String,
        Number,
        Boolean,
        RegExp,
        Error
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/TopLevel$NativeErrors.class */
    enum NativeErrors {
        Error,
        EvalError,
        RangeError,
        ReferenceError,
        SyntaxError,
        TypeError,
        URIError,
        InternalError,
        JavaException
    }

    static {
        $assertionsDisabled = !TopLevel.class.desiredAssertionStatus();
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public String getClassName() {
        return "global";
    }

    public void cacheBuiltins() {
        this.ctors = new EnumMap<>(Builtins.class);
        Builtins[] arr$ = Builtins.values();
        for (Builtins builtin : arr$) {
            Object value = ScriptableObject.getProperty(this, builtin.name());
            if (value instanceof BaseFunction) {
                this.ctors.put((EnumMap<Builtins, BaseFunction>) builtin, (Builtins) value);
            }
        }
        this.errors = new EnumMap<>(NativeErrors.class);
        NativeErrors[] arr$2 = NativeErrors.values();
        for (NativeErrors error : arr$2) {
            Object value2 = ScriptableObject.getProperty(this, error.name());
            if (value2 instanceof BaseFunction) {
                this.errors.put((EnumMap<NativeErrors, BaseFunction>) error, (NativeErrors) value2);
            }
        }
    }

    public static Function getBuiltinCtor(Context cx, Scriptable scope, Builtins type) {
        Function result;
        if (!$assertionsDisabled && scope.getParentScope() != null) {
            throw new AssertionError();
        }
        if ((scope instanceof TopLevel) && (result = ((TopLevel) scope).getBuiltinCtor(type)) != null) {
            return result;
        }
        return ScriptRuntime.getExistingCtor(cx, scope, type.name());
    }

    static Function getNativeErrorCtor(Context cx, Scriptable scope, NativeErrors type) {
        Function result;
        if (!$assertionsDisabled && scope.getParentScope() != null) {
            throw new AssertionError();
        }
        if ((scope instanceof TopLevel) && (result = ((TopLevel) scope).getNativeErrorCtor(type)) != null) {
            return result;
        }
        return ScriptRuntime.getExistingCtor(cx, scope, type.name());
    }

    public static Scriptable getBuiltinPrototype(Scriptable scope, Builtins type) {
        Scriptable result;
        if (!$assertionsDisabled && scope.getParentScope() != null) {
            throw new AssertionError();
        }
        if ((scope instanceof TopLevel) && (result = ((TopLevel) scope).getBuiltinPrototype(type)) != null) {
            return result;
        }
        return ScriptableObject.getClassPrototype(scope, type.name());
    }

    public BaseFunction getBuiltinCtor(Builtins type) {
        if (this.ctors != null) {
            return this.ctors.get(type);
        }
        return null;
    }

    BaseFunction getNativeErrorCtor(NativeErrors type) {
        if (this.errors != null) {
            return this.errors.get(type);
        }
        return null;
    }

    public Scriptable getBuiltinPrototype(Builtins type) {
        BaseFunction func = getBuiltinCtor(type);
        Object proto = func != null ? func.getPrototypeProperty() : null;
        if (proto instanceof Scriptable) {
            return (Scriptable) proto;
        }
        return null;
    }
}
