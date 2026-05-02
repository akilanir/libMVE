package org.mozilla.javascript;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/Delegator.class */
public class Delegator implements Function {
    protected Scriptable obj;

    public Delegator() {
        this.obj = null;
    }

    public Delegator(Scriptable obj) {
        this.obj = null;
        this.obj = obj;
    }

    protected Delegator newInstance() {
        try {
            return (Delegator) getClass().newInstance();
        } catch (Exception ex) {
            throw Context.throwAsScriptRuntimeEx(ex);
        }
    }

    public Scriptable getDelegee() {
        return this.obj;
    }

    public void setDelegee(Scriptable obj) {
        this.obj = obj;
    }

    @Override // org.mozilla.javascript.Scriptable
    public String getClassName() {
        return this.obj.getClassName();
    }

    @Override // org.mozilla.javascript.Scriptable
    public Object get(String name, Scriptable start) {
        return this.obj.get(name, start);
    }

    @Override // org.mozilla.javascript.Scriptable
    public Object get(int index, Scriptable start) {
        return this.obj.get(index, start);
    }

    @Override // org.mozilla.javascript.Scriptable
    public boolean has(String name, Scriptable start) {
        return this.obj.has(name, start);
    }

    @Override // org.mozilla.javascript.Scriptable
    public boolean has(int index, Scriptable start) {
        return this.obj.has(index, start);
    }

    @Override // org.mozilla.javascript.Scriptable
    public void put(String name, Scriptable start, Object value) {
        this.obj.put(name, start, value);
    }

    @Override // org.mozilla.javascript.Scriptable
    public void put(int index, Scriptable start, Object value) {
        this.obj.put(index, start, value);
    }

    @Override // org.mozilla.javascript.Scriptable
    public void delete(String name) {
        this.obj.delete(name);
    }

    @Override // org.mozilla.javascript.Scriptable
    public void delete(int index) {
        this.obj.delete(index);
    }

    @Override // org.mozilla.javascript.Scriptable
    public Scriptable getPrototype() {
        return this.obj.getPrototype();
    }

    @Override // org.mozilla.javascript.Scriptable
    public void setPrototype(Scriptable prototype) {
        this.obj.setPrototype(prototype);
    }

    @Override // org.mozilla.javascript.Scriptable
    public Scriptable getParentScope() {
        return this.obj.getParentScope();
    }

    @Override // org.mozilla.javascript.Scriptable
    public void setParentScope(Scriptable parent) {
        this.obj.setParentScope(parent);
    }

    @Override // org.mozilla.javascript.Scriptable
    public Object[] getIds() {
        return this.obj.getIds();
    }

    @Override // org.mozilla.javascript.Scriptable
    public Object getDefaultValue(Class<?> hint) {
        return (hint == null || hint == ScriptRuntime.ScriptableClass || hint == ScriptRuntime.FunctionClass) ? this : this.obj.getDefaultValue(hint);
    }

    @Override // org.mozilla.javascript.Scriptable
    public boolean hasInstance(Scriptable instance) {
        return this.obj.hasInstance(instance);
    }

    @Override // org.mozilla.javascript.Function, org.mozilla.javascript.Callable
    public Object call(Context cx, Scriptable scope, Scriptable thisObj, Object[] args) {
        return ((Function) this.obj).call(cx, scope, thisObj, args);
    }

    @Override // org.mozilla.javascript.Function
    public Scriptable construct(Context cx, Scriptable scope, Object[] args) {
        Scriptable delegee;
        if (this.obj == null) {
            Delegator n = newInstance();
            if (args.length == 0) {
                delegee = new NativeObject();
            } else {
                delegee = ScriptRuntime.toObject(cx, scope, args[0]);
            }
            n.setDelegee(delegee);
            return n;
        }
        return ((Function) this.obj).construct(cx, scope, args);
    }
}
