package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/SignatureRSA.class */
public interface SignatureRSA extends Signature {
    void setPubKey(byte[] bArr, byte[] bArr2) throws Exception;

    void setPrvKey(byte[] bArr, byte[] bArr2) throws Exception;
}
