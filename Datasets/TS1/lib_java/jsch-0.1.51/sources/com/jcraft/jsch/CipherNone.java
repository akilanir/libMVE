package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/CipherNone.class */
public class CipherNone implements Cipher {
    private static final int ivsize = 8;
    private static final int bsize = 16;

    @Override // com.jcraft.jsch.Cipher
    public int getIVSize() {
        return 8;
    }

    @Override // com.jcraft.jsch.Cipher
    public int getBlockSize() {
        return bsize;
    }

    @Override // com.jcraft.jsch.Cipher
    public void init(int mode, byte[] key, byte[] iv) throws Exception {
    }

    @Override // com.jcraft.jsch.Cipher
    public void update(byte[] foo, int s1, int len, byte[] bar, int s2) throws Exception {
    }

    @Override // com.jcraft.jsch.Cipher
    public boolean isCBC() {
        return false;
    }
}
