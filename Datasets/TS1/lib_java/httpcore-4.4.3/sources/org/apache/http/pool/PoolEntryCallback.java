package org.apache.http.pool;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/pool/PoolEntryCallback.class */
public interface PoolEntryCallback<T, C> {
    void process(PoolEntry<T, C> poolEntry);
}
