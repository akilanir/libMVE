package org.apache.commons.lang3.concurrent;

/* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/concurrent/ConcurrentInitializer.class */
public interface ConcurrentInitializer<T> {
    T get() throws ConcurrentException;
}
