package org.mozilla.javascript.commonjs.module.provider;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import org.mozilla.javascript.Scriptable;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/commonjs/module/provider/ModuleSourceProvider.class */
public interface ModuleSourceProvider {
    public static final ModuleSource NOT_MODIFIED = new ModuleSource(null, null, null, null, null);

    ModuleSource loadSource(String str, Scriptable scriptable, Object obj) throws IOException, URISyntaxException;

    ModuleSource loadSource(URI uri, URI uri2, Object obj) throws IOException, URISyntaxException;
}
