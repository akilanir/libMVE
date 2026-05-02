package org.apache.http;

import java.io.IOException;
import org.apache.http.protocol.HttpContext;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/HttpRequestInterceptor.class */
public interface HttpRequestInterceptor {
    void process(HttpRequest httpRequest, HttpContext httpContext) throws HttpException, IOException;
}
