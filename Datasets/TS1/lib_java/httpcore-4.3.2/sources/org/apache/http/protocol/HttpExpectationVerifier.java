package org.apache.http.protocol;

import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/protocol/HttpExpectationVerifier.class */
public interface HttpExpectationVerifier {
    void verify(HttpRequest httpRequest, HttpResponse httpResponse, HttpContext httpContext) throws HttpException;
}
