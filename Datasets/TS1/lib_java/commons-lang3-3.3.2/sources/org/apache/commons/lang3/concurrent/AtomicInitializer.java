package org.apache.commons.lang3.concurrent;

import java.util.concurrent.atomic.AtomicReference;

/* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/concurrent/AtomicInitializer.class */
public abstract class AtomicInitializer<T> implements ConcurrentInitializer<T> {
    private final AtomicReference<T> reference = new AtomicReference<>();

    protected abstract T initialize() throws ConcurrentException;

    @Override // org.apache.commons.lang3.concurrent.ConcurrentInitializer
    public T get() throws ConcurrentException {
        T result = this.reference.get();
        if (result == null) {
            result = initialize();
            if (!this.reference.compareAndSet(null, result)) {
                result = this.reference.get();
            }
        }
        return result;
    }
}
