package com.squareup.okhttp;

import com.squareup.okhttp.internal.Platform;
import com.squareup.okhttp.internal.Util;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/ConnectionPool.class */
public final class ConnectionPool {
    private static final long DEFAULT_KEEP_ALIVE_DURATION_MS = 300000;
    private static final ConnectionPool systemDefault;
    private final int maxIdleConnections;
    private final long keepAliveDurationNs;
    private final LinkedList<Connection> connections = new LinkedList<>();
    private Executor executor = new ThreadPoolExecutor(0, 1, 60, TimeUnit.SECONDS, new LinkedBlockingQueue(), Util.threadFactory("OkHttp ConnectionPool", true));
    private final Runnable connectionsCleanupRunnable = new Runnable() { // from class: com.squareup.okhttp.ConnectionPool.1
        @Override // java.lang.Runnable
        public void run() {
            ConnectionPool.this.runCleanupUntilPoolIsEmpty();
        }
    };

    static {
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
        this.maxIdleConnections = maxIdleConnections;
        this.keepAliveDurationNs = keepAliveDurationMs * 1000 * 1000;
    }

    public static ConnectionPool getDefault() {
        return systemDefault;
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
        Iterator<Connection> it = this.connections.iterator();
        while (it.hasNext()) {
            Connection connection = it.next();
            if (connection.isSpdy()) {
                total++;
            }
        }
        return total;
    }

    public synchronized int getHttpConnectionCount() {
        return this.connections.size() - getMultiplexedConnectionCount();
    }

    public synchronized Connection get(Address address) {
        Connection foundConnection = null;
        ListIterator<Connection> i = this.connections.listIterator(this.connections.size());
        while (i.hasPrevious()) {
            Connection connection = i.previous();
            if (connection.getRoute().getAddress().equals(address) && connection.isAlive() && System.nanoTime() - connection.getIdleStartTimeNs() < this.keepAliveDurationNs) {
                i.remove();
                if (!connection.isSpdy()) {
                    try {
                        Platform.get().tagSocket(connection.getSocket());
                    } catch (SocketException e) {
                        Util.closeQuietly(connection.getSocket());
                        Platform.get().logW("Unable to tagSocket(): " + e);
                    }
                }
                foundConnection = connection;
                break;
            }
        }
        if (foundConnection != null && foundConnection.isSpdy()) {
            this.connections.addFirst(foundConnection);
        }
        return foundConnection;
    }

    void recycle(Connection connection) {
        if (connection.isSpdy() || !connection.clearOwner()) {
            return;
        }
        if (!connection.isAlive()) {
            Util.closeQuietly(connection.getSocket());
            return;
        }
        try {
            Platform.get().untagSocket(connection.getSocket());
            synchronized (this) {
                addConnection(connection);
                connection.incrementRecycleCount();
                connection.resetIdleStartTime();
            }
        } catch (SocketException e) {
            Platform.get().logW("Unable to untagSocket(): " + e);
            Util.closeQuietly(connection.getSocket());
        }
    }

    private void addConnection(Connection connection) {
        boolean empty = this.connections.isEmpty();
        this.connections.addFirst(connection);
        if (empty) {
            this.executor.execute(this.connectionsCleanupRunnable);
        } else {
            notifyAll();
        }
    }

    void share(Connection connection) {
        if (!connection.isSpdy()) {
            throw new IllegalArgumentException();
        }
        if (connection.isAlive()) {
            synchronized (this) {
                addConnection(connection);
            }
        }
    }

    public void evictAll() {
        List<Connection> toEvict;
        synchronized (this) {
            toEvict = new ArrayList<>(this.connections);
            this.connections.clear();
            notifyAll();
        }
        int size = toEvict.size();
        for (int i = 0; i < size; i++) {
            Util.closeQuietly(toEvict.get(i).getSocket());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void runCleanupUntilPoolIsEmpty() {
        while (performCleanup()) {
        }
    }

    boolean performCleanup() {
        synchronized (this) {
            if (this.connections.isEmpty()) {
                return false;
            }
            List<Connection> evictableConnections = new ArrayList<>();
            int idleConnectionCount = 0;
            long now = System.nanoTime();
            long nanosUntilNextEviction = this.keepAliveDurationNs;
            ListIterator<Connection> i = this.connections.listIterator(this.connections.size());
            while (i.hasPrevious()) {
                Connection connection = i.previous();
                long nanosUntilEviction = (connection.getIdleStartTimeNs() + this.keepAliveDurationNs) - now;
                if (nanosUntilEviction <= 0 || !connection.isAlive()) {
                    i.remove();
                    evictableConnections.add(connection);
                } else if (connection.isIdle()) {
                    idleConnectionCount++;
                    nanosUntilNextEviction = Math.min(nanosUntilNextEviction, nanosUntilEviction);
                }
            }
            ListIterator<Connection> i2 = this.connections.listIterator(this.connections.size());
            while (i2.hasPrevious() && idleConnectionCount > this.maxIdleConnections) {
                Connection connection2 = i2.previous();
                if (connection2.isIdle()) {
                    evictableConnections.add(connection2);
                    i2.remove();
                    idleConnectionCount--;
                }
            }
            if (evictableConnections.isEmpty()) {
                try {
                    long millisUntilNextEviction = nanosUntilNextEviction / 1000000;
                    long remainderNanos = nanosUntilNextEviction - (millisUntilNextEviction * 1000000);
                    wait(millisUntilNextEviction, (int) remainderNanos);
                    return true;
                } catch (InterruptedException e) {
                }
            }
            int size = evictableConnections.size();
            for (int i3 = 0; i3 < size; i3++) {
                Connection expiredConnection = evictableConnections.get(i3);
                Util.closeQuietly(expiredConnection.getSocket());
            }
            return true;
        }
    }

    void replaceCleanupExecutorForTests(Executor cleanupExecutor) {
        this.executor = cleanupExecutor;
    }

    synchronized List<Connection> getConnections() {
        return new ArrayList(this.connections);
    }
}
