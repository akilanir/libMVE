package com.octo.android.robospice.persistence.memory;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/memory/CacheItem.class */
public class CacheItem<T> {
    private final long creationDate;
    private final T data;

    public CacheItem(T data) {
        this.creationDate = System.currentTimeMillis();
        this.data = data;
    }

    public CacheItem(long creationDate, T data) {
        this.creationDate = creationDate;
        this.data = data;
    }

    public long getCreationDate() {
        return this.creationDate;
    }

    public T getData() {
        return this.data;
    }
}
