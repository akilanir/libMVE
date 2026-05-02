package org.spongycastle.crypto.tls;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsPSKIdentity.class */
public interface TlsPSKIdentity {
    void skipIdentityHint();

    void notifyIdentityHint(byte[] bArr);

    byte[] getPSKIdentity();

    byte[] getPSK();
}
