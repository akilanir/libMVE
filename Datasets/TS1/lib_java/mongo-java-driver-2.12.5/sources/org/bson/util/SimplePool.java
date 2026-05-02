package org.bson.util;

import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/util/SimplePool.class */
public abstract class SimplePool<T> {
    final int _max;
    private Queue<T> _stored;

    protected abstract T createNew();

    public SimplePool(int max) {
        this._stored = new ConcurrentLinkedQueue();
        this._max = max;
    }

    public SimplePool() {
        this._stored = new ConcurrentLinkedQueue();
        this._max = 1000;
    }

    protected boolean ok(T t) {
        return true;
    }

    public T get() {
        T t = this._stored.poll();
        if (t != null) {
            return t;
        }
        return createNew();
    }

    public void done(T t) {
        if (!ok(t) || this._stored.size() > this._max) {
            return;
        }
        this._stored.add(t);
    }
}
