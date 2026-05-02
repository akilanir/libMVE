package de.greenrobot.dao.identityscope;

import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/identityscope/IdentityScopeObject.class */
public class IdentityScopeObject<K, T> implements IdentityScope<K, T> {
    private final HashMap<K, Reference<T>> map = new HashMap<>();
    private final ReentrantLock lock = new ReentrantLock();

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public T get(K key) {
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

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public T getNoLock(K key) {
        Reference<T> ref = this.map.get(key);
        if (ref != null) {
            return ref.get();
        }
        return null;
    }

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public void put(K key, T entity) {
        this.lock.lock();
        try {
            this.map.put(key, new WeakReference(entity));
            this.lock.unlock();
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public void putNoLock(K key, T entity) {
        this.map.put(key, new WeakReference(entity));
    }

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public boolean detach(K key, T entity) {
        this.lock.lock();
        try {
            if (get(key) == entity && entity != null) {
                remove((IdentityScopeObject<K, T>) key);
                this.lock.unlock();
                return true;
            }
            return false;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public void remove(K key) {
        this.lock.lock();
        try {
            this.map.remove(key);
            this.lock.unlock();
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    @Override // de.greenrobot.dao.identityscope.IdentityScope
    public void remove(Iterable<K> keys) {
        this.lock.lock();
        try {
            for (K key : keys) {
                this.map.remove(key);
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
    }
}
