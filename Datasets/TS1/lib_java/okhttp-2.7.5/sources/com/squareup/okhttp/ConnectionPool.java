package com.squareup.okhttp;

import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.RouteDatabase;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.http.StreamAllocation;
import com.squareup.okhttp.internal.io.RealConnection;
import java.lang.ref.Reference;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/ConnectionPool.class */
public final class ConnectionPool {
    private static final long DEFAULT_KEEP_ALIVE_DURATION_MS = 300000;
    private static final ConnectionPool systemDefault;
    private final Executor executor;
    private final int maxIdleConnections;
    private final long keepAliveDurationNs;
    private Runnable cleanupRunnable;
    private final Deque<RealConnection> connections;
    final RouteDatabase routeDatabase;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !ConnectionPool.class.desiredAssertionStatus();
        String keepAlive = System.getProperty("http.keepAlive");
        String keepAliveDuration = System.getProperty("http.keepAliveDuration");
        String maxIdleConnections = System.getProperty("http.maxConnections");
        long keepAliveDurationMs = keepAliveDuration != null ? Long.parseLong(keepAliveDuration) : DEFAULT_KEEP_ALIVE_DURATION_MS;
        if (keepAlive != null && !Boolean.parseBoolean(keepAlive)) {
            systemDefault = new ConnectionPool(0, keepAliveDurationMs);
        } else if (maxIdleConnections != null) {
            systemDefault = new ConnectionPool(Integer.parseInt(maxIdleConnections), keepAliveDurationMs);
        } else {
            systemDefault = new ConnectionPool(5, keepAliveDurationMs);
        }
    }

    public ConnectionPool(int maxIdleConnections, long keepAliveDurationMs) {
        this(maxIdleConnections, keepAliveDurationMs, TimeUnit.MILLISECONDS);
    }

    public ConnectionPool(int maxIdleConnections, long keepAliveDuration, TimeUnit timeUnit) {
        this.executor = new ThreadPoolExecutor(0, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue(), Util.threadFactory("OkHttp ConnectionPool", true));
        this.cleanupRunnable = new Runnable() { // from class: com.squareup.okhttp.ConnectionPool.1
            @Override // java.lang.Runnable
            public void run() {
                while (true) {
                    long waitNanos = ConnectionPool.this.cleanup(System.nanoTime());
                    if (waitNanos == -1) {
                        return;
                    }
                    if (waitNanos > 0) {
                        long waitMillis = waitNanos / 1000000;
                        long waitNanos2 = waitNanos - (waitMillis * 1000000);
                        synchronized (ConnectionPool.this) {
                            try {
                                ConnectionPool.this.wait(waitMillis, (int) waitNanos2);
                            } catch (InterruptedException e) {
                            }
                        }
                    }
                }
            }
        };
        this.connections = new ArrayDeque();
        this.routeDatabase = new RouteDatabase();
        this.maxIdleConnections = maxIdleConnections;
        this.keepAliveDurationNs = timeUnit.toNanos(keepAliveDuration);
        if (keepAliveDuration <= 0) {
            throw new IllegalArgumentException("keepAliveDuration <= 0: " + keepAliveDuration);
        }
    }

    public static ConnectionPool getDefault() {
        return systemDefault;
    }

    public synchronized int getIdleConnectionCount() {
        int total = 0;
        for (RealConnection connection : this.connections) {
            if (connection.allocations.isEmpty()) {
                total++;
            }
        }
        return total;
    }

    public synchronized int getConnectionCount() {
        return this.connections.size();
    }

    @Deprecated
    public synchronized int getSpdyConnectionCount() {
        return getMultiplexedConnectionCount();
    }

    public synchronized int getMultiplexedConnectionCount() {
        int total = 0;
        for (RealConnection connection : this.connections) {
            if (connection.isMultiplexed()) {
                total++;
            }
        }
        return total;
    }

    public synchronized int getHttpConnectionCount() {
        return this.connections.size() - getMultiplexedConnectionCount();
    }

    RealConnection get(Address address, StreamAllocation streamAllocation) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        for (RealConnection connection : this.connections) {
            if (connection.allocations.size() < connection.allocationLimit() && address.equals(connection.getRoute().address) && !connection.noNewStreams) {
                streamAllocation.acquire(connection);
                return connection;
            }
        }
        return null;
    }

    void put(RealConnection connection) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (this.connections.isEmpty()) {
            this.executor.execute(this.cleanupRunnable);
        }
        this.connections.add(connection);
    }

    boolean connectionBecameIdle(RealConnection connection) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (connection.noNewStreams || this.maxIdleConnections == 0) {
            this.connections.remove(connection);
            return true;
        }
        notifyAll();
        return false;
    }

    public void evictAll() {
        List<RealConnection> evictedConnections = new ArrayList<>();
        synchronized (this) {
            Iterator<RealConnection> i = this.connections.iterator();
            while (i.hasNext()) {
                RealConnection connection = i.next();
                if (connection.allocations.isEmpty()) {
                    connection.noNewStreams = true;
                    evictedConnections.add(connection);
                    i.remove();
                }
            }
        }
        Iterator<RealConnection> it = evictedConnections.iterator();
        while (it.hasNext()) {
            Util.closeQuietly(it.next().getSocket());
        }
    }

    long cleanup(long now) {
        int inUseConnectionCount = 0;
        int idleConnectionCount = 0;
        RealConnection longestIdleConnection = null;
        long longestIdleDurationNs = Long.MIN_VALUE;
        synchronized (this) {
            for (RealConnection connection : this.connections) {
                if (pruneAndGetAllocationCount(connection, now) > 0) {
                    inUseConnectionCount++;
                } else {
                    idleConnectionCount++;
                    long idleDurationNs = now - connection.idleAtNanos;
                    if (idleDurationNs > longestIdleDurationNs) {
                        longestIdleDurationNs = idleDurationNs;
                        longestIdleConnection = connection;
                    }
                }
            }
            if (longestIdleDurationNs >= this.keepAliveDurationNs || idleConnectionCount > this.maxIdleConnections) {
                this.connections.remove(longestIdleConnection);
                Util.closeQuietly(longestIdleConnection.getSocket());
                return 0L;
            }
            if (idleConnectionCount > 0) {
                return this.keepAliveDurationNs - longestIdleDurationNs;
            }
            if (inUseConnectionCount > 0) {
                return this.keepAliveDurationNs;
            }
            return -1L;
        }
    }

    private int pruneAndGetAllocationCount(RealConnection connection, long now) {
        List<Reference<StreamAllocation>> references = connection.allocations;
        int i = 0;
        while (i < references.size()) {
            Reference<StreamAllocation> reference = references.get(i);
            if (reference.get() != null) {
                i++;
            } else {
                Internal.logger.warning("A connection to " + connection.getRoute().getAddress().url() + " was leaked. Did you forget to close a response body?");
                references.remove(i);
                connection.noNewStreams = true;
                if (references.isEmpty()) {
                    connection.idleAtNanos = now - this.keepAliveDurationNs;
                    return 0;
                }
            }
        }
        return references.size();
    }

    void setCleanupRunnableForTest(Runnable cleanupRunnable) {
        this.cleanupRunnable = cleanupRunnable;
    }
}
