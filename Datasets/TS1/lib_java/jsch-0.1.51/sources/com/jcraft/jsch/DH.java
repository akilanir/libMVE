package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/DH.class */
public interface DH {
    void init() throws Exception;

    void setP(byte[] bArr);

    void setG(byte[] bArr);

    byte[] getE() throws Exception;

    void setF(byte[] bArr);

    byte[] getK() throws Exception;
}
