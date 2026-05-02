package org.apache.http;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/HttpConnectionMetrics.class */
public interface HttpConnectionMetrics {
    long getRequestCount();

    long getResponseCount();

    long getSentBytesCount();

    long getReceivedBytesCount();

    Object getMetric(String str);

    void reset();
}
