package com.jcraft.jsch.jce;

import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.DSAPrivateKeySpec;
import java.security.spec.DSAPublicKeySpec;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/jce/SignatureDSA.class */
public class SignatureDSA implements com.jcraft.jsch.SignatureDSA {
    Signature signature;
    KeyFactory keyFactory;

    @Override // com.jcraft.jsch.Signature
    public void init() throws Exception {
        this.signature = Signature.getInstance("SHA1withDSA");
        this.keyFactory = KeyFactory.getInstance("DSA");
    }

    @Override // com.jcraft.jsch.SignatureDSA
    public void setPubKey(byte[] y, byte[] p, byte[] q, byte[] g) throws Exception {
        DSAPublicKeySpec dsaPubKeySpec = new DSAPublicKeySpec(new BigInteger(y), new BigInteger(p), new BigInteger(q), new BigInteger(g));
        PublicKey pubKey = this.keyFactory.generatePublic(dsaPubKeySpec);
        this.signature.initVerify(pubKey);
    }

    @Override // com.jcraft.jsch.SignatureDSA
    public void setPrvKey(byte[] x, byte[] p, byte[] q, byte[] g) throws Exception {
        DSAPrivateKeySpec dsaPrivKeySpec = new DSAPrivateKeySpec(new BigInteger(x), new BigInteger(p), new BigInteger(q), new BigInteger(g));
        PrivateKey prvKey = this.keyFactory.generatePrivate(dsaPrivKeySpec);
        this.signature.initSign(prvKey);
    }

    @Override // com.jcraft.jsch.Signature
    public byte[] sign() throws Exception {
        byte[] sig = this.signature.sign();
        int index = 3 + 1;
        int len = sig[3] & 255;
        byte[] r = new byte[len];
        System.arraycopy(sig, index, r, 0, r.length);
        int index2 = index + len + 1;
        int index3 = index2 + 1;
        byte[] s = new byte[sig[index2] & 255];
        System.arraycopy(sig, index3, s, 0, s.length);
        byte[] result = new byte[40];
        System.arraycopy(r, r.length > 20 ? 1 : 0, result, r.length > 20 ? 0 : 20 - r.length, r.length > 20 ? 20 : r.length);
        System.arraycopy(s, s.length > 20 ? 1 : 0, result, s.length > 20 ? 20 : 40 - s.length, s.length > 20 ? 20 : s.length);
        return result;
    }

    @Override // com.jcraft.jsch.Signature
    public void update(byte[] foo) throws Exception {
        this.signature.update(foo);
    }

    @Override // com.jcraft.jsch.Signature
    public boolean verify(byte[] sig) throws Exception {
        if (sig[0] == 0 && sig[1] == 0 && sig[2] == 0) {
            int i = 0 + 1;
            int i2 = i + 1;
            int i3 = ((sig[0] << 24) & (-16777216)) | ((sig[i] << 16) & 16711680);
            int i4 = i2 + 1;
            int i5 = i4 + 1 + (i3 | ((sig[i2] << 8) & 65280) | (sig[i4] & 255));
            int i6 = i5 + 1;
            int i7 = i6 + 1;
            int i8 = ((sig[i5] << 24) & (-16777216)) | ((sig[i6] << 16) & 16711680);
            int i9 = i7 + 1;
            int j = i8 | ((sig[i7] << 8) & 65280) | (sig[i9] & 255);
            byte[] tmp = new byte[j];
            System.arraycopy(sig, i9 + 1, tmp, 0, j);
            sig = tmp;
        }
        int frst = (sig[0] & 128) != 0 ? 1 : 0;
        int scnd = (sig[20] & 128) != 0 ? 1 : 0;
        int length = sig.length + 6 + frst + scnd;
        byte[] tmp2 = new byte[length];
        tmp2[0] = 48;
        tmp2[1] = 44;
        tmp2[1] = (byte) (tmp2[1] + frst);
        tmp2[1] = (byte) (tmp2[1] + scnd);
        tmp2[2] = 2;
        tmp2[3] = 20;
        tmp2[3] = (byte) (tmp2[3] + frst);
        System.arraycopy(sig, 0, tmp2, 4 + frst, 20);
        tmp2[4 + tmp2[3]] = 2;
        tmp2[5 + tmp2[3]] = 20;
        int i10 = 5 + tmp2[3];
        tmp2[i10] = (byte) (tmp2[i10] + scnd);
        System.arraycopy(sig, 20, tmp2, 6 + tmp2[3] + scnd, 20);
        return this.signature.verify(tmp2);
    }
}
