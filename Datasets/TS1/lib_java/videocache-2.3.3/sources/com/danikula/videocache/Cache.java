package com.danikula.videocache;

/* loaded from: videocache-2.3.3.jar:com/danikula/videocache/Cache.class */
public interface Cache {
    int available() throws ProxyCacheException;

    int read(byte[] bArr, long j, int i) throws ProxyCacheException;

    void append(byte[] bArr, int i) throws ProxyCacheException;

    void close() throws ProxyCacheException;

    void complete() throws ProxyCacheException;

    boolean isCompleted();
}
