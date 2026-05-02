package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/protocol/HttpRequestHandler.class */
public interface HttpRequestHandler {
    void handle(HttpRequest httpRequest, HttpResponse httpResponse, HttpContext httpContext) throws HttpException, IOException;
}
