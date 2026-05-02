package com.jcraft.jsch.jcraft;

import java.security.MessageDigest;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/jcraft/HMAC.class */
class HMAC {
    private static final int B = 64;
    private byte[] k_ipad = null;
    private byte[] k_opad = null;
    private MessageDigest md = null;
    private int bsize = 0;
    private final byte[] tmp = new byte[4];

    HMAC() {
    }

    protected void setH(MessageDigest md) {
        this.md = md;
        this.bsize = md.getDigestLength();
    }

    public int getBlockSize() {
        return this.bsize;
    }

    public void init(byte[] key) throws Exception {
        this.md.reset();
        if (key.length > this.bsize) {
            byte[] tmp = new byte[this.bsize];
            System.arraycopy(key, 0, tmp, 0, this.bsize);
            key = tmp;
        }
        if (key.length > B) {
            this.md.update(key, 0, key.length);
            key = this.md.digest();
        }
        this.k_ipad = new byte[B];
        System.arraycopy(key, 0, this.k_ipad, 0, key.length);
        this.k_opad = new byte[B];
        System.arraycopy(key, 0, this.k_opad, 0, key.length);
        for (int i = 0; i < B; i++) {
            byte[] bArr = this.k_ipad;
            int i2 = i;
            bArr[i2] = (byte) (bArr[i2] ^ 54);
            byte[] bArr2 = this.k_opad;
            int i3 = i;
            bArr2[i3] = (byte) (bArr2[i3] ^ 92);
        }
        this.md.update(this.k_ipad, 0, B);
    }

    public void update(int i) {
        this.tmp[0] = (byte) (i >>> 24);
        this.tmp[1] = (byte) (i >>> 16);
        this.tmp[2] = (byte) (i >>> 8);
        this.tmp[3] = (byte) i;
        update(this.tmp, 0, 4);
    }

    public void update(byte[] foo, int s, int l) {
        this.md.update(foo, s, l);
    }

    public void doFinal(byte[] buf, int offset) {
        byte[] result = this.md.digest();
        this.md.update(this.k_opad, 0, B);
        this.md.update(result, 0, this.bsize);
        try {
            this.md.digest(buf, offset, this.bsize);
        } catch (Exception e) {
        }
        this.md.update(this.k_ipad, 0, B);
    }
}
