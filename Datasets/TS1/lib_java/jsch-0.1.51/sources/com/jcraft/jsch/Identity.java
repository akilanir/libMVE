package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Identity.class */
public interface Identity {
    boolean setPassphrase(byte[] bArr) throws JSchException;

    byte[] getPublicKeyBlob();

    byte[] getSignature(byte[] bArr);

    boolean decrypt();

    String getAlgName();

    String getName();

    boolean isEncrypted();

    void clear();
}
