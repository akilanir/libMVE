package org.apache.http;

import org.apache.http.protocol.HttpContext;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/ConnectionReuseStrategy.class */
public interface ConnectionReuseStrategy {
    boolean keepAlive(HttpResponse httpResponse, HttpContext httpContext);
}
