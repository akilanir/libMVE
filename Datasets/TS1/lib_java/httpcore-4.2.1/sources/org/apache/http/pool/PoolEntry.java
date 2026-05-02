package org.apache.http.pool;

import java.util.concurrent.TimeUnit;
import org.apache.http.annotation.GuardedBy;
import org.apache.http.annotation.ThreadSafe;

@ThreadSafe
/* loaded from: httpcore-4.2.1.jar:org/apache/http/pool/PoolEntry.class */
public abstract class PoolEntry<T, C> {
    private final String id;
    private final T route;
    private final C conn;
    private final long created;
    private final long validUnit;

    @GuardedBy("this")
    private long updated;

    @GuardedBy("this")
    private long expiry;
    private volatile Object state;

    public abstract void close();

    public abstract boolean isClosed();

    public PoolEntry(String id, T route, C conn, long timeToLive, TimeUnit tunit) {
        if (route == null) {
            throw new IllegalArgumentException("Route may not be null");
        }
        if (conn == null) {
            throw new IllegalArgumentException("Connection may not be null");
        }
        if (tunit == null) {
            throw new IllegalArgumentException("Time unit may not be null");
        }
        this.id = id;
        this.route = route;
        this.conn = conn;
        this.created = System.currentTimeMillis();
        if (timeToLive > 0) {
            this.validUnit = this.created + tunit.toMillis(timeToLive);
        } else {
            this.validUnit = Long.MAX_VALUE;
        }
        this.expiry = this.validUnit;
    }

    public PoolEntry(String id, T route, C conn) {
        this(id, route, conn, 0L, TimeUnit.MILLISECONDS);
    }

    public String getId() {
        return this.id;
    }

    public T getRoute() {
        return this.route;
    }

    public C getConnection() {
        return this.conn;
    }

    public long getCreated() {
        return this.created;
    }

    public long getValidUnit() {
        return this.validUnit;
    }

    public Object getState() {
        return this.state;
    }

    public void setState(Object state) {
        this.state = state;
    }

    public synchronized long getUpdated() {
        return this.updated;
    }

    public synchronized long getExpiry() {
        return this.expiry;
    }

    public synchronized void updateExpiry(long time, TimeUnit tunit) {
        long newExpiry;
        if (tunit == null) {
            throw new IllegalArgumentException("Time unit may not be null");
        }
        this.updated = System.currentTimeMillis();
        if (time > 0) {
            newExpiry = this.updated + tunit.toMillis(time);
        } else {
            newExpiry = Long.MAX_VALUE;
        }
        this.expiry = Math.min(newExpiry, this.validUnit);
    }

    public synchronized boolean isExpired(long now) {
        return now >= this.expiry;
    }

    public String toString() {
        return "[id:" + this.id + "][route:" + this.route + "][state:" + this.state + "]";
    }
}
