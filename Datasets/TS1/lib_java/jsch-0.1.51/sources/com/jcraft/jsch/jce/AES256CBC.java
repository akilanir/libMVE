package com.jcraft.jsch.jce;

import com.jcraft.jsch.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/jce/AES256CBC.class */
public class AES256CBC implements Cipher {
    private static final int ivsize = 16;
    private static final int bsize = 32;
    private javax.crypto.Cipher cipher;

    @Override // com.jcraft.jsch.Cipher
    public int getIVSize() {
        return ivsize;
    }

    @Override // com.jcraft.jsch.Cipher
    public int getBlockSize() {
        return bsize;
    }

    @Override // com.jcraft.jsch.Cipher
    public void init(int mode, byte[] key, byte[] iv) throws Exception {
        if (iv.length > ivsize) {
            byte[] tmp = new byte[ivsize];
            System.arraycopy(iv, 0, tmp, 0, tmp.length);
            iv = tmp;
        }
        if (key.length > bsize) {
            byte[] tmp2 = new byte[bsize];
            System.arraycopy(key, 0, tmp2, 0, tmp2.length);
            key = tmp2;
        }
        try {
            SecretKeySpec keyspec = new SecretKeySpec(key, "AES");
            this.cipher = javax.crypto.Cipher.getInstance("AES/CBC/NoPadding");
            synchronized (javax.crypto.Cipher.class) {
                this.cipher.init(mode == 0 ? 1 : 2, keyspec, new IvParameterSpec(iv));
            }
        } catch (Exception e) {
            this.cipher = null;
            throw e;
        }
    }

    @Override // com.jcraft.jsch.Cipher
    public void update(byte[] foo, int s1, int len, byte[] bar, int s2) throws Exception {
        this.cipher.update(foo, s1, len, bar, s2);
    }

    @Override // com.jcraft.jsch.Cipher
    public boolean isCBC() {
        return true;
    }
}
