package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.entity.HttpEntityWrapper;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.EntityUtils;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketException;

@NotThreadSafe
@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/BasicManagedEntity.class */
public class BasicManagedEntity extends HttpEntityWrapper implements ConnectionReleaseTrigger, EofSensorWatcher {
    protected ManagedClientConnection managedConn;
    protected final boolean attemptReuse;

    public BasicManagedEntity(HttpEntity entity, ManagedClientConnection conn, boolean reuse) {
        super(entity);
        Args.notNull(conn, "Connection");
        this.managedConn = conn;
        this.attemptReuse = reuse;
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public boolean isRepeatable() {
        return false;
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public InputStream getContent() throws IOException {
        return new EofSensorInputStream(this.wrappedEntity.getContent(), this);
    }

    private void ensureConsumed() throws IOException {
        if (this.managedConn == null) {
            return;
        }
        try {
            if (this.attemptReuse) {
                EntityUtils.consume(this.wrappedEntity);
                this.managedConn.markReusable();
            } else {
                this.managedConn.unmarkReusable();
            }
        } finally {
            releaseManagedConnection();
        }
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    @Deprecated
    public void consumeContent() throws IOException {
        ensureConsumed();
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public void writeTo(OutputStream outstream) throws IOException {
        super.writeTo(outstream);
        ensureConsumed();
    }

    @Override // cz.msebera.android.httpclient.conn.ConnectionReleaseTrigger
    public void releaseConnection() throws IOException {
        ensureConsumed();
    }

    @Override // cz.msebera.android.httpclient.conn.ConnectionReleaseTrigger
    public void abortConnection() throws IOException {
        if (this.managedConn != null) {
            try {
                this.managedConn.abortConnection();
            } finally {
                this.managedConn = null;
            }
        }
    }

    @Override // cz.msebera.android.httpclient.conn.EofSensorWatcher
    public boolean eofDetected(InputStream wrapped) throws IOException {
        try {
            if (this.managedConn != null) {
                if (this.attemptReuse) {
                    wrapped.close();
                    this.managedConn.markReusable();
                } else {
                    this.managedConn.unmarkReusable();
                }
            }
            return false;
        } finally {
            releaseManagedConnection();
        }
    }

    @Override // cz.msebera.android.httpclient.conn.EofSensorWatcher
    public boolean streamClosed(InputStream wrapped) throws IOException {
        try {
            if (this.managedConn != null) {
                if (this.attemptReuse) {
                    boolean valid = this.managedConn.isOpen();
                    try {
                        wrapped.close();
                        this.managedConn.markReusable();
                    } catch (SocketException ex) {
                        if (valid) {
                            throw ex;
                        }
                    }
                } else {
                    this.managedConn.unmarkReusable();
                }
            }
            return false;
        } finally {
            releaseManagedConnection();
        }
    }

    @Override // cz.msebera.android.httpclient.conn.EofSensorWatcher
    public boolean streamAbort(InputStream wrapped) throws IOException {
        if (this.managedConn != null) {
            this.managedConn.abortConnection();
            return false;
        }
        return false;
    }

    protected void releaseManagedConnection() throws IOException {
        if (this.managedConn != null) {
            try {
                this.managedConn.releaseConnection();
            } finally {
                this.managedConn = null;
            }
        }
    }
}
