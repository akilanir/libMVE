package org.apache.http.protocol;

@Deprecated
/* loaded from: httpcore-4.4.3.jar:org/apache/http/protocol/HttpRequestHandlerResolver.class */
public interface HttpRequestHandlerResolver {
    HttpRequestHandler lookup(String str);
}
