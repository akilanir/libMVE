package org.apache.commons.lang3.concurrent;

/* loaded from: commons-lang3-3.4.jar:org/apache/commons/lang3/concurrent/LazyInitializer.class */
public abstract class LazyInitializer<T> implements ConcurrentInitializer<T> {
    private volatile T object;

    protected abstract T initialize() throws ConcurrentException;

    @Override // org.apache.commons.lang3.concurrent.ConcurrentInitializer
    public T get() throws ConcurrentException {
        T result = this.object;
        if (result == null) {
            synchronized (this) {
                result = this.object;
                if (result == null) {
                    T initialize = initialize();
                    result = initialize;
                    this.object = initialize;
                }
            }
        }
        return result;
    }
}
