package org.spongycastle.crypto.tls;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsPSKIdentityManager.class */
public interface TlsPSKIdentityManager {
    byte[] getHint();

    byte[] getPSK(byte[] bArr);
}
