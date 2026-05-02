package cz.msebera.android.httpclient;

import java.io.Closeable;
import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpConnection.class */
public interface HttpConnection extends Closeable {
    @Override // java.io.Closeable, java.lang.AutoCloseable
    void close() throws IOException;

    boolean isOpen();

    boolean isStale();

    void setSocketTimeout(int i);

    int getSocketTimeout();

    void shutdown() throws IOException;

    HttpConnectionMetrics getMetrics();
}
