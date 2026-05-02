package okhttp3.internal.http;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.net.ProtocolException;
import java.net.SocketTimeoutException;
import java.security.cert.CertificateException;
import java.util.concurrent.TimeUnit;
import javax.net.ssl.SSLHandshakeException;
import javax.net.ssl.SSLPeerUnverifiedException;
import okhttp3.Address;
import okhttp3.ConnectionPool;
import okhttp3.Route;
import okhttp3.internal.Internal;
import okhttp3.internal.RouteDatabase;
import okhttp3.internal.io.RealConnection;
import okio.Sink;

/* loaded from: okhttp-3.1.2.jar:okhttp3/internal/http/StreamAllocation.class */
public final class StreamAllocation {
    public final Address address;
    private Route route;
    private final ConnectionPool connectionPool;
    private RouteSelector routeSelector;
    private RealConnection connection;
    private boolean released;
    private boolean canceled;
    private HttpStream stream;

    public StreamAllocation(ConnectionPool connectionPool, Address address) {
        this.connectionPool = connectionPool;
        this.address = address;
        this.routeSelector = new RouteSelector(address, routeDatabase());
    }

    public HttpStream newStream(int connectTimeout, int readTimeout, int writeTimeout, boolean connectionRetryEnabled, boolean doExtensiveHealthChecks) throws RouteException, IOException {
        HttpStream resultStream;
        HttpStream httpStream;
        try {
            RealConnection resultConnection = findHealthyConnection(connectTimeout, readTimeout, writeTimeout, connectionRetryEnabled, doExtensiveHealthChecks);
            if (resultConnection.framedConnection != null) {
                resultStream = new Http2xStream(this, resultConnection.framedConnection);
            } else {
                resultConnection.socket().setSoTimeout(readTimeout);
                resultConnection.source.timeout().timeout(readTimeout, TimeUnit.MILLISECONDS);
                resultConnection.sink.timeout().timeout(writeTimeout, TimeUnit.MILLISECONDS);
                resultStream = new Http1xStream(this, resultConnection.source, resultConnection.sink);
            }
            synchronized (this.connectionPool) {
                this.stream = resultStream;
                httpStream = resultStream;
            }
            return httpStream;
        } catch (IOException e) {
            throw new RouteException(e);
        }
    }

    private RealConnection findHealthyConnection(int connectTimeout, int readTimeout, int writeTimeout, boolean connectionRetryEnabled, boolean doExtensiveHealthChecks) throws IOException, RouteException {
        while (true) {
            RealConnection candidate = findConnection(connectTimeout, readTimeout, writeTimeout, connectionRetryEnabled);
            synchronized (this.connectionPool) {
                if (candidate.successCount == 0) {
                    return candidate;
                }
                if (candidate.isHealthy(doExtensiveHealthChecks)) {
                    return candidate;
                }
                connectionFailed(new IOException());
            }
        }
    }

    private RealConnection findConnection(int connectTimeout, int readTimeout, int writeTimeout, boolean connectionRetryEnabled) throws IOException, RouteException {
        synchronized (this.connectionPool) {
            if (this.released) {
                throw new IllegalStateException("released");
            }
            if (this.stream != null) {
                throw new IllegalStateException("stream != null");
            }
            if (this.canceled) {
                throw new IOException("Canceled");
            }
            RealConnection allocatedConnection = this.connection;
            if (allocatedConnection != null && !allocatedConnection.noNewStreams) {
                return allocatedConnection;
            }
            RealConnection pooledConnection = Internal.instance.get(this.connectionPool, this.address, this);
            if (pooledConnection != null) {
                this.connection = pooledConnection;
                return pooledConnection;
            }
            Route selectedRoute = this.route;
            if (selectedRoute == null) {
                selectedRoute = this.routeSelector.next();
                synchronized (this.connectionPool) {
                    this.route = selectedRoute;
                }
            }
            RealConnection newConnection = new RealConnection(selectedRoute);
            acquire(newConnection);
            synchronized (this.connectionPool) {
                Internal.instance.put(this.connectionPool, newConnection);
                this.connection = newConnection;
                if (this.canceled) {
                    throw new IOException("Canceled");
                }
            }
            newConnection.connect(connectTimeout, readTimeout, writeTimeout, this.address.connectionSpecs(), connectionRetryEnabled);
            routeDatabase().connected(newConnection.route());
            return newConnection;
        }
    }

    public void streamFinished(boolean noNewStreams, HttpStream stream) {
        synchronized (this.connectionPool) {
            if (stream != null) {
                if (stream == this.stream) {
                    if (!noNewStreams) {
                        this.connection.successCount++;
                    }
                }
            }
            throw new IllegalStateException("expected " + this.stream + " but was " + stream);
        }
        deallocate(noNewStreams, false, true);
    }

    public HttpStream stream() {
        HttpStream httpStream;
        synchronized (this.connectionPool) {
            httpStream = this.stream;
        }
        return httpStream;
    }

    private RouteDatabase routeDatabase() {
        return Internal.instance.routeDatabase(this.connectionPool);
    }

    public synchronized RealConnection connection() {
        return this.connection;
    }

    public void release() {
        deallocate(false, true, false);
    }

    public void noNewStreams() {
        deallocate(true, false, false);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0018 A[Catch: all -> 0x008b, TryCatch #0 {, blocks: (B:6:0x000f, B:9:0x0018, B:10:0x001d, B:14:0x0028, B:15:0x0030, B:17:0x0037, B:19:0x003e, B:21:0x0048, B:23:0x005f, B:25:0x007a, B:26:0x0080, B:28:0x0087), top: B:39:0x000f }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void deallocate(boolean r5, boolean r6, boolean r7) {
        /*
            r4 = this;
            r0 = 0
            r8 = r0
            r0 = r4
            okhttp3.ConnectionPool r0 = r0.connectionPool
            r1 = r0
            r9 = r1
            monitor-enter(r0)
            r0 = r7
            if (r0 == 0) goto L14
            r0 = r4
            r1 = 0
            r0.stream = r1     // Catch: java.lang.Throwable -> L8b
        L14:
            r0 = r6
            if (r0 == 0) goto L1d
            r0 = r4
            r1 = 1
            r0.released = r1     // Catch: java.lang.Throwable -> L8b
        L1d:
            r0 = r4
            okhttp3.internal.io.RealConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L8b
            if (r0 == 0) goto L85
            r0 = r5
            if (r0 == 0) goto L30
            r0 = r4
            okhttp3.internal.io.RealConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L8b
            r1 = 1
            r0.noNewStreams = r1     // Catch: java.lang.Throwable -> L8b
        L30:
            r0 = r4
            okhttp3.internal.http.HttpStream r0 = r0.stream     // Catch: java.lang.Throwable -> L8b
            if (r0 != 0) goto L85
            r0 = r4
            boolean r0 = r0.released     // Catch: java.lang.Throwable -> L8b
            if (r0 != 0) goto L48
            r0 = r4
            okhttp3.internal.io.RealConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L8b
            boolean r0 = r0.noNewStreams     // Catch: java.lang.Throwable -> L8b
            if (r0 == 0) goto L85
        L48:
            r0 = r4
            r1 = r4
            okhttp3.internal.io.RealConnection r1 = r1.connection     // Catch: java.lang.Throwable -> L8b
            r0.release(r1)     // Catch: java.lang.Throwable -> L8b
            r0 = r4
            okhttp3.internal.io.RealConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L8b
            java.util.List<java.lang.ref.Reference<okhttp3.internal.http.StreamAllocation>> r0 = r0.allocations     // Catch: java.lang.Throwable -> L8b
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> L8b
            if (r0 == 0) goto L80
            r0 = r4
            okhttp3.internal.io.RealConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L8b
            long r1 = java.lang.System.nanoTime()     // Catch: java.lang.Throwable -> L8b
            r0.idleAtNanos = r1     // Catch: java.lang.Throwable -> L8b
            okhttp3.internal.Internal r0 = okhttp3.internal.Internal.instance     // Catch: java.lang.Throwable -> L8b
            r1 = r4
            okhttp3.ConnectionPool r1 = r1.connectionPool     // Catch: java.lang.Throwable -> L8b
            r2 = r4
            okhttp3.internal.io.RealConnection r2 = r2.connection     // Catch: java.lang.Throwable -> L8b
            boolean r0 = r0.connectionBecameIdle(r1, r2)     // Catch: java.lang.Throwable -> L8b
            if (r0 == 0) goto L80
            r0 = r4
            okhttp3.internal.io.RealConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L8b
            r8 = r0
        L80:
            r0 = r4
            r1 = 0
            r0.connection = r1     // Catch: java.lang.Throwable -> L8b
        L85:
            r0 = r9
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L8b
            goto L93
        L8b:
            r10 = move-exception
            r0 = r9
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L8b
            r0 = r10
            throw r0
        L93:
            r0 = r8
            if (r0 == 0) goto La0
            r0 = r8
            java.net.Socket r0 = r0.socket()
            okhttp3.internal.Util.closeQuietly(r0)
        La0:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.http.StreamAllocation.deallocate(boolean, boolean, boolean):void");
    }

    public void cancel() {
        HttpStream streamToCancel;
        RealConnection connectionToCancel;
        synchronized (this.connectionPool) {
            this.canceled = true;
            streamToCancel = this.stream;
            connectionToCancel = this.connection;
        }
        if (streamToCancel != null) {
            streamToCancel.cancel();
        } else if (connectionToCancel != null) {
            connectionToCancel.cancel();
        }
    }

    public void connectionFailed(IOException e) {
        synchronized (this.connectionPool) {
            if (this.connection != null && this.connection.successCount == 0) {
                if (this.route != null && e != null) {
                    this.routeSelector.connectFailed(this.route, e);
                }
                this.route = null;
            }
        }
        deallocate(true, false, true);
    }

    public void acquire(RealConnection connection) {
        connection.allocations.add(new WeakReference(this));
    }

    private void release(RealConnection connection) {
        int size = connection.allocations.size();
        for (int i = 0; i < size; i++) {
            Reference<StreamAllocation> reference = connection.allocations.get(i);
            if (reference.get() == this) {
                connection.allocations.remove(i);
                return;
            }
        }
        throw new IllegalStateException();
    }

    public boolean recover(IOException e, Sink requestBodyOut) {
        if (this.connection != null) {
            connectionFailed(e);
        }
        boolean canRetryRequestBody = requestBodyOut == null || (requestBodyOut instanceof RetryableSink);
        if ((this.routeSelector != null && !this.routeSelector.hasNext()) || !isRecoverable(e) || !canRetryRequestBody) {
            return false;
        }
        return true;
    }

    private boolean isRecoverable(IOException e) {
        if (e instanceof ProtocolException) {
            return false;
        }
        if (e instanceof InterruptedIOException) {
            return e instanceof SocketTimeoutException;
        }
        if (((e instanceof SSLHandshakeException) && (e.getCause() instanceof CertificateException)) || (e instanceof SSLPeerUnverifiedException)) {
            return false;
        }
        return true;
    }

    public String toString() {
        return this.address.toString();
    }
}
