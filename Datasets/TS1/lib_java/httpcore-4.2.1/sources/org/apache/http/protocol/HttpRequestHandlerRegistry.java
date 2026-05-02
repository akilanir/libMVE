package org.apache.http.protocol;

import java.util.Map;
import org.apache.http.annotation.ThreadSafe;

@ThreadSafe
/* loaded from: httpcore-4.2.1.jar:org/apache/http/protocol/HttpRequestHandlerRegistry.class */
public class HttpRequestHandlerRegistry implements HttpRequestHandlerResolver {
    private final UriPatternMatcher<HttpRequestHandler> matcher = new UriPatternMatcher<>();

    public void register(String pattern, HttpRequestHandler handler) {
        if (pattern == null) {
            throw new IllegalArgumentException("URI request pattern may not be null");
        }
        if (handler == null) {
            throw new IllegalArgumentException("Request handler may not be null");
        }
        this.matcher.register(pattern, handler);
    }

    public void unregister(String pattern) {
        this.matcher.unregister(pattern);
    }

    public void setHandlers(Map<String, HttpRequestHandler> map) {
        this.matcher.setObjects(map);
    }

    public Map<String, HttpRequestHandler> getHandlers() {
        return this.matcher.getObjects();
    }

    @Override // org.apache.http.protocol.HttpRequestHandlerResolver
    public HttpRequestHandler lookup(String requestURI) {
        return this.matcher.lookup(requestURI);
    }
}
