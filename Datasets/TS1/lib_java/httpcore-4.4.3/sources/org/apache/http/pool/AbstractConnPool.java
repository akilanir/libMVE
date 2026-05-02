package org.apache.http.pool;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.concurrent.FutureCallback;
import org.apache.http.pool.PoolEntry;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@ThreadSafe
/* loaded from: httpcore-4.4.3.jar:org/apache/http/pool/AbstractConnPool.class */
public abstract class AbstractConnPool<T, C, E extends PoolEntry<T, C>> implements ConnPool<T, E>, ConnPoolControl<T> {
    private final ConnFactory<T, C> connFactory;
    private volatile boolean isShutDown;
    private volatile int defaultMaxPerRoute;
    private volatile int maxTotal;
    private volatile int validateAfterInactivity;
    private final Lock lock = new ReentrantLock();
    private final Map<T, RouteSpecificPool<T, C, E>> routeToPool = new HashMap();
    private final Set<E> leased = new HashSet();
    private final LinkedList<E> available = new LinkedList<>();
    private final LinkedList<PoolEntryFuture<E>> pending = new LinkedList<>();
    private final Map<T, Integer> maxPerRoute = new HashMap();

    protected abstract E createEntry(T t, C c);

    public AbstractConnPool(ConnFactory<T, C> connFactory, int defaultMaxPerRoute, int maxTotal) {
        this.connFactory = (ConnFactory) Args.notNull(connFactory, "Connection factory");
        this.defaultMaxPerRoute = Args.positive(defaultMaxPerRoute, "Max per route value");
        this.maxTotal = Args.positive(maxTotal, "Max total value");
    }

    protected void onLease(E entry) {
    }

    protected void onRelease(E entry) {
    }

    protected void onReuse(E entry) {
    }

    protected boolean validate(E entry) {
        return true;
    }

    public boolean isShutdown() {
        return this.isShutDown;
    }

    public void shutdown() throws IOException {
        if (this.isShutDown) {
            return;
        }
        this.isShutDown = true;
        this.lock.lock();
        try {
            Iterator i$ = this.available.iterator();
            while (i$.hasNext()) {
                E entry = i$.next();
                entry.close();
            }
            for (E entry2 : this.leased) {
                entry2.close();
            }
            for (RouteSpecificPool<T, C, E> pool : this.routeToPool.values()) {
                pool.shutdown();
            }
            this.routeToPool.clear();
            this.leased.clear();
            this.available.clear();
            this.lock.unlock();
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private RouteSpecificPool<T, C, E> getPool(final T route) {
        RouteSpecificPool pool = this.routeToPool.get(route);
        if (pool == null) {
            pool = new RouteSpecificPool<T, C, E>(route) { // from class: org.apache.http.pool.AbstractConnPool.1
                /* JADX WARN: Multi-variable type inference failed */
                @Override // org.apache.http.pool.RouteSpecificPool
                protected E createEntry(C c) {
                    return (E) AbstractConnPool.this.createEntry(route, c);
                }
            };
            this.routeToPool.put(route, pool);
        }
        return pool;
    }

    @Override // org.apache.http.pool.ConnPool
    public Future<E> lease(final T t, final Object obj, FutureCallback<E> futureCallback) {
        Args.notNull(t, "Route");
        Asserts.check(!this.isShutDown, "Connection pool shut down");
        return new PoolEntryFuture<E>(this.lock, futureCallback) { // from class: org.apache.http.pool.AbstractConnPool.2
            @Override // org.apache.http.pool.PoolEntryFuture
            public E getPoolEntry(long j, TimeUnit timeUnit) throws InterruptedException, TimeoutException, IOException {
                E e = (E) AbstractConnPool.this.getPoolEntryBlocking(t, obj, j, timeUnit, this);
                AbstractConnPool.this.onLease(e);
                return e;
            }
        };
    }

    public Future<E> lease(T route, Object state) {
        return lease(route, state, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v18, types: [org.apache.http.pool.PoolEntry] */
    /* JADX WARN: Type inference failed for: r0v9, types: [org.apache.http.pool.RouteSpecificPool] */
    /* JADX WARN: Type inference failed for: r8v0, types: [org.apache.http.pool.AbstractConnPool, org.apache.http.pool.AbstractConnPool<T, C, E extends org.apache.http.pool.PoolEntry<T, C>>] */
    public E getPoolEntryBlocking(T t, Object obj, long j, TimeUnit timeUnit, PoolEntryFuture<E> poolEntryFuture) throws IOException, InterruptedException, TimeoutException {
        PoolEntry lastUsed;
        Date date = null;
        if (j > 0) {
            date = new Date(System.currentTimeMillis() + timeUnit.toMillis(j));
        }
        this.lock.lock();
        try {
            ?? pool = getPool(t);
            E e = null;
            while (e == null) {
                Asserts.check(!this.isShutDown, "Connection pool shut down");
                while (true) {
                    e = pool.getFree(obj);
                    if (e == null) {
                        break;
                    }
                    if (e.isExpired(System.currentTimeMillis())) {
                        e.close();
                    } else if (this.validateAfterInactivity > 0 && e.getUpdated() + this.validateAfterInactivity <= System.currentTimeMillis() && !validate(e)) {
                        e.close();
                    }
                    if (!e.isClosed()) {
                        break;
                    }
                    this.available.remove(e);
                    pool.free(e, false);
                }
                if (e != null) {
                    this.available.remove(e);
                    this.leased.add(e);
                    onReuse(e);
                    this.lock.unlock();
                    return e;
                }
                int max = getMax(t);
                int max2 = Math.max(0, (pool.getAllocatedCount() + 1) - max);
                if (max2 > 0) {
                    for (int i = 0; i < max2 && (lastUsed = pool.getLastUsed()) != null; i++) {
                        lastUsed.close();
                        this.available.remove(lastUsed);
                        pool.remove(lastUsed);
                    }
                }
                if (pool.getAllocatedCount() < max) {
                    int max3 = Math.max(this.maxTotal - this.leased.size(), 0);
                    if (max3 > 0) {
                        if (this.available.size() > max3 - 1 && !this.available.isEmpty()) {
                            E removeLast = this.available.removeLast();
                            removeLast.close();
                            getPool(removeLast.getRoute()).remove(removeLast);
                        }
                        E e2 = (E) pool.add(this.connFactory.create(t));
                        this.leased.add(e2);
                        this.lock.unlock();
                        return e2;
                    }
                }
                try {
                    pool.queue(poolEntryFuture);
                    this.pending.add(poolEntryFuture);
                    boolean await = poolEntryFuture.await(date);
                    pool.unqueue(poolEntryFuture);
                    this.pending.remove(poolEntryFuture);
                    if (!await && date != null && date.getTime() <= System.currentTimeMillis()) {
                        break;
                    }
                } catch (Throwable th) {
                    pool.unqueue(poolEntryFuture);
                    this.pending.remove(poolEntryFuture);
                    throw th;
                }
            }
            throw new TimeoutException("Timeout waiting for connection");
        } catch (Throwable th2) {
            this.lock.unlock();
            throw th2;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.apache.http.pool.ConnPool
    public void release(E entry, boolean reusable) {
        this.lock.lock();
        try {
            if (this.leased.remove(entry)) {
                RouteSpecificPool<T, C, E> pool = getPool(entry.getRoute());
                pool.free(entry, reusable);
                if (reusable && !this.isShutDown) {
                    this.available.addFirst(entry);
                    onRelease(entry);
                } else {
                    entry.close();
                }
                PoolEntryFuture<E> future = pool.nextPending();
                if (future != null) {
                    this.pending.remove(future);
                } else {
                    future = this.pending.poll();
                }
                if (future != null) {
                    future.wakeup();
                }
            }
        } finally {
            this.lock.unlock();
        }
    }

    private int getMax(T route) {
        Integer v = this.maxPerRoute.get(route);
        if (v != null) {
            return v.intValue();
        }
        return this.defaultMaxPerRoute;
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public void setMaxTotal(int max) {
        Args.positive(max, "Max value");
        this.lock.lock();
        try {
            this.maxTotal = max;
            this.lock.unlock();
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public int getMaxTotal() {
        this.lock.lock();
        try {
            int i = this.maxTotal;
            this.lock.unlock();
            return i;
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public void setDefaultMaxPerRoute(int max) {
        Args.positive(max, "Max per route value");
        this.lock.lock();
        try {
            this.defaultMaxPerRoute = max;
            this.lock.unlock();
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public int getDefaultMaxPerRoute() {
        this.lock.lock();
        try {
            int i = this.defaultMaxPerRoute;
            this.lock.unlock();
            return i;
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public void setMaxPerRoute(T route, int max) {
        Args.notNull(route, "Route");
        Args.positive(max, "Max per route value");
        this.lock.lock();
        try {
            this.maxPerRoute.put(route, Integer.valueOf(max));
            this.lock.unlock();
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public int getMaxPerRoute(T route) {
        Args.notNull(route, "Route");
        this.lock.lock();
        try {
            int max = getMax(route);
            this.lock.unlock();
            return max;
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public PoolStats getTotalStats() {
        this.lock.lock();
        try {
            PoolStats poolStats = new PoolStats(this.leased.size(), this.pending.size(), this.available.size(), this.maxTotal);
            this.lock.unlock();
            return poolStats;
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public PoolStats getStats(T route) {
        Args.notNull(route, "Route");
        this.lock.lock();
        try {
            RouteSpecificPool<T, C, E> pool = getPool(route);
            PoolStats poolStats = new PoolStats(pool.getLeasedCount(), pool.getPendingCount(), pool.getAvailableCount(), getMax(route));
            this.lock.unlock();
            return poolStats;
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    public Set<T> getRoutes() {
        this.lock.lock();
        try {
            HashSet hashSet = new HashSet(this.routeToPool.keySet());
            this.lock.unlock();
            return hashSet;
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    protected void enumAvailable(PoolEntryCallback<T, C> callback) {
        this.lock.lock();
        try {
            Iterator<E> it = this.available.iterator();
            while (it.hasNext()) {
                E entry = it.next();
                callback.process(entry);
                if (entry.isClosed()) {
                    RouteSpecificPool<T, C, E> pool = getPool(entry.getRoute());
                    pool.remove(entry);
                    it.remove();
                }
            }
            purgePoolMap();
            this.lock.unlock();
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    protected void enumLeased(PoolEntryCallback<T, C> callback) {
        this.lock.lock();
        try {
            for (E entry : this.leased) {
                callback.process(entry);
            }
        } finally {
            this.lock.unlock();
        }
    }

    private void purgePoolMap() {
        Iterator<Map.Entry<T, RouteSpecificPool<T, C, E>>> it = this.routeToPool.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<T, RouteSpecificPool<T, C, E>> entry = it.next();
            RouteSpecificPool<T, C, E> pool = entry.getValue();
            if (pool.getPendingCount() + pool.getAllocatedCount() == 0) {
                it.remove();
            }
        }
    }

    public void closeIdle(long idletime, TimeUnit tunit) {
        Args.notNull(tunit, "Time unit");
        long time = tunit.toMillis(idletime);
        if (time < 0) {
            time = 0;
        }
        final long deadline = System.currentTimeMillis() - time;
        enumAvailable(new PoolEntryCallback<T, C>() { // from class: org.apache.http.pool.AbstractConnPool.3
            @Override // org.apache.http.pool.PoolEntryCallback
            public void process(PoolEntry<T, C> entry) {
                if (entry.getUpdated() <= deadline) {
                    entry.close();
                }
            }
        });
    }

    public void closeExpired() {
        final long now = System.currentTimeMillis();
        enumAvailable(new PoolEntryCallback<T, C>() { // from class: org.apache.http.pool.AbstractConnPool.4
            @Override // org.apache.http.pool.PoolEntryCallback
            public void process(PoolEntry<T, C> entry) {
                if (entry.isExpired(now)) {
                    entry.close();
                }
            }
        });
    }

    public int getValidateAfterInactivity() {
        return this.validateAfterInactivity;
    }

    public void setValidateAfterInactivity(int ms) {
        this.validateAfterInactivity = ms;
    }

    public String toString() {
        return "[leased: " + this.leased + "][available: " + this.available + "][pending: " + this.pending + "]";
    }
}
