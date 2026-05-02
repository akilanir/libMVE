package org.apache.commons.lang3.concurrent;

/* loaded from: commons-lang3-3.4.jar:org/apache/commons/lang3/concurrent/ConcurrentInitializer.class */
public interface ConcurrentInitializer<T> {
    T get() throws ConcurrentException;
}
