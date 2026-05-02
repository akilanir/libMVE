package org.mozilla.javascript.debug;

import org.mozilla.javascript.Context;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/debug/Debugger.class */
public interface Debugger {
    void handleCompilationDone(Context context, DebuggableScript debuggableScript, String str);

    DebugFrame getFrame(Context context, DebuggableScript debuggableScript);
}
