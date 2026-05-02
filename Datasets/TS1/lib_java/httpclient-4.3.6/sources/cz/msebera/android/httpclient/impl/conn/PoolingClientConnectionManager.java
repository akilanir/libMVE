package cz.msebera.android.httpclient.impl.conn;

import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.conn.ClientConnectionManager;
import cz.msebera.android.httpclient.conn.ClientConnectionOperator;
import cz.msebera.android.httpclient.conn.ClientConnectionRequest;
import cz.msebera.android.httpclient.conn.ConnectionPoolTimeoutException;
import cz.msebera.android.httpclient.conn.DnsResolver;
import cz.msebera.android.httpclient.conn.ManagedClientConnection;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.conn.scheme.SchemeRegistry;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.pool.ConnPoolControl;
import cz.msebera.android.httpclient.pool.PoolStats;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.Asserts;
import java.io.IOException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@Deprecated
@ThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/conn/PoolingClientConnectionManager.class */
public class PoolingClientConnectionManager implements ClientConnectionManager, ConnPoolControl<HttpRoute> {
    public HttpClientAndroidLog log;
    private final SchemeRegistry schemeRegistry;
    private final HttpConnPool pool;
    private final ClientConnectionOperator operator;
    private final DnsResolver dnsResolver;

    public PoolingClientConnectionManager(SchemeRegistry schreg) {
        this(schreg, -1L, TimeUnit.MILLISECONDS);
    }

    public PoolingClientConnectionManager(SchemeRegistry schreg, DnsResolver dnsResolver) {
        this(schreg, -1L, TimeUnit.MILLISECONDS, dnsResolver);
    }

    public PoolingClientConnectionManager() {
        this(SchemeRegistryFactory.createDefault());
    }

    public PoolingClientConnectionManager(SchemeRegistry schemeRegistry, long timeToLive, TimeUnit tunit) {
        this(schemeRegistry, timeToLive, tunit, new SystemDefaultDnsResolver());
    }

    public PoolingClientConnectionManager(SchemeRegistry schemeRegistry, long timeToLive, TimeUnit tunit, DnsResolver dnsResolver) {
        this.log = new HttpClientAndroidLog(getClass());
        Args.notNull(schemeRegistry, "Scheme registry");
        Args.notNull(dnsResolver, "DNS resolver");
        this.schemeRegistry = schemeRegistry;
        this.dnsResolver = dnsResolver;
        this.operator = createConnectionOperator(schemeRegistry);
        this.pool = new HttpConnPool(this.log, this.operator, 2, 20, timeToLive, tunit);
    }

    protected void finalize() throws Throwable {
        try {
            shutdown();
        } finally {
            super.finalize();
        }
    }

    protected ClientConnectionOperator createConnectionOperator(SchemeRegistry schreg) {
        return new DefaultClientConnectionOperator(schreg, this.dnsResolver);
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public SchemeRegistry getSchemeRegistry() {
        return this.schemeRegistry;
    }

    private String format(HttpRoute route, Object state) {
        StringBuilder buf = new StringBuilder();
        buf.append("[route: ").append(route).append("]");
        if (state != null) {
            buf.append("[state: ").append(state).append("]");
        }
        return buf.toString();
    }

    private String formatStats(HttpRoute route) {
        StringBuilder buf = new StringBuilder();
        PoolStats totals = this.pool.getTotalStats();
        PoolStats stats = this.pool.getStats(route);
        buf.append("[total kept alive: ").append(totals.getAvailable()).append("; ");
        buf.append("route allocated: ").append(stats.getLeased() + stats.getAvailable());
        buf.append(" of ").append(stats.getMax()).append("; ");
        buf.append("total allocated: ").append(totals.getLeased() + totals.getAvailable());
        buf.append(" of ").append(totals.getMax()).append("]");
        return buf.toString();
    }

    private String format(HttpPoolEntry entry) {
        StringBuilder buf = new StringBuilder();
        buf.append("[id: ").append(entry.getId()).append("]");
        buf.append("[route: ").append(entry.getRoute()).append("]");
        Object state = entry.getState();
        if (state != null) {
            buf.append("[state: ").append(state).append("]");
        }
        return buf.toString();
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public ClientConnectionRequest requestConnection(HttpRoute route, Object state) {
        Args.notNull(route, "HTTP route");
        if (this.log.isDebugEnabled()) {
            this.log.debug("Connection request: " + format(route, state) + formatStats(route));
        }
        final Future<HttpPoolEntry> future = this.pool.lease(route, state);
        return new ClientConnectionRequest() { // from class: cz.msebera.android.httpclient.impl.conn.PoolingClientConnectionManager.1
            @Override // cz.msebera.android.httpclient.conn.ClientConnectionRequest
            public void abortRequest() {
                future.cancel(true);
            }

            @Override // cz.msebera.android.httpclient.conn.ClientConnectionRequest
            public ManagedClientConnection getConnection(long timeout, TimeUnit tunit) throws InterruptedException, ConnectionPoolTimeoutException {
                return PoolingClientConnectionManager.this.leaseConnection(future, timeout, tunit);
            }
        };
    }

    ManagedClientConnection leaseConnection(Future<HttpPoolEntry> future, long timeout, TimeUnit tunit) throws InterruptedException, ConnectionPoolTimeoutException {
        try {
            HttpPoolEntry entry = future.get(timeout, tunit);
            if (entry == null || future.isCancelled()) {
                throw new InterruptedException();
            }
            Asserts.check(entry.getConnection() != null, "Pool entry with no connection");
            if (this.log.isDebugEnabled()) {
                this.log.debug("Connection leased: " + format(entry) + formatStats(entry.getRoute()));
            }
            return new ManagedClientConnectionImpl(this, this.operator, entry);
        } catch (ExecutionException ex) {
            Throwable cause = ex.getCause();
            if (cause == null) {
                cause = ex;
            }
            this.log.error("Unexpected exception leasing connection from pool", cause);
            throw new InterruptedException();
        } catch (TimeoutException e) {
            throw new ConnectionPoolTimeoutException("Timeout waiting for connection from pool");
        }
    }

    /* JADX WARN: Finally extract failed */
    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public void releaseConnection(ManagedClientConnection conn, long keepalive, TimeUnit tunit) {
        String s;
        Args.check(conn instanceof ManagedClientConnectionImpl, "Connection class mismatch, connection not obtained from this manager");
        ManagedClientConnectionImpl managedConn = (ManagedClientConnectionImpl) conn;
        Asserts.check(managedConn.getManager() == this, "Connection not obtained from this manager");
        synchronized (managedConn) {
            HttpPoolEntry entry = managedConn.detach();
            if (entry == null) {
                return;
            }
            try {
                if (managedConn.isOpen() && !managedConn.isMarkedReusable()) {
                    try {
                        managedConn.shutdown();
                    } catch (IOException iox) {
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("I/O exception shutting down released connection", iox);
                        }
                    }
                }
                if (managedConn.isMarkedReusable()) {
                    entry.updateExpiry(keepalive, tunit != null ? tunit : TimeUnit.MILLISECONDS);
                    if (this.log.isDebugEnabled()) {
                        if (keepalive > 0) {
                            s = "for " + keepalive + " " + tunit;
                        } else {
                            s = "indefinitely";
                        }
                        this.log.debug("Connection " + format(entry) + " can be kept alive " + s);
                    }
                }
                this.pool.release((HttpConnPool) entry, managedConn.isMarkedReusable());
                if (this.log.isDebugEnabled()) {
                    this.log.debug("Connection released: " + format(entry) + formatStats(entry.getRoute()));
                }
            } catch (Throwable th) {
                this.pool.release((HttpConnPool) entry, managedConn.isMarkedReusable());
                throw th;
            }
        }
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public void shutdown() {
        this.log.debug("Connection manager is shutting down");
        try {
            this.pool.shutdown();
        } catch (IOException ex) {
            this.log.debug("I/O exception shutting down connection manager", ex);
        }
        this.log.debug("Connection manager shut down");
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public void closeIdleConnections(long idleTimeout, TimeUnit tunit) {
        if (this.log.isDebugEnabled()) {
            this.log.debug("Closing connections idle longer than " + idleTimeout + " " + tunit);
        }
        this.pool.closeIdle(idleTimeout, tunit);
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public void closeExpiredConnections() {
        this.log.debug("Closing expired connections");
        this.pool.closeExpired();
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public int getMaxTotal() {
        return this.pool.getMaxTotal();
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public void setMaxTotal(int max) {
        this.pool.setMaxTotal(max);
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public int getDefaultMaxPerRoute() {
        return this.pool.getDefaultMaxPerRoute();
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public void setDefaultMaxPerRoute(int max) {
        this.pool.setDefaultMaxPerRoute(max);
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public int getMaxPerRoute(HttpRoute route) {
        return this.pool.getMaxPerRoute(route);
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public void setMaxPerRoute(HttpRoute route, int max) {
        this.pool.setMaxPerRoute(route, max);
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public PoolStats getTotalStats() {
        return this.pool.getTotalStats();
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public PoolStats getStats(HttpRoute route) {
        return this.pool.getStats(route);
    }
}
