package cz.msebera.android.httpclient.conn;

import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ConnectionReleaseTrigger.class */
public interface ConnectionReleaseTrigger {
    void releaseConnection() throws IOException;

    void abortConnection() throws IOException;
}
