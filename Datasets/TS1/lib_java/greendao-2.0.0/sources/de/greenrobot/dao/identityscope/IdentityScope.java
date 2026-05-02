package de.greenrobot.dao.identityscope;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/identityscope/IdentityScope.class */
public interface IdentityScope<K, T> {
    T get(K k);

    void put(K k, T t);

    T getNoLock(K k);

    void putNoLock(K k, T t);

    boolean detach(K k, T t);

    void remove(K k);

    void remove(Iterable<K> iterable);

    void clear();

    void lock();

    void unlock();

    void reserveRoom(int i);
}
