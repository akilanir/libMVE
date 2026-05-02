package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Cipher.class */
public interface Cipher {
    public static final int ENCRYPT_MODE = 0;
    public static final int DECRYPT_MODE = 1;

    int getIVSize();

    int getBlockSize();

    void init(int i, byte[] bArr, byte[] bArr2) throws Exception;

    void update(byte[] bArr, int i, int i2, byte[] bArr2, int i3) throws Exception;

    boolean isCBC();
}
