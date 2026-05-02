package com.danikula.videocache;

/* loaded from: videocache-2.3.3.jar:com/danikula/videocache/Source.class */
public interface Source {
    void open(int i) throws ProxyCacheException;

    int length() throws ProxyCacheException;

    int read(byte[] bArr) throws ProxyCacheException;

    void close() throws ProxyCacheException;
}
