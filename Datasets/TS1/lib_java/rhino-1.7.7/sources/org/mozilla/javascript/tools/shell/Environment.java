package org.mozilla.javascript.tools.shell;

import java.util.Map;
import org.mozilla.javascript.ScriptRuntime;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.ScriptableObject;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/Environment.class */
public class Environment extends ScriptableObject {
    static final long serialVersionUID = -430727378460177065L;
    private Environment thePrototypeInstance;

    public static void defineClass(ScriptableObject scope) {
        try {
            ScriptableObject.defineClass(scope, Environment.class);
        } catch (Exception e) {
            throw new Error(e.getMessage());
        }
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public String getClassName() {
        return "Environment";
    }

    public Environment() {
        this.thePrototypeInstance = null;
        if (this.thePrototypeInstance == null) {
            this.thePrototypeInstance = this;
        }
    }

    public Environment(ScriptableObject scope) {
        this.thePrototypeInstance = null;
        setParentScope(scope);
        Object ctor = ScriptRuntime.getTopLevelProp(scope, "Environment");
        if (ctor != null && (ctor instanceof Scriptable)) {
            Scriptable s = (Scriptable) ctor;
            setPrototype((Scriptable) s.get("prototype", s));
        }
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public boolean has(String name, Scriptable start) {
        if (this == this.thePrototypeInstance) {
            return super.has(name, start);
        }
        return System.getProperty(name) != null;
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public Object get(String name, Scriptable start) {
        if (this == this.thePrototypeInstance) {
            return super.get(name, start);
        }
        String result = System.getProperty(name);
        if (result != null) {
            return ScriptRuntime.toObject(getParentScope(), result);
        }
        return Scriptable.NOT_FOUND;
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public void put(String name, Scriptable start, Object value) {
        if (this == this.thePrototypeInstance) {
            super.put(name, start, value);
        } else {
            System.getProperties().put(name, ScriptRuntime.toString(value));
        }
    }

    private Object[] collectIds() {
        Map<Object, Object> props = System.getProperties();
        return props.keySet().toArray();
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public Object[] getIds() {
        if (this == this.thePrototypeInstance) {
            return super.getIds();
        }
        return collectIds();
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.debug.DebuggableObject
    public Object[] getAllIds() {
        if (this == this.thePrototypeInstance) {
            return super.getAllIds();
        }
        return collectIds();
    }
}
