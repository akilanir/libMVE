package org.apache.http;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/StatusLine.class */
public interface StatusLine {
    ProtocolVersion getProtocolVersion();

    int getStatusCode();

    String getReasonPhrase();
}
