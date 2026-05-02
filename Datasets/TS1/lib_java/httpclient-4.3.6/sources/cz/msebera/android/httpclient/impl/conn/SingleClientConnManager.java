package cz.msebera.android.httpclient.impl.conn;

import cz.msebera.android.httpclient.annotation.GuardedBy;
import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.conn.ClientConnectionManager;
import cz.msebera.android.httpclient.conn.ClientConnectionOperator;
import cz.msebera.android.httpclient.conn.ClientConnectionRequest;
import cz.msebera.android.httpclient.conn.ManagedClientConnection;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.conn.scheme.SchemeRegistry;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.Asserts;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

@Deprecated
@ThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/conn/SingleClientConnManager.class */
public class SingleClientConnManager implements ClientConnectionManager {
    public HttpClientAndroidLog log;
    public static final String MISUSE_MESSAGE = "Invalid use of SingleClientConnManager: connection still allocated.\nMake sure to release the connection before allocating another one.";
    protected final SchemeRegistry schemeRegistry;
    protected final ClientConnectionOperator connOperator;
    protected final boolean alwaysShutDown;

    @GuardedBy("this")
    protected volatile PoolEntry uniquePoolEntry;

    @GuardedBy("this")
    protected volatile ConnAdapter managedConn;

    @GuardedBy("this")
    protected volatile long lastReleaseTime;

    @GuardedBy("this")
    protected volatile long connectionExpiresTime;
    protected volatile boolean isShutDown;

    @Deprecated
    public SingleClientConnManager(HttpParams params, SchemeRegistry schreg) {
        this(schreg);
    }

    public SingleClientConnManager(SchemeRegistry schreg) {
        this.log = new HttpClientAndroidLog(getClass());
        Args.notNull(schreg, "Scheme registry");
        this.schemeRegistry = schreg;
        this.connOperator = createConnectionOperator(schreg);
        this.uniquePoolEntry = new PoolEntry();
        this.managedConn = null;
        this.lastReleaseTime = -1L;
        this.alwaysShutDown = false;
        this.isShutDown = false;
    }

    public SingleClientConnManager() {
        this(SchemeRegistryFactory.createDefault());
    }

    protected void finalize() throws Throwable {
        try {
            shutdown();
        } finally {
            super.finalize();
        }
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public SchemeRegistry getSchemeRegistry() {
        return this.schemeRegistry;
    }

    protected ClientConnectionOperator createConnectionOperator(SchemeRegistry schreg) {
        return new DefaultClientConnectionOperator(schreg);
    }

    protected final void assertStillUp() throws IllegalStateException {
        Asserts.check(!this.isShutDown, "Manager is shut down");
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public final ClientConnectionRequest requestConnection(final HttpRoute route, final Object state) {
        return new ClientConnectionRequest() { // from class: cz.msebera.android.httpclient.impl.conn.SingleClientConnManager.1
            @Override // cz.msebera.android.httpclient.conn.ClientConnectionRequest
            public void abortRequest() {
            }

            @Override // cz.msebera.android.httpclient.conn.ClientConnectionRequest
            public ManagedClientConnection getConnection(long timeout, TimeUnit tunit) {
                return SingleClientConnManager.this.getConnection(route, state);
            }
        };
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00a8 A[Catch: all -> 0x00cc, TryCatch #1 {, blocks: (B:7:0x0033, B:11:0x003f, B:13:0x005d, B:15:0x006b, B:24:0x008c, B:26:0x0098, B:29:0x00a8, B:30:0x00b4, B:31:0x00ca), top: B:40:0x0033, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public cz.msebera.android.httpclient.conn.ManagedClientConnection getConnection(cz.msebera.android.httpclient.conn.routing.HttpRoute r8, java.lang.Object r9) {
        /*
            Method dump skipped, instructions count: 211
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.conn.SingleClientConnManager.getConnection(cz.msebera.android.httpclient.conn.routing.HttpRoute, java.lang.Object):cz.msebera.android.httpclient.conn.ManagedClientConnection");
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public void releaseConnection(ManagedClientConnection conn, long validDuration, TimeUnit timeUnit) {
        Args.check(conn instanceof ConnAdapter, "Connection class mismatch, connection not obtained from this manager");
        assertStillUp();
        if (this.log.isDebugEnabled()) {
            this.log.debug("Releasing connection " + conn);
        }
        ConnAdapter sca = (ConnAdapter) conn;
        synchronized (sca) {
            if (sca.poolEntry == null) {
                return;
            }
            ClientConnectionManager manager = sca.getManager();
            Asserts.check(manager == this, "Connection not obtained from this manager");
            try {
                try {
                    if (sca.isOpen() && (this.alwaysShutDown || !sca.isMarkedReusable())) {
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("Released connection open but not reusable.");
                        }
                        sca.shutdown();
                    }
                    sca.detach();
                    synchronized (this) {
                        this.managedConn = null;
                        this.lastReleaseTime = System.currentTimeMillis();
                        if (validDuration > 0) {
                            this.connectionExpiresTime = timeUnit.toMillis(validDuration) + this.lastReleaseTime;
                        } else {
                            this.connectionExpiresTime = Long.MAX_VALUE;
                        }
                    }
                } catch (Throwable th) {
                    sca.detach();
                    synchronized (this) {
                        this.managedConn = null;
                        this.lastReleaseTime = System.currentTimeMillis();
                        if (validDuration > 0) {
                            this.connectionExpiresTime = timeUnit.toMillis(validDuration) + this.lastReleaseTime;
                        } else {
                            this.connectionExpiresTime = Long.MAX_VALUE;
                        }
                        throw th;
                    }
                }
            } catch (IOException iox) {
                if (this.log.isDebugEnabled()) {
                    this.log.debug("Exception shutting down released connection.", iox);
                }
                sca.detach();
                synchronized (this) {
                    this.managedConn = null;
                    this.lastReleaseTime = System.currentTimeMillis();
                    if (validDuration > 0) {
                        this.connectionExpiresTime = timeUnit.toMillis(validDuration) + this.lastReleaseTime;
                    } else {
                        this.connectionExpiresTime = Long.MAX_VALUE;
                    }
                }
            }
        }
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public void closeExpiredConnections() {
        long time = this.connectionExpiresTime;
        if (System.currentTimeMillis() >= time) {
            closeIdleConnections(0L, TimeUnit.MILLISECONDS);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0052  */
    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void closeIdleConnections(long r7, java.util.concurrent.TimeUnit r9) {
        /*
            r6 = this;
            r0 = r6
            r0.assertStillUp()
            r0 = r9
            java.lang.String r1 = "Time unit"
            java.lang.Object r0 = cz.msebera.android.httpclient.util.Args.notNull(r0, r1)
            r0 = r6
            r1 = r0
            r10 = r1
            monitor-enter(r0)
            r0 = r6
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$ConnAdapter r0 = r0.managedConn     // Catch: java.lang.Throwable -> L58
            if (r0 != 0) goto L52
            r0 = r6
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$PoolEntry r0 = r0.uniquePoolEntry     // Catch: java.lang.Throwable -> L58
            cz.msebera.android.httpclient.conn.OperatedClientConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L58
            boolean r0 = r0.isOpen()     // Catch: java.lang.Throwable -> L58
            if (r0 == 0) goto L52
            long r0 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Throwable -> L58
            r1 = r9
            r2 = r7
            long r1 = r1.toMillis(r2)     // Catch: java.lang.Throwable -> L58
            long r0 = r0 - r1
            r11 = r0
            r0 = r6
            long r0 = r0.lastReleaseTime     // Catch: java.lang.Throwable -> L58
            r1 = r11
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 > 0) goto L52
            r0 = r6
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$PoolEntry r0 = r0.uniquePoolEntry     // Catch: java.io.IOException -> L45 java.lang.Throwable -> L58
            r0.close()     // Catch: java.io.IOException -> L45 java.lang.Throwable -> L58
            goto L52
        L45:
            r13 = move-exception
            r0 = r6
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r0 = r0.log     // Catch: java.lang.Throwable -> L58
            java.lang.String r1 = "Problem closing idle connection."
            r2 = r13
            r0.debug(r1, r2)     // Catch: java.lang.Throwable -> L58
        L52:
            r0 = r10
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L58
            goto L60
        L58:
            r14 = move-exception
            r0 = r10
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L58
            r0 = r14
            throw r0
        L60:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.conn.SingleClientConnManager.closeIdleConnections(long, java.util.concurrent.TimeUnit):void");
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public void shutdown() {
        this.isShutDown = true;
        synchronized (this) {
            try {
                try {
                    if (this.uniquePoolEntry != null) {
                        this.uniquePoolEntry.shutdown();
                    }
                    this.uniquePoolEntry = null;
                    this.managedConn = null;
                } catch (IOException iox) {
                    this.log.debug("Problem while shutting down manager.", iox);
                    this.uniquePoolEntry = null;
                    this.managedConn = null;
                }
            } catch (Throwable th) {
                this.uniquePoolEntry = null;
                this.managedConn = null;
                throw th;
            }
        }
    }

    protected void revokeConnection() {
        ConnAdapter conn = this.managedConn;
        if (conn == null) {
            return;
        }
        conn.detach();
        synchronized (this) {
            try {
                this.uniquePoolEntry.shutdown();
            } catch (IOException iox) {
                this.log.debug("Problem while shutting down connection.", iox);
            }
        }
    }

    /* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/conn/SingleClientConnManager$PoolEntry.class */
    protected class PoolEntry extends AbstractPoolEntry {
        protected PoolEntry() {
            super(SingleClientConnManager.this.connOperator, null);
        }

        protected void close() throws IOException {
            shutdownEntry();
            if (this.connection.isOpen()) {
                this.connection.close();
            }
        }

        protected void shutdown() throws IOException {
            shutdownEntry();
            if (this.connection.isOpen()) {
                this.connection.shutdown();
            }
        }
    }

    /* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/conn/SingleClientConnManager$ConnAdapter.class */
    protected class ConnAdapter extends AbstractPooledConnAdapter {
        protected ConnAdapter(PoolEntry entry, HttpRoute route) {
            super(SingleClientConnManager.this, entry);
            markReusable();
            entry.route = route;
        }
    }
}
