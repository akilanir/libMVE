package cz.msebera.android.httpclient.io;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/io/HttpTransportMetrics.class */
public interface HttpTransportMetrics {
    long getBytesTransferred();

    void reset();
}
