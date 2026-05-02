package org.mozilla.javascript;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/Function.class */
public interface Function extends Scriptable, Callable {
    @Override // org.mozilla.javascript.Callable
    Object call(Context context, Scriptable scriptable, Scriptable scriptable2, Object[] objArr);

    Scriptable construct(Context context, Scriptable scriptable, Object[] objArr);
}
