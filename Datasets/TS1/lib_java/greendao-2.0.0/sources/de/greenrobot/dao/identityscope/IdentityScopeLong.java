package de.greenrobot.dao.identityscope;

import de.greenrobot.dao.internal.LongHashMap;
import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/identityscope/IdentityScopeLong.class */
public class IdentityScopeLong<T> implements IdentityScope<Long, T> {
    private final LongHashMap<Reference<T>> map = new LongHashMap<>();
    private final ReentrantLock lock = new ReentrantLock();

    /* JADX WARN: Multi-variable type inference failed */
    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public /* bridge */ /* synthetic */ boolean detach(Long l, Object obj) {
        return detach2(l, (Long) obj);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public /* bridge */ /* synthetic */ void putNoLock(Long l, Object obj) {
        putNoLock2(l, (Long) obj);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public /* bridge */ /* synthetic */ void put(Long l, Object obj) {
        put3(l, (Long) obj);
    }

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public T get(Long key) {
        return get2(key.longValue());
    }

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public T getNoLock(Long key) {
        return get2NoLock(key.longValue());
    }

    public T get2(long key) {
        this.lock.lock();
        try {
            Reference<T> ref = this.map.get(key);
            this.lock.unlock();
            if (ref != null) {
                return ref.get();
            }
            return null;
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    public T get2NoLock(long key) {
        Reference<T> ref = this.map.get(key);
        if (ref != null) {
            return ref.get();
        }
        return null;
    }

    /* renamed from: put, reason: avoid collision after fix types in other method */
    public void put3(Long key, T entity) {
        put2(key.longValue(), entity);
    }

    /* renamed from: putNoLock, reason: avoid collision after fix types in other method */
    public void putNoLock2(Long key, T entity) {
        put2NoLock(key.longValue(), entity);
    }

    public void put2(long key, T entity) {
        this.lock.lock();
        try {
            this.map.put(key, new WeakReference(entity));
            this.lock.unlock();
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    public void put2NoLock(long key, T entity) {
        this.map.put(key, new WeakReference(entity));
    }

    /* renamed from: detach, reason: avoid collision after fix types in other method */
    public boolean detach2(Long key, T entity) {
        this.lock.lock();
        try {
            if (get(key) == entity && entity != null) {
                remove(key);
                this.lock.unlock();
                return true;
            }
            return false;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public void remove(Long key) {
        this.lock.lock();
        try {
            this.map.remove(key.longValue());
            this.lock.unlock();
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public void remove(Iterable<Long> keys) {
        this.lock.lock();
        try {
            for (Long key : keys) {
                this.map.remove(key.longValue());
            }
        } finally {
            this.lock.unlock();
        }
    }

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public void clear() {
        this.lock.lock();
        try {
            this.map.clear();
            this.lock.unlock();
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public void lock() {
        this.lock.lock();
    }

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public void unlock() {
        this.lock.unlock();
    }

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public void reserveRoom(int count) {
        this.map.reserveRoom(count);
    }
}
