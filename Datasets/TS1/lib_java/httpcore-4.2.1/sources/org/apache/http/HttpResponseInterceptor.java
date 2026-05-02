package org.apache.http;

import java.io.IOException;
import org.apache.http.protocol.HttpContext;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/HttpResponseInterceptor.class */
public interface HttpResponseInterceptor {
    void process(HttpResponse httpResponse, HttpContext httpContext) throws HttpException, IOException;
}
