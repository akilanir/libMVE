package org.apache.http.protocol;

import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
/* loaded from: httpcore-4.2.1.jar:org/apache/http/protocol/DefaultedHttpContext.class */
public final class DefaultedHttpContext implements HttpContext {
    private final HttpContext local;
    private final HttpContext defaults;

    public DefaultedHttpContext(HttpContext local, HttpContext defaults) {
        if (local == null) {
            throw new IllegalArgumentException("HTTP context may not be null");
        }
        this.local = local;
        this.defaults = defaults;
    }

    @Override // org.apache.http.protocol.HttpContext
    public Object getAttribute(String id) {
        Object obj = this.local.getAttribute(id);
        if (obj == null) {
            return this.defaults.getAttribute(id);
        }
        return obj;
    }

    @Override // org.apache.http.protocol.HttpContext
    public Object removeAttribute(String id) {
        return this.local.removeAttribute(id);
    }

    @Override // org.apache.http.protocol.HttpContext
    public void setAttribute(String id, Object obj) {
        this.local.setAttribute(id, obj);
    }

    public HttpContext getDefaults() {
        return this.defaults;
    }

    public String toString() {
        StringBuilder buf = new StringBuilder();
        buf.append("[local: ").append(this.local);
        buf.append("defaults: ").append(this.defaults);
        buf.append("]");
        return buf.toString();
    }
}
