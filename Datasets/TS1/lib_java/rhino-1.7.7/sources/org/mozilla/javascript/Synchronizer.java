package org.mozilla.javascript;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/Synchronizer.class */
public class Synchronizer extends Delegator {
    private Object syncObject;

    public Synchronizer(Scriptable obj) {
        super(obj);
    }

    public Synchronizer(Scriptable obj, Object syncObject) {
        super(obj);
        this.syncObject = syncObject;
    }

    @Override // org.mozilla.javascript.Delegator, org.mozilla.javascript.Function, org.mozilla.javascript.Callable
    public Object call(Context cx, Scriptable scope, Scriptable thisObj, Object[] args) {
        Object sync = this.syncObject != null ? this.syncObject : thisObj;
        Object unwrap = sync instanceof Wrapper ? ((Wrapper) sync).unwrap() : sync;
        Object obj = unwrap;
        synchronized (unwrap) {
            Object call = ((Function) this.obj).call(cx, scope, thisObj, args);
            return call;
        }
    }
}
