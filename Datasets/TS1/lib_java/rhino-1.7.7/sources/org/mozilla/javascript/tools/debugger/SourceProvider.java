package org.mozilla.javascript.tools.debugger;

import org.mozilla.javascript.debug.DebuggableScript;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/SourceProvider.class */
public interface SourceProvider {
    String getSource(DebuggableScript debuggableScript);
}
