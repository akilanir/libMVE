package org.apache.http;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/RequestLine.class */
public interface RequestLine {
    String getMethod();

    ProtocolVersion getProtocolVersion();

    String getUri();
}
