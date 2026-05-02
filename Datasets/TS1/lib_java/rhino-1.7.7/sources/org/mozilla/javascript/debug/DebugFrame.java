package org.mozilla.javascript.debug;

import org.mozilla.javascript.Context;
import org.mozilla.javascript.Scriptable;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/debug/DebugFrame.class */
public interface DebugFrame {
    void onEnter(Context context, Scriptable scriptable, Scriptable scriptable2, Object[] objArr);

    void onLineChange(Context context, int i);

    void onExceptionThrown(Context context, Throwable th);

    void onExit(Context context, boolean z, Object obj);

    void onDebuggerStatement(Context context);
}
