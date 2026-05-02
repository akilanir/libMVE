package org.mozilla.javascript.commonjs.module.provider;

import java.net.URI;
import java.util.LinkedList;
import java.util.List;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.commonjs.module.ModuleScript;
import org.mozilla.javascript.commonjs.module.ModuleScriptProvider;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/commonjs/module/provider/MultiModuleScriptProvider.class */
public class MultiModuleScriptProvider implements ModuleScriptProvider {
    private final ModuleScriptProvider[] providers;

    public MultiModuleScriptProvider(Iterable<? extends ModuleScriptProvider> providers) {
        List<ModuleScriptProvider> l = new LinkedList<>();
        for (ModuleScriptProvider provider : providers) {
            l.add(provider);
        }
        this.providers = (ModuleScriptProvider[]) l.toArray(new ModuleScriptProvider[l.size()]);
    }

    @Override // org.mozilla.javascript.commonjs.module.ModuleScriptProvider
    public ModuleScript getModuleScript(Context cx, String moduleId, URI uri, URI base, Scriptable paths) throws Exception {
        ModuleScriptProvider[] arr$ = this.providers;
        for (ModuleScriptProvider provider : arr$) {
            ModuleScript script = provider.getModuleScript(cx, moduleId, uri, base, paths);
            if (script != null) {
                return script;
            }
        }
        return null;
    }
}
