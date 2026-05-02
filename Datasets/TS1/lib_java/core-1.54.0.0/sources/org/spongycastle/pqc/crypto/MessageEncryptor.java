package org.spongycastle.pqc.crypto;

import org.spongycastle.crypto.CipherParameters;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/crypto/MessageEncryptor.class */
public interface MessageEncryptor {
    void init(boolean z, CipherParameters cipherParameters);

    byte[] messageEncrypt(byte[] bArr) throws Exception;

    byte[] messageDecrypt(byte[] bArr) throws Exception;
}
