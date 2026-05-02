package org.apache.http.io;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/io/HttpTransportMetrics.class */
public interface HttpTransportMetrics {
    long getBytesTransferred();

    void reset();
}
