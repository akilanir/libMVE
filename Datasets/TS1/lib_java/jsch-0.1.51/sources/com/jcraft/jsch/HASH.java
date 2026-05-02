package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/HASH.class */
public interface HASH {
    void init() throws Exception;

    int getBlockSize();

    void update(byte[] bArr, int i, int i2) throws Exception;

    byte[] digest() throws Exception;
}
