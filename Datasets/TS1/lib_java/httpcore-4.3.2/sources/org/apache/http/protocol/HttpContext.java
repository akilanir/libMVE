package org.apache.http.protocol;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/protocol/HttpContext.class */
public interface HttpContext {
    public static final String RESERVED_PREFIX = "http.";

    Object getAttribute(String str);

    void setAttribute(String str, Object obj);

    Object removeAttribute(String str);
}
