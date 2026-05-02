package cz.msebera.android.httpclient.io;

import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/io/SessionInputBuffer.class */
public interface SessionInputBuffer {
    int read(byte[] bArr, int i, int i2) throws IOException;

    int read(byte[] bArr) throws IOException;

    int read() throws IOException;

    int readLine(CharArrayBuffer charArrayBuffer) throws IOException;

    String readLine() throws IOException;

    @Deprecated
    boolean isDataAvailable(int i) throws IOException;

    HttpTransportMetrics getMetrics();
}
