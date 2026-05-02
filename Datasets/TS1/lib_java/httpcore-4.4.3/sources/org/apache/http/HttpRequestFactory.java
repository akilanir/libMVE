package org.apache.http;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/HttpRequestFactory.class */
public interface HttpRequestFactory {
    HttpRequest newHttpRequest(RequestLine requestLine) throws MethodNotSupportedException;

    HttpRequest newHttpRequest(String str, String str2) throws MethodNotSupportedException;
}
