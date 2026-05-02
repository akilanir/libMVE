package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/GSSContext.class */
public interface GSSContext {
    void create(String str, String str2) throws JSchException;

    boolean isEstablished();

    byte[] init(byte[] bArr, int i, int i2) throws JSchException;

    byte[] getMIC(byte[] bArr, int i, int i2);

    void dispose();
}
