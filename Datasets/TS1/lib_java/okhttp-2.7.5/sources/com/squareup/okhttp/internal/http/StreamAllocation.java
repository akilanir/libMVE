package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Address;
import com.squareup.okhttp.ConnectionPool;
import com.squareup.okhttp.Route;
import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.RouteDatabase;
import com.squareup.okhttp.internal.io.RealConnection;
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
import okio.Sink;

/* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/internal/http/StreamAllocation.class */
public final class StreamAllocation {
    public final Address address;
    private final ConnectionPool connectionPool;
    private RouteSelector routeSelector;
    private RealConnection connection;
    private boolean released;
    private boolean canceled;
    private HttpStream stream;

    public StreamAllocation(ConnectionPool connectionPool, Address address) {
        this.connectionPool = connectionPool;
        this.address = address;
    }

    public HttpStream newStream(int connectTimeout, int readTimeout, int writeTimeout, boolean connectionRetryEnabled, boolean doExtensiveHealthChecks) throws RouteException, IOException {
        HttpStream resultStream;
        HttpStream httpStream;
        try {
            RealConnection resultConnection = findHealthyConnection(connectTimeout, readTimeout, writeTimeout, connectionRetryEnabled, doExtensiveHealthChecks);
            if (resultConnection.framedConnection != null) {
                resultStream = new Http2xStream(this, resultConnection.framedConnection);
            } else {
                resultConnection.getSocket().setSoTimeout(readTimeout);
                resultConnection.source.timeout().timeout(readTimeout, TimeUnit.MILLISECONDS);
                resultConnection.sink.timeout().timeout(writeTimeout, TimeUnit.MILLISECONDS);
                resultStream = new Http1xStream(this, resultConnection.source, resultConnection.sink);
            }
            synchronized (this.connectionPool) {
                resultConnection.streamCount++;
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
                if (candidate.streamCount == 0) {
                    return candidate;
                }
                if (candidate.isHealthy(doExtensiveHealthChecks)) {
                    return candidate;
                }
                connectionFailed();
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
            if (this.routeSelector == null) {
                this.routeSelector = new RouteSelector(this.address, routeDatabase());
            }
            Route route = this.routeSelector.next();
            RealConnection newConnection = new RealConnection(route);
            acquire(newConnection);
            synchronized (this.connectionPool) {
                Internal.instance.put(this.connectionPool, newConnection);
                this.connection = newConnection;
                if (this.canceled) {
                    throw new IOException("Canceled");
                }
            }
            newConnection.connect(connectTimeout, readTimeout, writeTimeout, this.address.getConnectionSpecs(), connectionRetryEnabled);
            routeDatabase().connected(newConnection.getRoute());
            return newConnection;
        }
    }

    public void streamFinished(HttpStream stream) {
        synchronized (this.connectionPool) {
            if (stream != null) {
                if (stream == this.stream) {
                }
            }
            throw new IllegalStateException("expected " + this.stream + " but was " + stream);
        }
        deallocate(false, false, true);
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
    /* JADX WARN: Removed duplicated region for block: B:9:0x0018 A[Catch: all -> 0x009a, TryCatch #0 {, blocks: (B:6:0x000f, B:9:0x0018, B:10:0x001d, B:14:0x0028, B:15:0x0030, B:17:0x0037, B:19:0x003e, B:21:0x0048, B:23:0x005a, B:24:0x005f, B:26:0x006e, B:28:0x0089, B:29:0x008f, B:31:0x0096), top: B:42:0x000f }] */
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
            com.squareup.okhttp.ConnectionPool r0 = r0.connectionPool
            r1 = r0
            r9 = r1
            monitor-enter(r0)
            r0 = r7
            if (r0 == 0) goto L14
            r0 = r4
            r1 = 0
            r0.stream = r1     // Catch: java.lang.Throwable -> L9a
        L14:
            r0 = r6
            if (r0 == 0) goto L1d
            r0 = r4
            r1 = 1
            r0.released = r1     // Catch: java.lang.Throwable -> L9a
        L1d:
            r0 = r4
            com.squareup.okhttp.internal.io.RealConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L9a
            if (r0 == 0) goto L94
            r0 = r5
            if (r0 == 0) goto L30
            r0 = r4
            com.squareup.okhttp.internal.io.RealConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L9a
            r1 = 1
            r0.noNewStreams = r1     // Catch: java.lang.Throwable -> L9a
        L30:
            r0 = r4
            com.squareup.okhttp.internal.http.HttpStream r0 = r0.stream     // Catch: java.lang.Throwable -> L9a
            if (r0 != 0) goto L94
            r0 = r4
            boolean r0 = r0.released     // Catch: java.lang.Throwable -> L9a
            if (r0 != 0) goto L48
            r0 = r4
            com.squareup.okhttp.internal.io.RealConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L9a
            boolean r0 = r0.noNewStreams     // Catch: java.lang.Throwable -> L9a
            if (r0 == 0) goto L94
        L48:
            r0 = r4
            r1 = r4
            com.squareup.okhttp.internal.io.RealConnection r1 = r1.connection     // Catch: java.lang.Throwable -> L9a
            r0.release(r1)     // Catch: java.lang.Throwable -> L9a
            r0 = r4
            com.squareup.okhttp.internal.io.RealConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L9a
            int r0 = r0.streamCount     // Catch: java.lang.Throwable -> L9a
            if (r0 <= 0) goto L5f
            r0 = r4
            r1 = 0
            r0.routeSelector = r1     // Catch: java.lang.Throwable -> L9a
        L5f:
            r0 = r4
            com.squareup.okhttp.internal.io.RealConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L9a
            java.util.List<java.lang.ref.Reference<com.squareup.okhttp.internal.http.StreamAllocation>> r0 = r0.allocations     // Catch: java.lang.Throwable -> L9a
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> L9a
            if (r0 == 0) goto L8f
            r0 = r4
            com.squareup.okhttp.internal.io.RealConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L9a
            long r1 = java.lang.System.nanoTime()     // Catch: java.lang.Throwable -> L9a
            r0.idleAtNanos = r1     // Catch: java.lang.Throwable -> L9a
            com.squareup.okhttp.internal.Internal r0 = com.squareup.okhttp.internal.Internal.instance     // Catch: java.lang.Throwable -> L9a
            r1 = r4
            com.squareup.okhttp.ConnectionPool r1 = r1.connectionPool     // Catch: java.lang.Throwable -> L9a
            r2 = r4
            com.squareup.okhttp.internal.io.RealConnection r2 = r2.connection     // Catch: java.lang.Throwable -> L9a
            boolean r0 = r0.connectionBecameIdle(r1, r2)     // Catch: java.lang.Throwable -> L9a
            if (r0 == 0) goto L8f
            r0 = r4
            com.squareup.okhttp.internal.io.RealConnection r0 = r0.connection     // Catch: java.lang.Throwable -> L9a
            r8 = r0
        L8f:
            r0 = r4
            r1 = 0
            r0.connection = r1     // Catch: java.lang.Throwable -> L9a
        L94:
            r0 = r9
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L9a
            goto La2
        L9a:
            r10 = move-exception
            r0 = r9
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L9a
            r0 = r10
            throw r0
        La2:
            r0 = r8
            if (r0 == 0) goto Laf
            r0 = r8
            java.net.Socket r0 = r0.getSocket()
            com.squareup.okhttp.internal.Util.closeQuietly(r0)
        Laf:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.squareup.okhttp.internal.http.StreamAllocation.deallocate(boolean, boolean, boolean):void");
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

    private void connectionFailed(IOException e) {
        synchronized (this.connectionPool) {
            if (this.routeSelector != null) {
                if (this.connection.streamCount == 0) {
                    Route failedRoute = this.connection.getRoute();
                    this.routeSelector.connectFailed(failedRoute, e);
                } else {
                    this.routeSelector = null;
                }
            }
        }
        connectionFailed();
    }

    public void connectionFailed() {
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

    public boolean recover(RouteException e) {
        if (this.connection != null) {
            connectionFailed(e.getLastConnectException());
        }
        if ((this.routeSelector != null && !this.routeSelector.hasNext()) || !isRecoverable(e)) {
            return false;
        }
        return true;
    }

    public boolean recover(IOException e, Sink requestBodyOut) {
        if (this.connection != null) {
            int streamCount = this.connection.streamCount;
            connectionFailed(e);
            if (streamCount == 1) {
                return false;
            }
        }
        boolean canRetryRequestBody = requestBodyOut == null || (requestBodyOut instanceof RetryableSink);
        if ((this.routeSelector != null && !this.routeSelector.hasNext()) || !isRecoverable(e) || !canRetryRequestBody) {
            return false;
        }
        return true;
    }

    private boolean isRecoverable(IOException e) {
        if ((e instanceof ProtocolException) || (e instanceof InterruptedIOException)) {
            return false;
        }
        return true;
    }

    private boolean isRecoverable(RouteException e) {
        IOException ioe = e.getLastConnectException();
        if (ioe instanceof ProtocolException) {
            return false;
        }
        if (ioe instanceof InterruptedIOException) {
            return ioe instanceof SocketTimeoutException;
        }
        if (((ioe instanceof SSLHandshakeException) && (ioe.getCause() instanceof CertificateException)) || (ioe instanceof SSLPeerUnverifiedException)) {
            return false;
        }
        return true;
    }

    public String toString() {
        return this.address.toString();
    }
}
