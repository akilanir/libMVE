package com.jcraft.jsch.jce;

import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PublicKey;
import javax.crypto.KeyAgreement;
import javax.crypto.interfaces.DHPublicKey;
import javax.crypto.spec.DHParameterSpec;
import javax.crypto.spec.DHPublicKeySpec;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/jce/DH.class */
public class DH implements com.jcraft.jsch.DH {
    BigInteger p;
    BigInteger g;
    BigInteger e;
    byte[] e_array;
    BigInteger f;
    BigInteger K;
    byte[] K_array;
    private KeyPairGenerator myKpairGen;
    private KeyAgreement myKeyAgree;

    @Override // com.jcraft.jsch.DH
    public void init() throws Exception {
        this.myKpairGen = KeyPairGenerator.getInstance("DH");
        this.myKeyAgree = KeyAgreement.getInstance("DH");
    }

    @Override // com.jcraft.jsch.DH
    public byte[] getE() throws Exception {
        if (this.e == null) {
            DHParameterSpec dhSkipParamSpec = new DHParameterSpec(this.p, this.g);
            this.myKpairGen.initialize(dhSkipParamSpec);
            KeyPair myKpair = this.myKpairGen.generateKeyPair();
            this.myKeyAgree.init(myKpair.getPrivate());
            myKpair.getPublic().getEncoded();
            this.e = ((DHPublicKey) myKpair.getPublic()).getY();
            this.e_array = this.e.toByteArray();
        }
        return this.e_array;
    }

    @Override // com.jcraft.jsch.DH
    public byte[] getK() throws Exception {
        if (this.K == null) {
            KeyFactory myKeyFac = KeyFactory.getInstance("DH");
            DHPublicKeySpec keySpec = new DHPublicKeySpec(this.f, this.p, this.g);
            PublicKey yourPubKey = myKeyFac.generatePublic(keySpec);
            this.myKeyAgree.doPhase(yourPubKey, true);
            byte[] mySharedSecret = this.myKeyAgree.generateSecret();
            this.K = new BigInteger(mySharedSecret);
            this.K_array = this.K.toByteArray();
            this.K_array = mySharedSecret;
        }
        return this.K_array;
    }

    @Override // com.jcraft.jsch.DH
    public void setP(byte[] p) {
        setP(new BigInteger(p));
    }

    @Override // com.jcraft.jsch.DH
    public void setG(byte[] g) {
        setG(new BigInteger(g));
    }

    @Override // com.jcraft.jsch.DH
    public void setF(byte[] f) {
        setF(new BigInteger(f));
    }

    void setP(BigInteger p) {
        this.p = p;
    }

    void setG(BigInteger g) {
        this.g = g;
    }

    void setF(BigInteger f) {
        this.f = f;
    }
}
