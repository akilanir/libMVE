package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/SignatureDSA.class */
public interface SignatureDSA extends Signature {
    void setPubKey(byte[] bArr, byte[] bArr2, byte[] bArr3, byte[] bArr4) throws Exception;

    void setPrvKey(byte[] bArr, byte[] bArr2, byte[] bArr3, byte[] bArr4) throws Exception;
}
