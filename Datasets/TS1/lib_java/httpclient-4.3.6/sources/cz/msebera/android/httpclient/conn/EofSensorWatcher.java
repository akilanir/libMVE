package cz.msebera.android.httpclient.conn;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/EofSensorWatcher.class */
public interface EofSensorWatcher {
    boolean eofDetected(InputStream inputStream) throws IOException;

    boolean streamClosed(InputStream inputStream) throws IOException;

    boolean streamAbort(InputStream inputStream) throws IOException;
}
