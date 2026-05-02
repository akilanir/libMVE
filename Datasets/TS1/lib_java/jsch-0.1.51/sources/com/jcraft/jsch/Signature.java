package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Signature.class */
public interface Signature {
    void init() throws Exception;

    void update(byte[] bArr) throws Exception;

    boolean verify(byte[] bArr) throws Exception;

    byte[] sign() throws Exception;
}
