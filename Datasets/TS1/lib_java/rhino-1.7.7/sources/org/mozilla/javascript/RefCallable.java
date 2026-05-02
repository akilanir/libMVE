package org.mozilla.javascript;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/RefCallable.class */
public interface RefCallable extends Callable {
    Ref refCall(Context context, Scriptable scriptable, Object[] objArr);
}
