package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Compression.class */
public interface Compression {
    public static final int INFLATER = 0;
    public static final int DEFLATER = 1;

    void init(int i, int i2);

    byte[] compress(byte[] bArr, int i, int[] iArr);

    byte[] uncompress(byte[] bArr, int i, int[] iArr);
}
