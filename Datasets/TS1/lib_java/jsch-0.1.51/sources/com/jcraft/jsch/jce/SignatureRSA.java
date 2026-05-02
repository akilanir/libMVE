package com.jcraft.jsch.jce;

import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/jce/SignatureRSA.class */
public class SignatureRSA implements com.jcraft.jsch.SignatureRSA {
    Signature signature;
    KeyFactory keyFactory;

    @Override // com.jcraft.jsch.Signature
    public void init() throws Exception {
        this.signature = Signature.getInstance("SHA1withRSA");
        this.keyFactory = KeyFactory.getInstance("RSA");
    }

    @Override // com.jcraft.jsch.SignatureRSA
    public void setPubKey(byte[] e, byte[] n) throws Exception {
        RSAPublicKeySpec rsaPubKeySpec = new RSAPublicKeySpec(new BigInteger(n), new BigInteger(e));
        PublicKey pubKey = this.keyFactory.generatePublic(rsaPubKeySpec);
        this.signature.initVerify(pubKey);
    }

    @Override // com.jcraft.jsch.SignatureRSA
    public void setPrvKey(byte[] d, byte[] n) throws Exception {
        RSAPrivateKeySpec rsaPrivKeySpec = new RSAPrivateKeySpec(new BigInteger(n), new BigInteger(d));
        PrivateKey prvKey = this.keyFactory.generatePrivate(rsaPrivKeySpec);
        this.signature.initSign(prvKey);
    }

    @Override // com.jcraft.jsch.Signature
    public byte[] sign() throws Exception {
        byte[] sig = this.signature.sign();
        return sig;
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
        return this.signature.verify(sig);
    }
}
