package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.cookie.CookieAttributeHandler;
import cz.msebera.android.httpclient.cookie.CookieSpec;
import cz.msebera.android.httpclient.util.Args;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/cookie/AbstractCookieSpec.class */
public abstract class AbstractCookieSpec implements CookieSpec {
    private final Map<String, CookieAttributeHandler> attribHandlerMap = new HashMap(10);

    public void registerAttribHandler(String name, CookieAttributeHandler handler) {
        Args.notNull(name, "Attribute name");
        Args.notNull(handler, "Attribute handler");
        this.attribHandlerMap.put(name, handler);
    }

    protected CookieAttributeHandler findAttribHandler(String name) {
        return this.attribHandlerMap.get(name);
    }

    protected CookieAttributeHandler getAttribHandler(String name) {
        CookieAttributeHandler handler = findAttribHandler(name);
        if (handler == null) {
            throw new IllegalStateException("Handler not registered for " + name + " attribute.");
        }
        return handler;
    }

    protected Collection<CookieAttributeHandler> getAttribHandlers() {
        return this.attribHandlerMap.values();
    }
}
