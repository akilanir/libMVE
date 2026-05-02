package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/MAC.class */
public interface MAC {
    String getName();

    int getBlockSize();

    void init(byte[] bArr) throws Exception;

    void update(byte[] bArr, int i, int i2);

    void update(int i);

    void doFinal(byte[] bArr, int i);
}
