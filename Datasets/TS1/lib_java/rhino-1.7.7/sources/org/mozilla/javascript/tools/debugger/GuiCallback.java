package org.mozilla.javascript.tools.debugger;

import org.mozilla.javascript.tools.debugger.Dim;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/GuiCallback.class */
public interface GuiCallback {
    void updateSourceText(Dim.SourceInfo sourceInfo);

    void enterInterrupt(Dim.StackFrame stackFrame, String str, String str2);

    boolean isGuiEventThread();

    void dispatchNextGuiEvent() throws InterruptedException;
}
