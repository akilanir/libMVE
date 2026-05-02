package org.apache.http.protocol;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/protocol/HttpRequestHandlerResolver.class */
public interface HttpRequestHandlerResolver {
    HttpRequestHandler lookup(String str);
}
