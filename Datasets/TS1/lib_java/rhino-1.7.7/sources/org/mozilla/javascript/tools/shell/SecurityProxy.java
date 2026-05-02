package org.mozilla.javascript.tools.shell;

import org.mozilla.javascript.Context;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.SecurityController;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/SecurityProxy.class */
public abstract class SecurityProxy extends SecurityController {
    protected abstract void callProcessFileSecure(Context context, Scriptable scriptable, String str);
}
