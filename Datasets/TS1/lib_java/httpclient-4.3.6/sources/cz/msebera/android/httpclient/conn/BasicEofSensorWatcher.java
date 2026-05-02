package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.io.InputStream;

@NotThreadSafe
@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/BasicEofSensorWatcher.class */
public class BasicEofSensorWatcher implements EofSensorWatcher {
    protected final ManagedClientConnection managedConn;
    protected final boolean attemptReuse;

    public BasicEofSensorWatcher(ManagedClientConnection conn, boolean reuse) {
        Args.notNull(conn, "Connection");
        this.managedConn = conn;
        this.attemptReuse = reuse;
    }

    @Override // cz.msebera.android.httpclient.conn.EofSensorWatcher
    public boolean eofDetected(InputStream wrapped) throws IOException {
        try {
            if (this.attemptReuse) {
                wrapped.close();
                this.managedConn.markReusable();
            }
            return false;
        } finally {
            this.managedConn.releaseConnection();
        }
    }

    @Override // cz.msebera.android.httpclient.conn.EofSensorWatcher
    public boolean streamClosed(InputStream wrapped) throws IOException {
        try {
            if (this.attemptReuse) {
                wrapped.close();
                this.managedConn.markReusable();
            }
            return false;
        } finally {
            this.managedConn.releaseConnection();
        }
    }

    @Override // cz.msebera.android.httpclient.conn.EofSensorWatcher
    public boolean streamAbort(InputStream wrapped) throws IOException {
        this.managedConn.abortConnection();
        return false;
    }
}
