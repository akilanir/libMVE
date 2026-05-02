package org.mozilla.javascript.commonjs.module;

import java.net.URI;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.Scriptable;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/commonjs/module/ModuleScriptProvider.class */
public interface ModuleScriptProvider {
    ModuleScript getModuleScript(Context context, String str, URI uri, URI uri2, Scriptable scriptable) throws Exception;
}
