package org.apache.http.protocol;

import org.apache.http.HttpRequest;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/protocol/HttpRequestHandlerMapper.class */
public interface HttpRequestHandlerMapper {
    HttpRequestHandler lookup(HttpRequest httpRequest);
}
