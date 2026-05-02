package cz.msebera.android.httpclient;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpConnectionMetrics.class */
public interface HttpConnectionMetrics {
    long getRequestCount();

    long getResponseCount();

    long getSentBytesCount();

    long getReceivedBytesCount();

    Object getMetric(String str);

    void reset();
}
